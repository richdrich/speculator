
module Speculator
  module Track

    class TrackToRedis < TrackControl

      TRACK_CONTROL_KEY = :track_control
      TRACK_INFO_KEY = :track_info

      def initialize(redis)
        @redis = redis
      end

      def reset_track
        @redis.del TRACK_CONTROL_KEY
      end

      def init_track(delete_track_info=true)
        track_targets = @redis.hgetall TRACK_CONTROL_KEY
        return if track_targets.nil?

        @redis.del TRACK_INFO_KEY if delete_track_info

        Speculator::Track::Tracker.untrack!

        track_targets.each do |method_qname, target_info_json|
          # puts "#{method_qname}: target_info_json=#{target_info_json}\n"

          target_info = JSON.parse target_info_json
          Speculator::Track::Tracker.track_function method_qname, target_info['track_classes'] do |track_info|

            [:instance_object].each do |info_class|
              track_info[info_class] = Speculator::Util::VariableSerialize.to_struct track_info[info_class] if track_info.has_key? info_class
            end
            [:args, :res, :instance_variables].each do |info_class|
              track_info[info_class] = Speculator::Util::MakeVariableInitializer.to_init track_info[info_class] if track_info.has_key? info_class
            end

            yaml_info = YAML::dump track_info
            @redis.append TRACK_INFO_KEY, yaml_info
          end
        end
      end


      def request_track( qname, track_classes=[])
        @redis.hset TRACK_CONTROL_KEY, qname, {track_classes: track_classes}.to_json
      end

      def stop_track(qname)
        @redis.hdel TRACK_CONTROL_KEY, qname
      end

      def stop_all
        @redis.del TRACK_CONTROL_KEY
      end
    end
  end
end
