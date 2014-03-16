require 'speculator'
require '/Users/richardparratt/RubymineProjects/speculator/test/examples/target.rb'


describe Target, '#munge' do

  it 'implements munge' do

    iut = Object.x_build('Target', {})

    res = iut.munge *[1, 3] do |*block_args|
  possible_arg_lists = {}
  possible_results = {}
  possible_arg_lists[0] = [nil, [1]]
  possible_results[0] = 2
  possible_arg_lists[1] = [nil, [2]]
  possible_results[1] = 4
  possible_arg_lists[2] = [nil, [3]]
  possible_results[2] = 6
  return_result = nil
  found_result=false
  possible_arg_lists.each do | call_id, poss_arg |
    if Speculator::Util::StubSupport.args_equal(block_args,poss_arg)
      return_result = possible_results[call_id]
      found_result = true
      break
    end
  end
  fail "#{block_args.inspect} not expected" unless found_result
  return_result
  end


    res.should eql("2-4-6")


  end

end
