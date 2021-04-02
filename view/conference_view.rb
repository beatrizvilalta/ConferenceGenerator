class ConferenceView 
    def self.show_conference_details(conference_track)
        conference_track.each do |current_lecture|
            puts "#{current_lecture.title}, #{current_lecture.duration}" 
        end
    end
end