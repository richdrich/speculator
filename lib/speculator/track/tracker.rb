module Speculator
  module Track

    class Tracker

      @@call_id = 0
      @@tracked_methods = Set.new
      @@tracked_classes = Set.new
      @@rebindings = {}

      def self.untrack!
        @@rebindings.each { |qname, rb| rb[:target].send( :alias_method, rb[:methodname], "orig_#{rb[:methodname]}".to_sym) }
      end

      def self.track_function(qname, track_classes, &track_handler)
        classname, methodname = qname.split '.'
        # puts "track_function #{qname} #{track_classes.inspect}"

        @@tracked_methods << qname
        @@tracked_classes |= track_classes.map { |tc| tc.to_sym }

        # puts "@@tracked_classes=#{@@tracked_classes.inspect}\n"

        mod = Object.qualified_const_get(classname)
        1.times do

          if mod.method_defined? methodname
            is_class_method = false
            tracked_unbound_method = mod.instance_method(methodname)
            def_target = mod
            # puts "redefine instance method #{methodname} on #{def_target.inspect}; tracked_unbound_method=#{tracked_unbound_method}\n"
          else
            is_class_method = true
            def_target = (class << mod; self; end)
            # pp def_target
            if def_target.method_defined? methodname
              tracked_unbound_method = def_target.instance_method(methodname)
              # puts "redefine class method #{methodname} on #{def_target.inspect}; tracked_unbound_method=#{tracked_unbound_method}\n"
            else
              puts "#{methodname} is not defined on #{classname} as class or instance method"
              return
            end
          end

          @@rebindings[qname] = {unbound_method: tracked_unbound_method, target: def_target, methodname: methodname}

          def_target.send( :alias_method, "orig_#{methodname}".to_sym, methodname)

          def_target.send( :define_method, methodname) { |*args, &block|
            # puts "tracked #{methodname}, #{args.inspect}, is_class_method=#{is_class_method}, tracked_unbound_method=#{tracked_unbound_method}\n"

            if !is_class_method
              # get the instance variables
              instance_variable_defs = self.instance_variables.inject({}) do |ivs, ivname|
                ivs.merge({ivname => self.instance_variable_get(ivname)})
              end

              # Turn any accessors into explicit functions
              self.instance_variables.map {|iv| rdr = iv.to_s[1..-1];  self.respond_to?( rdr) ? rdr : nil  }
              .compact.each do |acc|
                self.class.send(:define_method, acc) { self.instance_variable_get("@#{acc}") }
              end
            end

            # set tracking
            @@track_handler = track_handler
            set_trace_func @@tracer_func

            method_binding = tracked_unbound_method.bind(self)
            # puts "method_binding=#{method_binding.inspect}"

            if block
              block_call_info = []

              res = method_binding.(*args) do |*block_args|
                block_instance_info = {
                    :args => block_args,
                    # :arg_ids => Speculator::Track::Tracker::identify_objects(block_args)
                }

                # puts "proxied block args=#{block_args.inspect}\n"
                block_res = block.call( *block_args )
                # puts "proxied block returns #{res}\n"

                block_instance_info[:res] = block_res
                # block_instance_info[:res_ids] = Speculator::Track::Tracker::identify_object(block_res)
                block_call_info << block_instance_info

                block_res
              end
            else
              res = method_binding.(*args)
            end

            set_trace_func nil

            # puts "Returned #{res}"

            track_info = {
                :op => :tracked_call,
                :classname => classname,
                :source_location => Speculator::Track::Tracker::load_source_path(tracked_unbound_method.source_location.first),
                :methodname => methodname,
                :call_id => @@call_id,
                :qname => qname,
                :args => args,
                #:arg_ids => Speculator::Track::Tracker::identify_objects(args),
                :res => res,
                #:res_ids => Speculator::Track::Tracker::identify_object(res),
                :is_class_method => is_class_method,
            }

            if block_call_info && !block_call_info.empty?
              track_info[:block] = block_call_info
            end

            if(!is_class_method)
              track_info[:instance_variables] = instance_variable_defs
              # track_info[:instance_variable_ids] = Speculator::Track::Tracker::identify_objects instance_variable_defs.values
            end

            track_handler.call track_info

            @@call_id += 1

            res
          }
        end
      end

      @@tracer_func = proc do |event, file, line, id, binding, klass|
        # puts "trace: %8s %s:%-2d %10s %8s\n" % [event, file, line, id, klass]

        if  event.to_s=='call' || event.to_s=='line'
          if eval('__method__', binding).nil?
            # puts "method: <nil>\n";
            next
          end

          # pp eval('local_variables', binding)

          if (event.to_s == 'call' && (! @@tracked_methods.include?("#{klass}.#{id}")) &&
              @@tracked_classes.include?(klass.name.to_sym))
            arg_arr = []
            arg_vals = {}
            first_optional = nil

            instance_object = eval('self', binding)

            params = eval('method(__method__).parameters', binding)
            params.each_with_index do |param, param_idx|
              case param[0]
                when :req, :opt
                  arg_arr << param[1]
                  arg_vals[param[1]] = eval(param[1].to_s, binding)
                  first_optional = param_idx if(param[0] == :opt)
                when :rest
                  splatarg = '*' + param[1].to_s
                  arg_arr << splatarg
                  arg_isopts << false
                  # puts "Try to eval: #{splatarg}"
                  arg_vals[splatarg] = eval(splatarg, binding)
                else
                  puts "Need handler for type #{param[0]}"
              end
            end

            call_expr = "#{id}( #{arg_arr.join(',')} )"

            if id.to_s == 'alias'
              call_expr = 'self.' + call_expr
            end

            # puts "Call on #{binding.inspect} with <#{call_expr}>"
            res = eval(call_expr, binding)
            # puts "sub-method #{id} returned #{res}"

            @@track_handler.call :op => :sub_call,
                                 :classname => klass.to_s,
                                 :methodname => id,
                                 :call_id => @@call_id,
                                 :is_class_method => instance_object.kind_of?(Class),
                                 :qname => "#{klass}.#{id}",
                                 :args => arg_vals,
                                 :first_optional => first_optional,
                                 #:arg_ids => Speculator::Track::Tracker::identify_objects(arg_vals),
                                 :instance_object => instance_object,
                                 #:instance_object_id => Speculator::Track::Tracker.identify_object(instance_object),
                                 :res => res
            # :res_ids => Speculator::Track::Tracker.identify_object(res)
            @@call_id += 1

            # eval("return #{res.inspect}", binding)
          end
        end

      end

      def self.tracer_func
        @@tracer_func
      end

      def self.identify_objects(varlist, seen=[])
        # debugger
        varlist.map { |var| self.identify_object(var, seen) }
      end

      def self.identify_object(var, seen=[])
        if seen.empty?
          puts "identify: "; pp var
        end

        if var.is_a? Enumerable
          if seen.include? var.object_id
            nil
          else
            self.identify_objects(var, seen)
          end
        else
          seen << var.object_id
          var.object_id
        end
      end

      def self.load_source_path(module_source_path)

        # Is it a GEM path
        module_pathname = Pathname.new(module_source_path).cleanpath.to_s

        gem_libs = Hash[Gem.loaded_specs.map do |gem_name, spec|
          [Pathname.new(File.join(spec.full_gem_path, 'lib')).cleanpath.to_s, gem_name ]
        end]

        gem_libs.each do |gem_lib, gem_name|
            if module_pathname.start_with? gem_lib
              return [gem_name, false]     # It's a gem - load it from $LOAD_PATH
            end
        end

        [module_source_path, true]
      end

    end

  end
end

