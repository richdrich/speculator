module Speculator
  module Util

    class StubSupport
      def self.args_equal(args, poss_args)
        first_optional, arg_params = poss_args

        #puts "args_equal: poss_args=#{poss_args.inspect}, args=#{args.inspect} first_optional=#{first_optional} arg_array=#{arg_params.values}\n"
        #debugger

        arg_values = arg_params.is_a?(Hash) ? arg_params.values : arg_params
        return true if args==arg_values

        return false if first_optional.nil?

        args == arg_values[0...first_optional]
      end
    end
  end
end
