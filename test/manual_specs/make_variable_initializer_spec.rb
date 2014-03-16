require 'rspec'
require 'speculator'

class TestClass
  def initialize(a,b)
    @a = a
    @b = b
  end
end

describe 'to_init' do

  it 'should convert literals' do

      Speculator::Util::MakeVariableInitializer.to_init(1).should eq '1'
      Speculator::Util::MakeVariableInitializer.to_init(12345678.901234567).should eq '12345678.901234567'
      Speculator::Util::MakeVariableInitializer.to_init('hello').should eq '"hello"'
      Speculator::Util::MakeVariableInitializer.to_init("test\n").should eq '"test\n"'
      Speculator::Util::MakeVariableInitializer.to_init(nil).should eq "nil"
      Speculator::Util::MakeVariableInitializer.to_init(true).should eq 'true'
  end

  it 'should convert arrays' do
    Speculator::Util::MakeVariableInitializer.to_init([1,2,3]).should eq '[1, 2, 3]'
    Speculator::Util::MakeVariableInitializer.to_init([1,'2',true]).should eq '[1, "2", true]'
  end

  it 'should convert hashes' do
    Speculator::Util::MakeVariableInitializer.to_init({a: 1, b: 'b', c: true}).should eq '{:a => 1, :b => "b", :c => true}'
    Speculator::Util::MakeVariableInitializer.to_init({1 => 1, 'b' => 'b'}).should eq '{1 => 1, "b" => "b"}'
  end

  it 'should convert objects' do
    i = TestClass.new 100, 'hello'

    Speculator::Util::MakeVariableInitializer.to_init(i).should eq 'Object.x_build(:TestClass, :@a => 100, :@b => "hello")'
  end

  it 'should convert nested things' do
    Speculator::Util::MakeVariableInitializer.to_init( [1, {a: 'test A', b: 'test B'}, [1,2,3]]).should
      eq '[1, {:a => "test A", :b => "test B"}, [1, 2, 3]]'

    i = TestClass.new 100, [1, TestClass.new(200, 201)]
    Speculator::Util::MakeVariableInitializer.to_init(i: i).should
      eq '{:i => Object.x_build(:TestClass, :@a => 100, :@b => [1, Object.x_build(:TestClass, :a => 200, :b => 201)])}'
  end
end
