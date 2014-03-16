require 'speculator'

class TestClass
  def initialize(a,b)
    @a = a
    @b = b
  end
end

describe 'Speculator::Util::VariableSerialize' do

  specify 'should serialize strings' do
    res = Speculator::Util::VariableSerialize.to_struct 'hello'
    res.should eq( {:literal => "hello"} )
  end

  specify 'should serialize arrays' do
    res = Speculator::Util::VariableSerialize.to_struct [1, 'a', 2]
    res.should eq( [{:literal=>1}, {:literal=>"a"}, {:literal=>2}] )
  end

  specify 'should serialize hashes' do
    res = Speculator::Util::VariableSerialize.to_struct( { :a => 1, :b => 2} )
    res.should eq( {:hash => {:a=>{:literal=>1}, :b=>{:literal=>2}}} )
  end

  specify 'should serialize integers' do
    res = Speculator::Util::VariableSerialize.to_struct 100
    res.should eq( {:literal=>100} )
  end

  specify 'should serialize floats' do
    res = Speculator::Util::VariableSerialize.to_struct 100.5
    res.should eq( {:literal=>100.5 } )
  end

  specify 'should serialize symbols' do
    res = Speculator::Util::VariableSerialize.to_struct :my_sym
    res.should eq( {:literal=>:my_sym } )
  end

  specify 'should serialize regexen' do
    res = Speculator::Util::VariableSerialize.to_struct /\s/
    res.should eq( {:literal=> /\s/ } )
  end

  specify 'should serialize classes' do
    res = Speculator::Util::VariableSerialize.to_struct TestClass.new(100, 200)
    res.should eq( {:class_name=>"TestClass",
                    :initializers=>{:@a=>{:literal=>100}, :@b=>{:literal=>200}}} )
  end

  specify 'should serialize nested classes' do
    res = Speculator::Util::VariableSerialize.to_struct TestClass.new(100, TestClass.new('a', 'b'))
    res.should eq( {:class_name=>"TestClass",
                    :initializers=>
                        {:@a=>{:literal=>100},
                         :@b=>
                             {:class_name=>"TestClass",
                              :initializers=>{:@a=>{:literal=>"a"}, :@b=>{:literal=>"b"}}}}} )
  end

  specify 'should serialize arrays of classes' do
    res = Speculator::Util::VariableSerialize.to_struct [TestClass.new(100, 200), 'other', 101]
    res.should eq( [{:class_name=>"TestClass",
                     :initializers=>{:@a=>{:literal=>100}, :@b=>{:literal=>200}}},
                    {:literal=>"other"},
                    {:literal=>101}] )
  end
end
