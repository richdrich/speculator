require_relative 'used'
require_relative 'target'
require 'speculator'

redis = Redis.new(host: '127.0.0.1', port: 6379, db: 1)
track = Speculator::Track::TrackToRedis.new redis

examples = [{method: :user_f, stub: 'Used'},
            {method: :classmethod},
            {method: :user_c, stub: 'Used'},
            {method: :add_q},
            {method: :user_i, stub: 'Used'},
            {method: :munge},
            {method: :a},
            {method: :use_block, stub: 'Used'},
            {method: :use_use_block, stub: 'Used'},
            {method: :test_alias, stub: 'Used'}
]

runnables = []
dogfood = false
ARGV.each do |arg|
  if arg=='--all'
    runnables = examples.map {|ex| ex[:method].to_s}
  elsif arg=='--dogfood'
    dogfood = true
  else
    puts "#{arg} not a defined testable method\n" unless examples.find {|ex| ex[:method].to_s == arg }
    runnables << arg
  end
end

examples.delete_if {|ex| ! runnables.include? ex[:method].to_s}

track.reset_track
examples.each { |example| track.request_track("Target.#{example[:method]}", [example[:stub]].compact) }

if dogfood
  track.request_track('Speculator::Make::ExpectReturnMaker.make_expect_return')
end

track.init_track

examples.each do |example|

  if Target.respond_to? example[:method]
    t = Target.class
  elsif Target.method_defined? example[:method]
    t = Target.new
  else
    puts "Method #{example[:method]} is not implemented\n"
    next
  end

  case example[:method]
  when :user_f
    res = t.user_f
    puts "#{example[:method]} returns #{res} exp 7\n"
  when :classmethod
    res = Target.classmethod({a:1, b:2})
    puts "#{example[:method]} returns #{res}\n"
  when :user_c
    res = t.user_c
    puts "#{example[:method]} returns #{res} exp 11234\n"
  when :add_q
    t.q = 100
    v = t.add_q 50
    puts "v (exp 150): #{v}"

    t.q = 25
    v = t.add_q 25
    puts "v (exp 50): #{v}"
  when :user_i
    res = t.user_i(5,10)
    puts "user_i returns #{res} expected 15\n"

    res = t.user_i(100,12)
    puts "user_i returns #{res} expected 112\n"
  when :munge
    res = t.munge(1,3) do |v|
      v * 2
    end

    puts "munge returns #{res} expected 2-4-6\n"
  when :a
    t.b
    res = t.a(25)
    t.c
  when :use_block
    res = t.use_block 3
    puts "use_block returns #{res} expected [2,3,4]\n"
  when :use_use_block
    res = t.use_use_block(3)
    puts "use_use_block returns #{res} expected 123\n"
  when :test_alias
    res = t.test_alias.alias_called
    puts "test_alias returns #{res} expected true\n"
  else
    res = t.send example[:method]
    puts "#{example[:method]} returns #{res}\n"
  end

end


Speculator::Make::SpecMaker.make_from_redis 'Target', examples.map {|ex| ex[:method]},
      examples.map {|ex| ex[:stub]}.compact,
      File.dirname(__FILE__) + '/gen_specs'

track.stop_all
track.init_track false

if dogfood
  Speculator::Make::SpecMaker.make_from_redis 'Speculator::Make::ExpectReturnMaker', ['make_expect_return'], [], File.dirname(__FILE__) + '/../gen_specs'
end
