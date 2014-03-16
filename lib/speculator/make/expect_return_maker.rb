module Speculator
  module Make

    class ExpectReturnMaker

      def make_expect_return(arg_var, calls, out='return')
        res = "  possible_arg_lists = {}\n"
        res << "  possible_results = {}\n"

        calls.each do |call|
          call_id, first_optional, args, returned = call

          #res << "  possible_arg_lists[#{call_id}] = [#{first_optional.inspect}, Speculator::Util::VariableDeserialize.from_struct(YAML.load <<END_PA#{call_id}\n"
          #res << YAML.dump( if args.is_a?(Array)
          #  Hash[ args.each_with_index.map {|a, idx| ["a_#{idx}", a]}]
          #else
          #  args
          #end)
          #
          #res << "END_PA#{call_id}\n)]\n"

          res << "  possible_arg_lists[#{call_id}] = [#{first_optional.inspect}, #{args}]\n"
          #res << "  possible_results[#{call_id}] = Speculator::Util::VariableDeserialize.from_struct(YAML.load <<END_PR#{call_id}\n"
          #res << YAML.dump(returned)
          #res << "END_PR#{call_id}\n)\n"
          res << "  possible_results[#{call_id}] = #{returned}\n"
        end

        res << "  return_result = nil\n  found_result=false\n"
        res << "  possible_arg_lists.each do | call_id, poss_arg |\n"
        res << "    if Speculator::Util::StubSupport.args_equal(#{arg_var.to_s},poss_arg)\n"
        res << "      return_result = possible_results[call_id]\n"
        res << "      found_result = true\n"
        res << "      break\n"
        res << "    end\n"
        res << "  end\n"
        res << '  fail "#{' + arg_var.to_s + '.inspect} not expected"' + " unless found_result\n"
        res << "  return_result\n"
      end
    end
  end
end
