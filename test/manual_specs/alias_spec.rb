require 'rspec'

class A
  attr_reader :alias_called

  def initialize
    @alias_called = false
  end

  def alias k
    puts "method alias #{k}"
    @alias_called = true
  end

  def caller
    self.alias( 'hello')
  end

end

class B
  def test_alias
    @a = A.new

    @a.alias 'world'

    @a
  end
end

describe 'A method called alias' do

  it 'can be called on self' do

    a = A.new
    a.caller
    a.alias_called.should be_true
  end

  it 'can be called on an instance variable' do

    B.new.test_alias.alias_called.should be_true
  end

end
