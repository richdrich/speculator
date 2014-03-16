require 'speculator'
require 'speculator'


describe Speculator::Make::ExpectReturnMaker, '#make_expect_return' do

  it 'implements make_expect_return for use case 27' do

    iut = Object.x_build('Speculator::Make::ExpectReturnMaker', {})

    res = iut.make_expect_return *[:method_args, [[0, 0, "{:k => nil}", "false"], [8, 0, "{:k => 5}", "false"], [11, 0, "{:k => 100}", "false"], [16, 0, "{:k => nil}", "false"], [21, 0, "{:k => nil}", "false"], [24, 0, "{:k => nil}", "false"]]]

    res.should eql("  possible_arg_lists = {}\n  possible_results = {}\n  possible_arg_lists[0] = [0, {:k => nil}]\n  possible_results[0] = false\n  possible_arg_lists[8] = [0, {:k => 5}]\n  possible_results[8] = false\n  possible_arg_lists[11] = [0, {:k => 100}]\n  possible_results[11] = false\n  possible_arg_lists[16] = [0, {:k => nil}]\n  possible_results[16] = false\n  possible_arg_lists[21] = [0, {:k => nil}]\n  possible_results[21] = false\n  possible_arg_lists[24] = [0, {:k => nil}]\n  possible_results[24] = false\n  return_result = nil\n  found_result=false\n  possible_arg_lists.each do | call_id, poss_arg |\n    if Speculator::Util::StubSupport.args_equal(method_args,poss_arg)\n      return_result = possible_results[call_id]\n      found_result = true\n      break\n    end\n  end\n  fail \"\#{method_args.inspect} not expected\" unless found_result\n  return_result\n")


  end

  it 'implements make_expect_return for use case 28' do

    iut = Object.x_build('Speculator::Make::ExpectReturnMaker', {})

    res = iut.make_expect_return *[:method_args, [[1, nil, "{:s => 5}", "7"], [17, nil, "{:s => 0}", "2"], [18, nil, "{:s => 1}", "3"], [19, nil, "{:s => 2}", "4"]]]

    res.should eql("  possible_arg_lists = {}\n  possible_results = {}\n  possible_arg_lists[1] = [nil, {:s => 5}]\n  possible_results[1] = 7\n  possible_arg_lists[17] = [nil, {:s => 0}]\n  possible_results[17] = 2\n  possible_arg_lists[18] = [nil, {:s => 1}]\n  possible_results[18] = 3\n  possible_arg_lists[19] = [nil, {:s => 2}]\n  possible_results[19] = 4\n  return_result = nil\n  found_result=false\n  possible_arg_lists.each do | call_id, poss_arg |\n    if Speculator::Util::StubSupport.args_equal(method_args,poss_arg)\n      return_result = possible_results[call_id]\n      found_result = true\n      break\n    end\n  end\n  fail \"\#{method_args.inspect} not expected\" unless found_result\n  return_result\n")


  end

  it 'implements make_expect_return for use case 29' do

    iut = Object.x_build('Speculator::Make::ExpectReturnMaker', {})

    res = iut.make_expect_return *[:method_args, [[4, nil, "{}", "1234"]]]

    res.should eql("  possible_arg_lists = {}\n  possible_results = {}\n  possible_arg_lists[4] = [nil, {}]\n  possible_results[4] = 1234\n  return_result = nil\n  found_result=false\n  possible_arg_lists.each do | call_id, poss_arg |\n    if Speculator::Util::StubSupport.args_equal(method_args,poss_arg)\n      return_result = possible_results[call_id]\n      found_result = true\n      break\n    end\n  end\n  fail \"\#{method_args.inspect} not expected\" unless found_result\n  return_result\n")


  end

  it 'implements make_expect_return for use case 30' do

    iut = Object.x_build('Speculator::Make::ExpectReturnMaker', {})

    res = iut.make_expect_return *[:method_args, [[9, nil, "{:s => 10}", "15"], [12, nil, "{:s => 12}", "112"]]]

    res.should eql("  possible_arg_lists = {}\n  possible_results = {}\n  possible_arg_lists[9] = [nil, {:s => 10}]\n  possible_results[9] = 15\n  possible_arg_lists[12] = [nil, {:s => 12}]\n  possible_results[12] = 112\n  return_result = nil\n  found_result=false\n  possible_arg_lists.each do | call_id, poss_arg |\n    if Speculator::Util::StubSupport.args_equal(method_args,poss_arg)\n      return_result = possible_results[call_id]\n      found_result = true\n      break\n    end\n  end\n  fail \"\#{method_args.inspect} not expected\" unless found_result\n  return_result\n")


  end

  it 'implements make_expect_return for use case 31' do

    iut = Object.x_build('Speculator::Make::ExpectReturnMaker', {})

    res = iut.make_expect_return *[:method_args, [[22, nil, "{:n => 3}", "\"123\""]]]

    res.should eql("  possible_arg_lists = {}\n  possible_results = {}\n  possible_arg_lists[22] = [nil, {:n => 3}]\n  possible_results[22] = \"123\"\n  return_result = nil\n  found_result=false\n  possible_arg_lists.each do | call_id, poss_arg |\n    if Speculator::Util::StubSupport.args_equal(method_args,poss_arg)\n      return_result = possible_results[call_id]\n      found_result = true\n      break\n    end\n  end\n  fail \"\#{method_args.inspect} not expected\" unless found_result\n  return_result\n")


  end

  it 'implements make_expect_return for use case 32' do

    iut = Object.x_build('Speculator::Make::ExpectReturnMaker', {})

    res = iut.make_expect_return *[:method_args, [[25, nil, "{:k => \"world\"}", "true"]]]

    res.should eql("  possible_arg_lists = {}\n  possible_results = {}\n  possible_arg_lists[25] = [nil, {:k => \"world\"}]\n  possible_results[25] = true\n  return_result = nil\n  found_result=false\n  possible_arg_lists.each do | call_id, poss_arg |\n    if Speculator::Util::StubSupport.args_equal(method_args,poss_arg)\n      return_result = possible_results[call_id]\n      found_result = true\n      break\n    end\n  end\n  fail \"\#{method_args.inspect} not expected\" unless found_result\n  return_result\n")


  end

  it 'implements make_expect_return for use case 33' do

    iut = Object.x_build('Speculator::Make::ExpectReturnMaker', {})

    res = iut.make_expect_return *[:method_args, [[0, 0, "{:k => nil}", "false"], [8, 0, "{:k => 5}", "false"], [11, 0, "{:k => 100}", "false"], [16, 0, "{:k => nil}", "false"], [21, 0, "{:k => nil}", "false"], [24, 0, "{:k => nil}", "false"]]]

    res.should eql("  possible_arg_lists = {}\n  possible_results = {}\n  possible_arg_lists[0] = [0, {:k => nil}]\n  possible_results[0] = false\n  possible_arg_lists[8] = [0, {:k => 5}]\n  possible_results[8] = false\n  possible_arg_lists[11] = [0, {:k => 100}]\n  possible_results[11] = false\n  possible_arg_lists[16] = [0, {:k => nil}]\n  possible_results[16] = false\n  possible_arg_lists[21] = [0, {:k => nil}]\n  possible_results[21] = false\n  possible_arg_lists[24] = [0, {:k => nil}]\n  possible_results[24] = false\n  return_result = nil\n  found_result=false\n  possible_arg_lists.each do | call_id, poss_arg |\n    if Speculator::Util::StubSupport.args_equal(method_args,poss_arg)\n      return_result = possible_results[call_id]\n      found_result = true\n      break\n    end\n  end\n  fail \"\#{method_args.inspect} not expected\" unless found_result\n  return_result\n")


  end

  it 'implements make_expect_return for use case 34' do

    iut = Object.x_build('Speculator::Make::ExpectReturnMaker', {})

    res = iut.make_expect_return *[:method_args, [[1, nil, "{:s => 5}", "7"], [17, nil, "{:s => 0}", "2"], [18, nil, "{:s => 1}", "3"], [19, nil, "{:s => 2}", "4"]]]

    res.should eql("  possible_arg_lists = {}\n  possible_results = {}\n  possible_arg_lists[1] = [nil, {:s => 5}]\n  possible_results[1] = 7\n  possible_arg_lists[17] = [nil, {:s => 0}]\n  possible_results[17] = 2\n  possible_arg_lists[18] = [nil, {:s => 1}]\n  possible_results[18] = 3\n  possible_arg_lists[19] = [nil, {:s => 2}]\n  possible_results[19] = 4\n  return_result = nil\n  found_result=false\n  possible_arg_lists.each do | call_id, poss_arg |\n    if Speculator::Util::StubSupport.args_equal(method_args,poss_arg)\n      return_result = possible_results[call_id]\n      found_result = true\n      break\n    end\n  end\n  fail \"\#{method_args.inspect} not expected\" unless found_result\n  return_result\n")


  end

  it 'implements make_expect_return for use case 35' do

    iut = Object.x_build('Speculator::Make::ExpectReturnMaker', {})

    res = iut.make_expect_return *[:method_args, [[4, nil, "{}", "1234"]]]

    res.should eql("  possible_arg_lists = {}\n  possible_results = {}\n  possible_arg_lists[4] = [nil, {}]\n  possible_results[4] = 1234\n  return_result = nil\n  found_result=false\n  possible_arg_lists.each do | call_id, poss_arg |\n    if Speculator::Util::StubSupport.args_equal(method_args,poss_arg)\n      return_result = possible_results[call_id]\n      found_result = true\n      break\n    end\n  end\n  fail \"\#{method_args.inspect} not expected\" unless found_result\n  return_result\n")


  end

  it 'implements make_expect_return for use case 36' do

    iut = Object.x_build('Speculator::Make::ExpectReturnMaker', {})

    res = iut.make_expect_return *[:method_args, [[9, nil, "{:s => 10}", "15"], [12, nil, "{:s => 12}", "112"]]]

    res.should eql("  possible_arg_lists = {}\n  possible_results = {}\n  possible_arg_lists[9] = [nil, {:s => 10}]\n  possible_results[9] = 15\n  possible_arg_lists[12] = [nil, {:s => 12}]\n  possible_results[12] = 112\n  return_result = nil\n  found_result=false\n  possible_arg_lists.each do | call_id, poss_arg |\n    if Speculator::Util::StubSupport.args_equal(method_args,poss_arg)\n      return_result = possible_results[call_id]\n      found_result = true\n      break\n    end\n  end\n  fail \"\#{method_args.inspect} not expected\" unless found_result\n  return_result\n")


  end

  it 'implements make_expect_return for use case 37' do

    iut = Object.x_build('Speculator::Make::ExpectReturnMaker', {})

    res = iut.make_expect_return *[:method_args, [[22, nil, "{:n => 3}", "\"123\""]]]

    res.should eql("  possible_arg_lists = {}\n  possible_results = {}\n  possible_arg_lists[22] = [nil, {:n => 3}]\n  possible_results[22] = \"123\"\n  return_result = nil\n  found_result=false\n  possible_arg_lists.each do | call_id, poss_arg |\n    if Speculator::Util::StubSupport.args_equal(method_args,poss_arg)\n      return_result = possible_results[call_id]\n      found_result = true\n      break\n    end\n  end\n  fail \"\#{method_args.inspect} not expected\" unless found_result\n  return_result\n")


  end

  it 'implements make_expect_return for use case 38' do

    iut = Object.x_build('Speculator::Make::ExpectReturnMaker', {})

    res = iut.make_expect_return *[:method_args, [[25, nil, "{:k => \"world\"}", "true"]]]

    res.should eql("  possible_arg_lists = {}\n  possible_results = {}\n  possible_arg_lists[25] = [nil, {:k => \"world\"}]\n  possible_results[25] = true\n  return_result = nil\n  found_result=false\n  possible_arg_lists.each do | call_id, poss_arg |\n    if Speculator::Util::StubSupport.args_equal(method_args,poss_arg)\n      return_result = possible_results[call_id]\n      found_result = true\n      break\n    end\n  end\n  fail \"\#{method_args.inspect} not expected\" unless found_result\n  return_result\n")


  end

  it 'implements make_expect_return for use case 39' do

    iut = Object.x_build('Speculator::Make::ExpectReturnMaker', {})

    res = iut.make_expect_return *[:method_args, [[0, 0, "{:k => nil}", "false"], [8, 0, "{:k => 5}", "false"], [11, 0, "{:k => 100}", "false"], [16, 0, "{:k => nil}", "false"], [21, 0, "{:k => nil}", "false"], [24, 0, "{:k => nil}", "false"]]]

    res.should eql("  possible_arg_lists = {}\n  possible_results = {}\n  possible_arg_lists[0] = [0, {:k => nil}]\n  possible_results[0] = false\n  possible_arg_lists[8] = [0, {:k => 5}]\n  possible_results[8] = false\n  possible_arg_lists[11] = [0, {:k => 100}]\n  possible_results[11] = false\n  possible_arg_lists[16] = [0, {:k => nil}]\n  possible_results[16] = false\n  possible_arg_lists[21] = [0, {:k => nil}]\n  possible_results[21] = false\n  possible_arg_lists[24] = [0, {:k => nil}]\n  possible_results[24] = false\n  return_result = nil\n  found_result=false\n  possible_arg_lists.each do | call_id, poss_arg |\n    if Speculator::Util::StubSupport.args_equal(method_args,poss_arg)\n      return_result = possible_results[call_id]\n      found_result = true\n      break\n    end\n  end\n  fail \"\#{method_args.inspect} not expected\" unless found_result\n  return_result\n")


  end

  it 'implements make_expect_return for use case 40' do

    iut = Object.x_build('Speculator::Make::ExpectReturnMaker', {})

    res = iut.make_expect_return *[:method_args, [[1, nil, "{:s => 5}", "7"], [17, nil, "{:s => 0}", "2"], [18, nil, "{:s => 1}", "3"], [19, nil, "{:s => 2}", "4"]]]

    res.should eql("  possible_arg_lists = {}\n  possible_results = {}\n  possible_arg_lists[1] = [nil, {:s => 5}]\n  possible_results[1] = 7\n  possible_arg_lists[17] = [nil, {:s => 0}]\n  possible_results[17] = 2\n  possible_arg_lists[18] = [nil, {:s => 1}]\n  possible_results[18] = 3\n  possible_arg_lists[19] = [nil, {:s => 2}]\n  possible_results[19] = 4\n  return_result = nil\n  found_result=false\n  possible_arg_lists.each do | call_id, poss_arg |\n    if Speculator::Util::StubSupport.args_equal(method_args,poss_arg)\n      return_result = possible_results[call_id]\n      found_result = true\n      break\n    end\n  end\n  fail \"\#{method_args.inspect} not expected\" unless found_result\n  return_result\n")


  end

  it 'implements make_expect_return for use case 41' do

    iut = Object.x_build('Speculator::Make::ExpectReturnMaker', {})

    res = iut.make_expect_return *[:method_args, [[4, nil, "{}", "1234"]]]

    res.should eql("  possible_arg_lists = {}\n  possible_results = {}\n  possible_arg_lists[4] = [nil, {}]\n  possible_results[4] = 1234\n  return_result = nil\n  found_result=false\n  possible_arg_lists.each do | call_id, poss_arg |\n    if Speculator::Util::StubSupport.args_equal(method_args,poss_arg)\n      return_result = possible_results[call_id]\n      found_result = true\n      break\n    end\n  end\n  fail \"\#{method_args.inspect} not expected\" unless found_result\n  return_result\n")


  end

  it 'implements make_expect_return for use case 42' do

    iut = Object.x_build('Speculator::Make::ExpectReturnMaker', {})

    res = iut.make_expect_return *[:method_args, [[9, nil, "{:s => 10}", "15"], [12, nil, "{:s => 12}", "112"]]]

    res.should eql("  possible_arg_lists = {}\n  possible_results = {}\n  possible_arg_lists[9] = [nil, {:s => 10}]\n  possible_results[9] = 15\n  possible_arg_lists[12] = [nil, {:s => 12}]\n  possible_results[12] = 112\n  return_result = nil\n  found_result=false\n  possible_arg_lists.each do | call_id, poss_arg |\n    if Speculator::Util::StubSupport.args_equal(method_args,poss_arg)\n      return_result = possible_results[call_id]\n      found_result = true\n      break\n    end\n  end\n  fail \"\#{method_args.inspect} not expected\" unless found_result\n  return_result\n")


  end

  it 'implements make_expect_return for use case 43' do

    iut = Object.x_build('Speculator::Make::ExpectReturnMaker', {})

    res = iut.make_expect_return *[:method_args, [[22, nil, "{:n => 3}", "\"123\""]]]

    res.should eql("  possible_arg_lists = {}\n  possible_results = {}\n  possible_arg_lists[22] = [nil, {:n => 3}]\n  possible_results[22] = \"123\"\n  return_result = nil\n  found_result=false\n  possible_arg_lists.each do | call_id, poss_arg |\n    if Speculator::Util::StubSupport.args_equal(method_args,poss_arg)\n      return_result = possible_results[call_id]\n      found_result = true\n      break\n    end\n  end\n  fail \"\#{method_args.inspect} not expected\" unless found_result\n  return_result\n")


  end

  it 'implements make_expect_return for use case 44' do

    iut = Object.x_build('Speculator::Make::ExpectReturnMaker', {})

    res = iut.make_expect_return *[:method_args, [[25, nil, "{:k => \"world\"}", "true"]]]

    res.should eql("  possible_arg_lists = {}\n  possible_results = {}\n  possible_arg_lists[25] = [nil, {:k => \"world\"}]\n  possible_results[25] = true\n  return_result = nil\n  found_result=false\n  possible_arg_lists.each do | call_id, poss_arg |\n    if Speculator::Util::StubSupport.args_equal(method_args,poss_arg)\n      return_result = possible_results[call_id]\n      found_result = true\n      break\n    end\n  end\n  fail \"\#{method_args.inspect} not expected\" unless found_result\n  return_result\n")


  end

  it 'implements make_expect_return for use case 45' do

    iut = Object.x_build('Speculator::Make::ExpectReturnMaker', {})

    res = iut.make_expect_return *[:method_args, [[0, 0, "{:k => nil}", "false"], [8, 0, "{:k => 5}", "false"], [11, 0, "{:k => 100}", "false"], [16, 0, "{:k => nil}", "false"], [21, 0, "{:k => nil}", "false"], [24, 0, "{:k => nil}", "false"]]]

    res.should eql("  possible_arg_lists = {}\n  possible_results = {}\n  possible_arg_lists[0] = [0, {:k => nil}]\n  possible_results[0] = false\n  possible_arg_lists[8] = [0, {:k => 5}]\n  possible_results[8] = false\n  possible_arg_lists[11] = [0, {:k => 100}]\n  possible_results[11] = false\n  possible_arg_lists[16] = [0, {:k => nil}]\n  possible_results[16] = false\n  possible_arg_lists[21] = [0, {:k => nil}]\n  possible_results[21] = false\n  possible_arg_lists[24] = [0, {:k => nil}]\n  possible_results[24] = false\n  return_result = nil\n  found_result=false\n  possible_arg_lists.each do | call_id, poss_arg |\n    if Speculator::Util::StubSupport.args_equal(method_args,poss_arg)\n      return_result = possible_results[call_id]\n      found_result = true\n      break\n    end\n  end\n  fail \"\#{method_args.inspect} not expected\" unless found_result\n  return_result\n")


  end

  it 'implements make_expect_return for use case 46' do

    iut = Object.x_build('Speculator::Make::ExpectReturnMaker', {})

    res = iut.make_expect_return *[:method_args, [[1, nil, "{:s => 5}", "7"], [17, nil, "{:s => 0}", "2"], [18, nil, "{:s => 1}", "3"], [19, nil, "{:s => 2}", "4"]]]

    res.should eql("  possible_arg_lists = {}\n  possible_results = {}\n  possible_arg_lists[1] = [nil, {:s => 5}]\n  possible_results[1] = 7\n  possible_arg_lists[17] = [nil, {:s => 0}]\n  possible_results[17] = 2\n  possible_arg_lists[18] = [nil, {:s => 1}]\n  possible_results[18] = 3\n  possible_arg_lists[19] = [nil, {:s => 2}]\n  possible_results[19] = 4\n  return_result = nil\n  found_result=false\n  possible_arg_lists.each do | call_id, poss_arg |\n    if Speculator::Util::StubSupport.args_equal(method_args,poss_arg)\n      return_result = possible_results[call_id]\n      found_result = true\n      break\n    end\n  end\n  fail \"\#{method_args.inspect} not expected\" unless found_result\n  return_result\n")


  end

  it 'implements make_expect_return for use case 47' do

    iut = Object.x_build('Speculator::Make::ExpectReturnMaker', {})

    res = iut.make_expect_return *[:method_args, [[4, nil, "{}", "1234"]]]

    res.should eql("  possible_arg_lists = {}\n  possible_results = {}\n  possible_arg_lists[4] = [nil, {}]\n  possible_results[4] = 1234\n  return_result = nil\n  found_result=false\n  possible_arg_lists.each do | call_id, poss_arg |\n    if Speculator::Util::StubSupport.args_equal(method_args,poss_arg)\n      return_result = possible_results[call_id]\n      found_result = true\n      break\n    end\n  end\n  fail \"\#{method_args.inspect} not expected\" unless found_result\n  return_result\n")


  end

  it 'implements make_expect_return for use case 48' do

    iut = Object.x_build('Speculator::Make::ExpectReturnMaker', {})

    res = iut.make_expect_return *[:method_args, [[9, nil, "{:s => 10}", "15"], [12, nil, "{:s => 12}", "112"]]]

    res.should eql("  possible_arg_lists = {}\n  possible_results = {}\n  possible_arg_lists[9] = [nil, {:s => 10}]\n  possible_results[9] = 15\n  possible_arg_lists[12] = [nil, {:s => 12}]\n  possible_results[12] = 112\n  return_result = nil\n  found_result=false\n  possible_arg_lists.each do | call_id, poss_arg |\n    if Speculator::Util::StubSupport.args_equal(method_args,poss_arg)\n      return_result = possible_results[call_id]\n      found_result = true\n      break\n    end\n  end\n  fail \"\#{method_args.inspect} not expected\" unless found_result\n  return_result\n")


  end

  it 'implements make_expect_return for use case 49' do

    iut = Object.x_build('Speculator::Make::ExpectReturnMaker', {})

    res = iut.make_expect_return *[:method_args, [[22, nil, "{:n => 3}", "\"123\""]]]

    res.should eql("  possible_arg_lists = {}\n  possible_results = {}\n  possible_arg_lists[22] = [nil, {:n => 3}]\n  possible_results[22] = \"123\"\n  return_result = nil\n  found_result=false\n  possible_arg_lists.each do | call_id, poss_arg |\n    if Speculator::Util::StubSupport.args_equal(method_args,poss_arg)\n      return_result = possible_results[call_id]\n      found_result = true\n      break\n    end\n  end\n  fail \"\#{method_args.inspect} not expected\" unless found_result\n  return_result\n")


  end

  it 'implements make_expect_return for use case 50' do

    iut = Object.x_build('Speculator::Make::ExpectReturnMaker', {})

    res = iut.make_expect_return *[:method_args, [[25, nil, "{:k => \"world\"}", "true"]]]

    res.should eql("  possible_arg_lists = {}\n  possible_results = {}\n  possible_arg_lists[25] = [nil, {:k => \"world\"}]\n  possible_results[25] = true\n  return_result = nil\n  found_result=false\n  possible_arg_lists.each do | call_id, poss_arg |\n    if Speculator::Util::StubSupport.args_equal(method_args,poss_arg)\n      return_result = possible_results[call_id]\n      found_result = true\n      break\n    end\n  end\n  fail \"\#{method_args.inspect} not expected\" unless found_result\n  return_result\n")


  end

  it 'implements make_expect_return for use case 51' do

    iut = Object.x_build('Speculator::Make::ExpectReturnMaker', {})

    res = iut.make_expect_return *[:method_args, [[0, 0, "{:k => nil}", "false"], [8, 0, "{:k => 5}", "false"], [11, 0, "{:k => 100}", "false"], [16, 0, "{:k => nil}", "false"], [21, 0, "{:k => nil}", "false"], [24, 0, "{:k => nil}", "false"]]]

    res.should eql("  possible_arg_lists = {}\n  possible_results = {}\n  possible_arg_lists[0] = [0, {:k => nil}]\n  possible_results[0] = false\n  possible_arg_lists[8] = [0, {:k => 5}]\n  possible_results[8] = false\n  possible_arg_lists[11] = [0, {:k => 100}]\n  possible_results[11] = false\n  possible_arg_lists[16] = [0, {:k => nil}]\n  possible_results[16] = false\n  possible_arg_lists[21] = [0, {:k => nil}]\n  possible_results[21] = false\n  possible_arg_lists[24] = [0, {:k => nil}]\n  possible_results[24] = false\n  return_result = nil\n  found_result=false\n  possible_arg_lists.each do | call_id, poss_arg |\n    if Speculator::Util::StubSupport.args_equal(method_args,poss_arg)\n      return_result = possible_results[call_id]\n      found_result = true\n      break\n    end\n  end\n  fail \"\#{method_args.inspect} not expected\" unless found_result\n  return_result\n")


  end

  it 'implements make_expect_return for use case 52' do

    iut = Object.x_build('Speculator::Make::ExpectReturnMaker', {})

    res = iut.make_expect_return *[:method_args, [[1, nil, "{:s => 5}", "7"], [17, nil, "{:s => 0}", "2"], [18, nil, "{:s => 1}", "3"], [19, nil, "{:s => 2}", "4"]]]

    res.should eql("  possible_arg_lists = {}\n  possible_results = {}\n  possible_arg_lists[1] = [nil, {:s => 5}]\n  possible_results[1] = 7\n  possible_arg_lists[17] = [nil, {:s => 0}]\n  possible_results[17] = 2\n  possible_arg_lists[18] = [nil, {:s => 1}]\n  possible_results[18] = 3\n  possible_arg_lists[19] = [nil, {:s => 2}]\n  possible_results[19] = 4\n  return_result = nil\n  found_result=false\n  possible_arg_lists.each do | call_id, poss_arg |\n    if Speculator::Util::StubSupport.args_equal(method_args,poss_arg)\n      return_result = possible_results[call_id]\n      found_result = true\n      break\n    end\n  end\n  fail \"\#{method_args.inspect} not expected\" unless found_result\n  return_result\n")


  end

  it 'implements make_expect_return for use case 53' do

    iut = Object.x_build('Speculator::Make::ExpectReturnMaker', {})

    res = iut.make_expect_return *[:method_args, [[4, nil, "{}", "1234"]]]

    res.should eql("  possible_arg_lists = {}\n  possible_results = {}\n  possible_arg_lists[4] = [nil, {}]\n  possible_results[4] = 1234\n  return_result = nil\n  found_result=false\n  possible_arg_lists.each do | call_id, poss_arg |\n    if Speculator::Util::StubSupport.args_equal(method_args,poss_arg)\n      return_result = possible_results[call_id]\n      found_result = true\n      break\n    end\n  end\n  fail \"\#{method_args.inspect} not expected\" unless found_result\n  return_result\n")


  end

  it 'implements make_expect_return for use case 54' do

    iut = Object.x_build('Speculator::Make::ExpectReturnMaker', {})

    res = iut.make_expect_return *[:method_args, [[9, nil, "{:s => 10}", "15"], [12, nil, "{:s => 12}", "112"]]]

    res.should eql("  possible_arg_lists = {}\n  possible_results = {}\n  possible_arg_lists[9] = [nil, {:s => 10}]\n  possible_results[9] = 15\n  possible_arg_lists[12] = [nil, {:s => 12}]\n  possible_results[12] = 112\n  return_result = nil\n  found_result=false\n  possible_arg_lists.each do | call_id, poss_arg |\n    if Speculator::Util::StubSupport.args_equal(method_args,poss_arg)\n      return_result = possible_results[call_id]\n      found_result = true\n      break\n    end\n  end\n  fail \"\#{method_args.inspect} not expected\" unless found_result\n  return_result\n")


  end

  it 'implements make_expect_return for use case 55' do

    iut = Object.x_build('Speculator::Make::ExpectReturnMaker', {})

    res = iut.make_expect_return *[:method_args, [[22, nil, "{:n => 3}", "\"123\""]]]

    res.should eql("  possible_arg_lists = {}\n  possible_results = {}\n  possible_arg_lists[22] = [nil, {:n => 3}]\n  possible_results[22] = \"123\"\n  return_result = nil\n  found_result=false\n  possible_arg_lists.each do | call_id, poss_arg |\n    if Speculator::Util::StubSupport.args_equal(method_args,poss_arg)\n      return_result = possible_results[call_id]\n      found_result = true\n      break\n    end\n  end\n  fail \"\#{method_args.inspect} not expected\" unless found_result\n  return_result\n")


  end

  it 'implements make_expect_return for use case 56' do

    iut = Object.x_build('Speculator::Make::ExpectReturnMaker', {})

    res = iut.make_expect_return *[:method_args, [[25, nil, "{:k => \"world\"}", "true"]]]

    res.should eql("  possible_arg_lists = {}\n  possible_results = {}\n  possible_arg_lists[25] = [nil, {:k => \"world\"}]\n  possible_results[25] = true\n  return_result = nil\n  found_result=false\n  possible_arg_lists.each do | call_id, poss_arg |\n    if Speculator::Util::StubSupport.args_equal(method_args,poss_arg)\n      return_result = possible_results[call_id]\n      found_result = true\n      break\n    end\n  end\n  fail \"\#{method_args.inspect} not expected\" unless found_result\n  return_result\n")


  end

  it 'implements make_expect_return for use case 57' do

    iut = Object.x_build('Speculator::Make::ExpectReturnMaker', {})

    res = iut.make_expect_return *[:method_args, [[0, 0, "{:k => nil}", "false"], [8, 0, "{:k => 5}", "false"], [11, 0, "{:k => 100}", "false"], [16, 0, "{:k => nil}", "false"], [21, 0, "{:k => nil}", "false"], [24, 0, "{:k => nil}", "false"]]]

    res.should eql("  possible_arg_lists = {}\n  possible_results = {}\n  possible_arg_lists[0] = [0, {:k => nil}]\n  possible_results[0] = false\n  possible_arg_lists[8] = [0, {:k => 5}]\n  possible_results[8] = false\n  possible_arg_lists[11] = [0, {:k => 100}]\n  possible_results[11] = false\n  possible_arg_lists[16] = [0, {:k => nil}]\n  possible_results[16] = false\n  possible_arg_lists[21] = [0, {:k => nil}]\n  possible_results[21] = false\n  possible_arg_lists[24] = [0, {:k => nil}]\n  possible_results[24] = false\n  return_result = nil\n  found_result=false\n  possible_arg_lists.each do | call_id, poss_arg |\n    if Speculator::Util::StubSupport.args_equal(method_args,poss_arg)\n      return_result = possible_results[call_id]\n      found_result = true\n      break\n    end\n  end\n  fail \"\#{method_args.inspect} not expected\" unless found_result\n  return_result\n")


  end

  it 'implements make_expect_return for use case 58' do

    iut = Object.x_build('Speculator::Make::ExpectReturnMaker', {})

    res = iut.make_expect_return *[:method_args, [[1, nil, "{:s => 5}", "7"], [17, nil, "{:s => 0}", "2"], [18, nil, "{:s => 1}", "3"], [19, nil, "{:s => 2}", "4"]]]

    res.should eql("  possible_arg_lists = {}\n  possible_results = {}\n  possible_arg_lists[1] = [nil, {:s => 5}]\n  possible_results[1] = 7\n  possible_arg_lists[17] = [nil, {:s => 0}]\n  possible_results[17] = 2\n  possible_arg_lists[18] = [nil, {:s => 1}]\n  possible_results[18] = 3\n  possible_arg_lists[19] = [nil, {:s => 2}]\n  possible_results[19] = 4\n  return_result = nil\n  found_result=false\n  possible_arg_lists.each do | call_id, poss_arg |\n    if Speculator::Util::StubSupport.args_equal(method_args,poss_arg)\n      return_result = possible_results[call_id]\n      found_result = true\n      break\n    end\n  end\n  fail \"\#{method_args.inspect} not expected\" unless found_result\n  return_result\n")


  end

  it 'implements make_expect_return for use case 59' do

    iut = Object.x_build('Speculator::Make::ExpectReturnMaker', {})

    res = iut.make_expect_return *[:method_args, [[4, nil, "{}", "1234"]]]

    res.should eql("  possible_arg_lists = {}\n  possible_results = {}\n  possible_arg_lists[4] = [nil, {}]\n  possible_results[4] = 1234\n  return_result = nil\n  found_result=false\n  possible_arg_lists.each do | call_id, poss_arg |\n    if Speculator::Util::StubSupport.args_equal(method_args,poss_arg)\n      return_result = possible_results[call_id]\n      found_result = true\n      break\n    end\n  end\n  fail \"\#{method_args.inspect} not expected\" unless found_result\n  return_result\n")


  end

  it 'implements make_expect_return for use case 60' do

    iut = Object.x_build('Speculator::Make::ExpectReturnMaker', {})

    res = iut.make_expect_return *[:method_args, [[9, nil, "{:s => 10}", "15"], [12, nil, "{:s => 12}", "112"]]]

    res.should eql("  possible_arg_lists = {}\n  possible_results = {}\n  possible_arg_lists[9] = [nil, {:s => 10}]\n  possible_results[9] = 15\n  possible_arg_lists[12] = [nil, {:s => 12}]\n  possible_results[12] = 112\n  return_result = nil\n  found_result=false\n  possible_arg_lists.each do | call_id, poss_arg |\n    if Speculator::Util::StubSupport.args_equal(method_args,poss_arg)\n      return_result = possible_results[call_id]\n      found_result = true\n      break\n    end\n  end\n  fail \"\#{method_args.inspect} not expected\" unless found_result\n  return_result\n")


  end

  it 'implements make_expect_return for use case 61' do

    iut = Object.x_build('Speculator::Make::ExpectReturnMaker', {})

    res = iut.make_expect_return *[:method_args, [[22, nil, "{:n => 3}", "\"123\""]]]

    res.should eql("  possible_arg_lists = {}\n  possible_results = {}\n  possible_arg_lists[22] = [nil, {:n => 3}]\n  possible_results[22] = \"123\"\n  return_result = nil\n  found_result=false\n  possible_arg_lists.each do | call_id, poss_arg |\n    if Speculator::Util::StubSupport.args_equal(method_args,poss_arg)\n      return_result = possible_results[call_id]\n      found_result = true\n      break\n    end\n  end\n  fail \"\#{method_args.inspect} not expected\" unless found_result\n  return_result\n")


  end

  it 'implements make_expect_return for use case 62' do

    iut = Object.x_build('Speculator::Make::ExpectReturnMaker', {})

    res = iut.make_expect_return *[:method_args, [[25, nil, "{:k => \"world\"}", "true"]]]

    res.should eql("  possible_arg_lists = {}\n  possible_results = {}\n  possible_arg_lists[25] = [nil, {:k => \"world\"}]\n  possible_results[25] = true\n  return_result = nil\n  found_result=false\n  possible_arg_lists.each do | call_id, poss_arg |\n    if Speculator::Util::StubSupport.args_equal(method_args,poss_arg)\n      return_result = possible_results[call_id]\n      found_result = true\n      break\n    end\n  end\n  fail \"\#{method_args.inspect} not expected\" unless found_result\n  return_result\n")


  end

  it 'implements make_expect_return for use case 63' do

    iut = Object.x_build('Speculator::Make::ExpectReturnMaker', {:@classname => "Target", :@methods_to_test => [:user_f, :classmethod, :user_c, :add_q, :user_i, :munge, :a, :use_block, :use_use_block, :test_alias], :@classes_to_stub => ["Used", "Used", "Used", "Used", "Used", "Used"], :@org_track_info => {"Used" => {:initialize => {0 => {:op => :sub_call, :classname => "Used", :methodname => :initialize, :call_id => 0, :is_class_method => false, :qname => "Used.initialize", :args => "{:k => nil}", :first_optional => 0, :instance_object => {:class_name => "Used", :initializers => {:@k => {:class_name => "NilClass", :initializers => {}}, :@alias_called => {:class_name => "FalseClass", :initializers => {}}}}, :res => "false"}, 8 => {:op => :sub_call, :classname => "Used", :methodname => :initialize, :call_id => 8, :is_class_method => false, :qname => "Used.initialize", :args => "{:k => 5}", :first_optional => 0, :instance_object => {:class_name => "Used", :initializers => {:@k => {:literal => 5}, :@alias_called => {:class_name => "FalseClass", :initializers => {}}}}, :res => "false"}, 11 => {:op => :sub_call, :classname => "Used", :methodname => :initialize, :call_id => 11, :is_class_method => false, :qname => "Used.initialize", :args => "{:k => 100}", :first_optional => 0, :instance_object => {:class_name => "Used", :initializers => {:@k => {:literal => 100}, :@alias_called => {:class_name => "FalseClass", :initializers => {}}}}, :res => "false"}, 16 => {:op => :sub_call, :classname => "Used", :methodname => :initialize, :call_id => 16, :is_class_method => false, :qname => "Used.initialize", :args => "{:k => nil}", :first_optional => 0, :instance_object => {:class_name => "Used", :initializers => {:@k => {:class_name => "NilClass", :initializers => {}}, :@alias_called => {:class_name => "FalseClass", :initializers => {}}}}, :res => "false"}, 21 => {:op => :sub_call, :classname => "Used", :methodname => :initialize, :call_id => 21, :is_class_method => false, :qname => "Used.initialize", :args => "{:k => nil}", :first_optional => 0, :instance_object => {:class_name => "Used", :initializers => {:@k => {:class_name => "NilClass", :initializers => {}}, :@alias_called => {:class_name => "FalseClass", :initializers => {}}}}, :res => "false"}, 24 => {:op => :sub_call, :classname => "Used", :methodname => :initialize, :call_id => 24, :is_class_method => false, :qname => "Used.initialize", :args => "{:k => nil}", :first_optional => 0, :instance_object => {:class_name => "Used", :initializers => {:@k => {:class_name => "NilClass", :initializers => {}}, :@alias_called => {:class_name => "FalseClass", :initializers => {}}}}, :res => "false"}}, :f => {1 => {:op => :sub_call, :classname => "Used", :methodname => :f, :call_id => 1, :is_class_method => false, :qname => "Used.f", :args => "{:s => 5}", :first_optional => nil, :instance_object => {:class_name => "Used", :initializers => {:@k => {:class_name => "NilClass", :initializers => {}}, :@alias_called => {:class_name => "FalseClass", :initializers => {}}}}, :res => "7"}, 17 => {:op => :sub_call, :classname => "Used", :methodname => :f, :call_id => 17, :is_class_method => false, :qname => "Used.f", :args => "{:s => 0}", :first_optional => nil, :instance_object => {:class_name => "Used", :initializers => {:@k => {:class_name => "NilClass", :initializers => {}}, :@alias_called => {:class_name => "FalseClass", :initializers => {}}}}, :res => "2"}, 18 => {:op => :sub_call, :classname => "Used", :methodname => :f, :call_id => 18, :is_class_method => false, :qname => "Used.f", :args => "{:s => 1}", :first_optional => nil, :instance_object => {:class_name => "Used", :initializers => {:@k => {:class_name => "NilClass", :initializers => {}}, :@alias_called => {:class_name => "FalseClass", :initializers => {}}}}, :res => "3"}, 19 => {:op => :sub_call, :classname => "Used", :methodname => :f, :call_id => 19, :is_class_method => false, :qname => "Used.f", :args => "{:s => 2}", :first_optional => nil, :instance_object => {:class_name => "Used", :initializers => {:@k => {:class_name => "NilClass", :initializers => {}}, :@alias_called => {:class_name => "FalseClass", :initializers => {}}}}, :res => "4"}}, :c => {4 => {:op => :sub_call, :classname => "Used", :methodname => :c, :call_id => 4, :is_class_method => true, :qname => "Used.c", :args => "{}", :first_optional => nil, :instance_object => {:class_name => "Class", :initializers => {}}, :res => "1234"}}, :i => {9 => {:op => :sub_call, :classname => "Used", :methodname => :i, :call_id => 9, :is_class_method => false, :qname => "Used.i", :args => "{:s => 10}", :first_optional => nil, :instance_object => {:class_name => "Used", :initializers => {:@k => {:literal => 5}, :@alias_called => {:class_name => "FalseClass", :initializers => {}}}}, :res => "15"}, 12 => {:op => :sub_call, :classname => "Used", :methodname => :i, :call_id => 12, :is_class_method => false, :qname => "Used.i", :args => "{:s => 12}", :first_optional => nil, :instance_object => {:class_name => "Used", :initializers => {:@k => {:literal => 100}, :@alias_called => {:class_name => "FalseClass", :initializers => {}}}}, :res => "112"}}, :using_block => {22 => {:op => :sub_call, :classname => "Used", :methodname => :using_block, :call_id => 22, :is_class_method => false, :qname => "Used.using_block", :args => "{:n => 3}", :first_optional => nil, :instance_object => {:class_name => "Used", :initializers => {:@k => {:class_name => "NilClass", :initializers => {}}, :@alias_called => {:class_name => "FalseClass", :initializers => {}}}}, :res => "\"123\""}}, :alias => {25 => {:op => :sub_call, :classname => "Used", :methodname => :alias, :call_id => 25, :is_class_method => false, :qname => "Used.alias", :args => "{:k => \"world\"}", :first_optional => nil, :instance_object => {:class_name => "Used", :initializers => {:@k => {:class_name => "NilClass", :initializers => {}}, :@alias_called => {:class_name => "TrueClass", :initializers => {}}}}, :res => "true"}}}, "Target" => {"user_f" => {2 => {:op => :tracked_call, :classname => "Target", :source_location => ["/Users/richardparratt/RubymineProjects/speculator/test/examples/target.rb", true], :methodname => "user_f", :call_id => 2, :qname => "Target.user_f", :args => "[]", :res => "7", :is_class_method => false, :instance_variables => "{}"}}, "classmethod" => {3 => {:op => :tracked_call, :classname => "Target", :source_location => ["/Users/richardparratt/RubymineProjects/speculator/test/examples/target.rb", true], :methodname => "classmethod", :call_id => 3, :qname => "Target.classmethod", :args => "[{:a => 1, :b => 2}]", :res => "\"classmethod called with {:a=>1, :b=>2}\"", :is_class_method => true}}, "user_c" => {5 => {:op => :tracked_call, :classname => "Target", :source_location => ["/Users/richardparratt/RubymineProjects/speculator/test/examples/target.rb", true], :methodname => "user_c", :call_id => 5, :qname => "Target.user_c", :args => "[]", :res => "11234", :is_class_method => false, :instance_variables => "{}"}}, "add_q" => {6 => {:op => :tracked_call, :classname => "Target", :source_location => ["/Users/richardparratt/RubymineProjects/speculator/test/examples/target.rb", true], :methodname => "add_q", :call_id => 6, :qname => "Target.add_q", :args => "[50]", :res => "150", :is_class_method => false, :instance_variables => "{:@q => 100}"}, 7 => {:op => :tracked_call, :classname => "Target", :source_location => ["/Users/richardparratt/RubymineProjects/speculator/test/examples/target.rb", true], :methodname => "add_q", :call_id => 7, :qname => "Target.add_q", :args => "[25]", :res => "50", :is_class_method => false, :instance_variables => "{:@q => 25}"}}, "user_i" => {10 => {:op => :tracked_call, :classname => "Target", :source_location => ["/Users/richardparratt/RubymineProjects/speculator/test/examples/target.rb", true], :methodname => "user_i", :call_id => 10, :qname => "Target.user_i", :args => "[5, 10]", :res => "15", :is_class_method => false, :instance_variables => "{}"}, 13 => {:op => :tracked_call, :classname => "Target", :source_location => ["/Users/richardparratt/RubymineProjects/speculator/test/examples/target.rb", true], :methodname => "user_i", :call_id => 13, :qname => "Target.user_i", :args => "[100, 12]", :res => "112", :is_class_method => false, :instance_variables => "{}"}}, "munge" => {14 => {:op => :tracked_call, :classname => "Target", :source_location => ["/Users/richardparratt/RubymineProjects/speculator/test/examples/target.rb", true], :methodname => "munge", :call_id => 14, :qname => "Target.munge", :args => "[1, 3]", :res => "\"2-4-6\"", :is_class_method => false, :block => [{:args => [1], :res => 2}, {:args => [2], :res => 4}, {:args => [3], :res => 6}], :instance_variables => "{}"}}, "a" => {15 => {:op => :tracked_call, :classname => "Target", :source_location => ["/Users/richardparratt/RubymineProjects/speculator/test/examples/target.rb", true], :methodname => "a", :call_id => 15, :qname => "Target.a", :args => "[25]", :res => "6.0", :is_class_method => false, :instance_variables => "{}"}}, "use_block" => {20 => {:op => :tracked_call, :classname => "Target", :source_location => ["/Users/richardparratt/RubymineProjects/speculator/test/examples/target.rb", true], :methodname => "use_block", :call_id => 20, :qname => "Target.use_block", :args => "[3]", :res => "[2, 3, 4]", :is_class_method => false, :instance_variables => "{}"}}, "use_use_block" => {23 => {:op => :tracked_call, :classname => "Target", :source_location => ["/Users/richardparratt/RubymineProjects/speculator/test/examples/target.rb", true], :methodname => "use_use_block", :call_id => 23, :qname => "Target.use_use_block", :args => "[3]", :res => "\"123\"", :is_class_method => false, :instance_variables => "{}"}}, "test_alias" => {26 => {:op => :tracked_call, :classname => "Target", :source_location => ["/Users/richardparratt/RubymineProjects/speculator/test/examples/target.rb", true], :methodname => "test_alias", :call_id => 26, :qname => "Target.test_alias", :args => "[]", :res => "Object.x_build('Used', :@k => nil, :@alias_called => true)", :is_class_method => false, :instance_variables => "{}"}}}}, :@target_path => Object.x_build('Pathname', :@path => "/Users/richardparratt/RubymineProjects/speculator/test/examples/gen_specs")})

    res = iut.make_expect_return *[:block_args, [[0, nil, [1], 2], [1, nil, [2], 4], [2, nil, [3], 6]], "next"]

    res.should eql("  possible_arg_lists = {}\n  possible_results = {}\n  possible_arg_lists[0] = [nil, [1]]\n  possible_results[0] = 2\n  possible_arg_lists[1] = [nil, [2]]\n  possible_results[1] = 4\n  possible_arg_lists[2] = [nil, [3]]\n  possible_results[2] = 6\n  return_result = nil\n  found_result=false\n  possible_arg_lists.each do | call_id, poss_arg |\n    if Speculator::Util::StubSupport.args_equal(block_args,poss_arg)\n      return_result = possible_results[call_id]\n      found_result = true\n      break\n    end\n  end\n  fail \"\#{block_args.inspect} not expected\" unless found_result\n  return_result\n")


  end

end
