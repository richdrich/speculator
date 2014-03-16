module Speculator
  module Make

    class OrganiseTrackInfo
      def self.organize(track_info)

        # puts "organize_track_info: "; pp track_info

        class_names = (track_info.map {|ti| ti[:classname] }).uniq

        res = {}
        class_names.each do |cn|
          class_info = track_info.select {|ti| ti[:classname]==cn }
          method_names = (class_info.map {|ti| ti[:methodname] }).uniq

          method_names.each do |mn|
            call_ids = ((class_info.select {|ci| ci[:methodname] == mn } ).map {|ti| ti[:call_id] }).uniq
            # puts "mn=#{mn}, call_ids=#{call_ids}\n"

            call_ids.each do |cid|
              method_call_info = class_info.select { |ci| ci[:methodname]==mn && ci[:call_id]==cid  }.first
              # puts "cid=#{cid}, method_call_info=#{method_call_info.inspect}\n"
              res[cn] = {} unless res.has_key? cn
              res[cn][mn] = {} unless res[cn].has_key? mn
              res[cn][mn][cid] = method_call_info
            end
          end
        end
        res
      end

    end
  end
end
