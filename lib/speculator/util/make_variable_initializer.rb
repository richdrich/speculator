module Speculator
  module Util
    class MakeVariableInitializer

      def self.to_init(x, wrap=true)

        case x
          when String, Regexp, Numeric, Integer, Bignum, Float, Symbol
            x.inspect

          when NilClass
            'nil'

          when FalseClass
            'false'

          when TrueClass
            'true'

          when Array
            '[' + x.map { |v| self.to_init(v) }.join(', ') + ']'

          when Hash
            (wrap ? '{' : '') + x.map { |k, v| "#{self.to_init(k)} => #{self.to_init(v)}" }.join(', ') + (wrap ? '}' : '')

          else
            init_hash = Hash[x.instance_variables.map do |iv_name|
              [iv_name, x.instance_variable_get(iv_name)]
            end]

            "Object.x_build('#{x.class.name}', #{self.to_init(init_hash, false)})"
        end
      end
    end
  end
end
