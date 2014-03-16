require_relative 'target'
require 'speculator'

redis = Redis.new(host: '127.0.0.1', port: 6379, db: 1)

Speculator::Track::TrackToRedis.request_track(redis, 'Target.a')

Speculator::Track::TrackToRedis.init_track(redis)

# Speculator::Track::Tracker.track_function('Target.a') { |t| pp t }


t = Target.new
t.b
res = t.a(25)
t.c
pp res

t.q = 100
puts t.add_q(5)

puts Target.classmethod([1,2,3])
