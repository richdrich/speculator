module Speculator
  module Util

    class VariableSerialize

      # convert x to hash with:
      #  class_name => qname of class
      #  initializers => hash of name => instance
      #  or
      #  literal => literal
      def self.to_struct(x)

        case x
          when String, Regexp, Numeric, Integer, Bignum, Float, Symbol
            { :literal => x }

          when Array
            x.map { |v| to_struct(v) }

          when Hash
            res = {}
            x.each { |k,v| res[k] = self.to_struct(v) }
            { :hash => res }

          else
            res = { :class_name => x.class.name,
                    :initializers => {}
            }
            x.instance_variables.each do |iv_name|
              v = x.instance_variable_get(iv_name)
              res[:initializers][iv_name] = self.to_struct(v)
            end
            res
        end
      end
    end

  end
end





