
module Speculator
  module Make

    class SpecMaker < Speculator::Make::ExpectReturnMaker

      def initialize classname, methods_to_test, classes_to_stub, org_track_info, target_path
        @classname = classname
        @methods_to_test = methods_to_test
        @classes_to_stub = classes_to_stub
        @org_track_info = org_track_info
        @target_path = Pathname.new(target_path).realpath
      end

      def self.make_spec classname, methods_to_test, classes_to_stub, org_track_info, target_path
        puts "target_path=#{target_path}\n"
        self.new(classname, methods_to_test, classes_to_stub, org_track_info, target_path).make
      end

      def make
        # puts "org_track_info: "; pp @org_track_info

        class_file = ActiveSupport::Inflector.underscore(ActiveSupport::Inflector.demodulize(@classname))
        puts "class_file=#{class_file}\n"
        File.open(@target_path.to_s + '/' + class_file + '_auto_spec.rb', 'w') do |file|

          content_text = "require 'speculator'\n"

          source_for_classes = Set.new
          @org_track_info[@classname.to_s].each do |method_name, mti|
            mti.each do |call_id, use_case_info|
              source_for_classes << use_case_info[:source_location].first
            end
          end

          source_for_classes.each do |source_for_class|
            path, relative = source_for_class

            if relative
              relative_file = Pathname.new(path).relative_path_from(@target_path).to_s
              content_text << "require_relative '#{relative_file}'\n\n"
            else
              content_text << "require '#{path}'\n\n"
            end
          end

          @classes_to_stub.each do |stub_class|
            content_text << StubClassMaker.make_stub_code(stub_class, @org_track_info[stub_class])
          end

          if @org_track_info.has_key? @classname.to_s
            @org_track_info[@classname.to_s].each do |methodname, mti|

              next unless @methods_to_test.map {|m| m.to_s }.include? methodname.to_s

              content_text << make_describe(methodname) do

                num_use_cases = mti.count

                cases_text = ''
                mti.each do |call_id, use_case_info|

                  call_info = use_case_info

                  cases_text << make_use_case( (num_use_cases==1), methodname, call_id) do

                    case_text = ''
                    case_text << make_instance_init(call_id, call_info) unless call_info[:is_class_method]

                    case_text << make_method_call(call_id, call_info, use_case_info)

                    case_text << make_expect(call_id,  call_info, use_case_info)
                  end
                end
                cases_text
              end
            end

            file.write(content_text)
          else
            puts "class: #{classname} has no data logged\n"
          end
        end
      end

      #def self.extract_call_info(use_case_info)
      #  pp use_case_info
      #  use_case_info.find { |i| i[:op] == :tracked_call}
      #end

      def make_describe(methodname)
        res = "\ndescribe #{@classname}, '\##{methodname}' do\n"

        res << yield

        res << "\nend\n"
      end

      def make_use_case is_single, methodname, case_id
        res = "\n  it 'implements #{methodname}"
        if !is_single
          res << " for use case #{case_id}"
        end
        res << "' do\n\n"

        res << yield

        res << "\n  end\n"
      end

      def make_instance_init(case_id, call_info)
        #  res =  "    iut = #{call_info[:classname]}.allocate\n\n"      # We don't construct it normally, because instance variables
        #  res << "    ivs = YAML.load <<'END_IVS'\n"
        #  res << YAML.dump( call_info[:instance_variables])
        #  res << "END_IVS\n"
        #  res << "    Speculator::Util::VariableDeserialize.from_struct(ivs).each {|varname, varvalue| iut.instance_variable_set(varname, varvalue)}\n\n"
        res = "    iut = Object.x_build('#{call_info[:classname]}', #{call_info[:instance_variables]})\n\n"
      end

      def make_method_call(call_id, call_info, use_case_info)
        #res = "    args = YAML.load <<'END_ARGS'\n"
        #res << YAML.dump( call_info[:args])
        #res << "END_ARGS\n"
        #res << "    args = Speculator::Util::VariableDeserialize.from_struct(args)\n"

        target = call_info[:is_class_method] ? call_info[:classname] : 'iut'

        res = "    res = #{target}.#{call_info[:methodname]} *#{call_info[:args]}"

        if call_info.has_key? :block
          res << make_block( call_info[:block])
        end

        res << "\n\n"
      end

      def make_block(block_info)
        res = " do |*block_args|\n"
        res << make_expect_return(:block_args,
                                  block_info.each_with_index.map { |bi, idx| [idx, nil, bi[:args], bi[:res]]},
                                  'next')
        res << "  end\n";
      end

      def make_expect(call_id,  call_info, use_case_info)
        #res = "    expected = YAML.load <<'END_EXPECTED'\n"
        #res << YAML.dump( remove_stubbed call_info[:res])
        #res << "END_EXPECTED\n"
        #res << "    expected = Speculator::Util::VariableDeserialize.from_struct(expected)\n\n"

        # TODO: remove stubs
        "    res.should eql(#{call_info[:res]})\n\n"
      end

      # This should removed stubbed references
      # TODO: needs TLC around hashes, but we are rewriting anyway
      def remove_stubbed(v)
        # puts "remove_stubbed: #{v.inspect} #{@classes_to_stub}\n"
        if v.is_a?(Hash) && @classes_to_stub.include?( v[:class_name] )
          r = v.clone
          r[:initializers] = {}
          r
        elsif v.is_a?(Array)
          v.map { |iv| remove_stubbed iv }
        else
          v
        end
      end

      def self.make_from_redis(classname, methods_to_test, classes_to_stub, target_path)
        redis = Redis.new(host: '127.0.0.1', port: 6379, db: 1)
        ti_yaml = redis.get Speculator::Track::TrackToRedis::TRACK_INFO_KEY

       # puts "make_from_redis ti_yaml======\n#{ti_yaml}\n========\n"
        ti = YAML.load_stream ti_yaml

        oti = Speculator::Make::OrganiseTrackInfo.organize ti

        Speculator::Make::SpecMaker.make_spec( classname, methods_to_test, classes_to_stub, oti, target_path)
      end
    end

#def Object.const_missing(name)
#  puts "const_missing: #{name}"
#  if name == :Ca || name == :Cb
#    Object.const_set(name, Class.new)
#  else
#    raise "Class not found #{name}"
#  end
#end

# SpecMaker.make_from_redis 'StubCaller', ['Ca', 'Cb']

  end
end

