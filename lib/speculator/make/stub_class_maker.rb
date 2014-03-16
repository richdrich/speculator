module Speculator
  module Make

    class StubClassMaker < Speculator::Make::ExpectReturnMaker

      def self.make_stub_code(stub_class, class_tracked_info)
        self.new.make stub_class, class_tracked_info
      end

      def make stub_class, class_tracked_info
        res_text = make_class(stub_class) do

          class_text = make_constructor(stub_class)

          class_tracked_info.each do |method_name, method_def|
            class_text << make_method(method_name, method_def)
          end

          class_text << make_eql

          class_text
        end
      end

      # For expectations, always return true
      # if we are the same type of object
      # TODO is to deal with state, also
      # case when this is called from the class under test
      def make_eql
        res = "def eql? other\n"
        res << "other.is_a? self.class\n"
        res << "end\n\n"
      end

      def make_class(class_name)
        res = "class #{class_name}\n";
        res << yield
        res << "end\n"
      end

      def make_constructor(class_name)
        #res = "@@sequential_instance = 1\n"
        #res << "def initialize(instance_constructing = nil)\n"
        #res << "  if instance_constructing == nil\n"
        #res << "   @instance_id = @@sequential_instance\n"
        #res << "  else\n"
        #res << "   @instance_id = instance_constructing\n"
        #res << "  end\n"
        #res << "end\n"
        '' # do we even need to make a default constructor
      end

      def make_method(method_name, method_def)
        # puts "make_method: #{method_def.values.first.inspect}\n"
        res = "def #{method_def.values.first[:is_class_method] ? 'self.' : ''}#{method_name} *method_args\n"

        res << self.make_expect_return(:method_args,
                                       method_def.map { |call_id, call_info| [call_id, call_info[:first_optional], call_info[:args], call_info[:res]] })

        res << "end\n"

      end
    end
  end
end
