

class Target

  attr_accessor :q

  def a(x)
    puts "a passed <#{x}>"

    multi(4,5,6)    # just as a test
    multi(10)

    k = 'Hello'
    puts stringy(k)

    sx = Math.sqrt(x)
    sx += number(1)
  end

  def self.classmethod(a)
    return "classmethod called with #{a}"
  end

  def add_q(a)
    rv = a + @q
    puts "add_q returns #{rv}"
    rv
  end

  def number(v)
    v
  end

  def multi(a,b=0,c=0)
    a + b + c
  end

  def stringy(z)
    '<' + z + '>'
  end

  def b
    puts "called b"
  end

  def c
    puts "called c"
  end

  def user_f
    used_inst = Used.new
    used_inst.f(5)
  end

  def user_i(init, s)
    used_inst = Used.new(init)
    used_inst.i(s)
  end

  def user_c
    puts "call Used.c\n"
    Used.c + 10000
  end

  def munge(f,t)
    res = yield(f).to_s

    (f+1..t).each do |v|
      res << '-' + yield(v).to_s
    end

    res
  end

  def use_block(n)
    used_inst = Used.new
    a = []
    n.times {|v| a << used_inst.f(v) }
    a
  end

  def use_use_block(n)
    used_inst = Used.new
    used_inst.using_block n
  end

  def test_alias
    @a = Used.new

    @a.alias 'world'

    @a
  end

#  im = instance_method(:a)
#
#  define_method(:a) { |*args|
#    puts "tracked a, #{args.inspect}"
#    #pp im
#    #pp mod
#
#    #set_trace_func @@tracer_func
#
#    method_binding = im.bind(self)
#    puts "method_binding=#{method_binding.inspect}"
#
##      method_binding.call(*args, &block)
#    res = method_binding.(*args)
#
#    #set_trace_func nil
#
#    puts "Returned #{res}"
#    res
#  }


end
