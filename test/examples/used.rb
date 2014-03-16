class Used
  attr_accessor :k, :alias_called

  def initialize(k=nil)
    self.k=k
    @alias_called = false
  end

  def f(s)
    s + 2
  end

  def i(s)
    s + @k
  end

  def self.c
    1234
  end

  def using_block(n)
    res = ''
    n.times { |n| res << (n+1).to_s }
    res
  end

  def alias k
    puts "method alias #{k}"
    @alias_called = true
  end

end
