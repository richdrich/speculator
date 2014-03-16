
class StubCaller

  attr_accessor :c1

  def a(c2)
    v1 = c1.meth1(10)
    v2 = c2.meth2(20)
    v1*v2
  end

  def b()
    c1.increment
    c1.increment
    c1.v
  end

  def c()
    c1.increment
    c1.v
  end

end
