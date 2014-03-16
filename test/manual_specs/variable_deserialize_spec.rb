require 'speculator'

class TestClass
  def initialize(a,b)
    @a = a
    @b = b
  end

  attr_accessor :a, :b
end

describe 'Speculator::Util::VariableDeserialize' do

  specify 'should deserialize strings' do
    res = Speculator::Util::VariableDeserialize.from_struct( {:literal => "hello"} )
    res.should eq "hello"
  end

  specify 'should deserialize arrays' do
    res = Speculator::Util::VariableDeserialize.from_struct( [{:literal=>1}, {:literal=>"a"}, {:literal=>2}] )
    res.should eq [1, 'a', 2]
  end

  specify 'should deserialize hashes' do
    res = Speculator::Util::VariableDeserialize.from_struct( { :hash => {:a=>{:literal=>1}, :b=>{:literal=>2}}} )
    res.should eq( { :a => 1, :b => 2} )
  end

  specify 'should deserialize integers' do
    res = Speculator::Util::VariableDeserialize.from_struct ( {:literal=>100} )
    res.should eq( 100 )
  end

  specify 'should deserialize floats' do
    res = Speculator::Util::VariableDeserialize.from_struct ( {:literal=>100.5 } )
    res.should eq 100.5
  end

  specify 'should deserialize symbols' do
    res = Speculator::Util::VariableDeserialize.from_struct( {:literal=>:my_sym } )
    res.should eq :my_sym
  end

  specify 'should deserialize regexen' do
    res = Speculator::Util::VariableDeserialize.from_struct( {:literal=> /\s/ } )
    res.should eq /\s/
  end

  specify 'should deserialize classes' do
    res = Speculator::Util::VariableDeserialize.from_struct ( {:class_name=>"TestClass",
                                           :initializers=>{:@a=>{:literal=>100}, :@b=>{:literal=>200}}} )
    res.class.should eq TestClass
    res.a.should eq 100
    res.b.should eq 200
  end

  specify 'should deserialize nested classes' do
    res = Speculator::Util::VariableDeserialize.from_struct( {:class_name=>"TestClass",
                                          :initializers=>
                                              {:@a=>{:literal=>100},
                                               :@b=>
                                                   {:class_name=>"TestClass",
                                                    :initializers=>{:@a=>{:literal=>"a"}, :@b=>{:literal=>"b"}}}}} )
    res.class.should eq TestClass
    res.a.should eq 100
    res.b.class.should eq TestClass
    res.b.a.should eq 'a'
    res.b.b.should eq 'b'
  end

  specify 'should deserialize arrays of classes' do
    res = Speculator::Util::VariableDeserialize.from_struct ( [{:class_name=>"TestClass",
                                            :initializers=>{:@a=>{:literal=>100}, :@b=>{:literal=>200}}},
                                           {:literal=>"other"},
                                           {:literal=>101}] )
    res.count.should eq 3
    res[0].class.should eq TestClass
    res[0].a.should eq 100
    res[0].b.should eq 200
    res[1].should eq 'other'
    res[2].should eq 101
  end
end
