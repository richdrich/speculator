require_relative 'stub_caller'

class Ca
  # attr_accessor :v
  def v
    @v
  end

  def initialize()
    @v = 0
  end

  def meth1(x)
    x * 2
  end

  def increment()
    @v += 1
  end
end

class Cb

  def meth2(x)
    x + 2
  end


end


require_relative 'track_to_redis'

redis = Redis.new(host: '127.0.0.1', port: 6379, db: 1)
Speculator::Track::TrackToRedis.request_track(redis, 'StubCaller.a')
Speculator::Track::TrackToRedis.request_track(redis, 'StubCaller.b')
Speculator::Track::TrackToRedis.request_track(redis, 'StubCaller.c')
Speculator::Track::TrackToRedis.init_track(redis)

cut = StubCaller.new
cut.c1 = Ca.new

puts cut.a(Cb.new)  # 10*2 * 20+2 = 20*22 = 440
puts cut.b    # 2
puts cut.c    # 3
