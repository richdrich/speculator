module Speculator
  module Util

    class VariableDeserialize

      # convert s back to usable form from VariableSerialize output
      def self.from_struct(s)

        if s.instance_of? Array
          s.map { |ss| self.from_struct(ss) }
        elsif s.instance_of? Hash
          s.each do |op, data|

            case op
              when :hash
                res = {}
                data.each { |k, v| res[k] = self.from_struct(v) }
                return res
              when :literal
                return data
              when :class_name
                case data.to_s
                  when 'NilClass'
                    return nil    # Special for nil
                  when 'TrueClass'
                    return true
                  when 'FalseClass'
                    return false
                  else
                    inst = Object.const_get(data).allocate
                    if s.has_key? :initializers
                      s[:initializers].each do |inst_name, inst_value|
                        inst.instance_variable_set inst_name, self.from_struct(inst_value)
                      end
                    end
                    # puts "Create class #{data} => #{inst}"
                    return inst
                end
            end

          end
        else
          s
        end
      end
    end
  end
end
