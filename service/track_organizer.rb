class TracksOrganizer

    def initialize(lecture_list)
        @lecture_list = lecture_list
    end

    attr_accessor :lecture_list

    def build_conference
        first_day_morning = organize_morning_track
        second_day_morning = organize_morning_track
        first_day_afternoon = orgnize_afternoon_track
        second_day_afternoon = orgnize_afternoon_track

        conference = Conference.new(first_day_morning, first_day_afternoon, second_day_morning, second_day_afternoon)

        return conference
    end

    def organize_morning_track
        morning_track_list = build_track(180)

        if exceded_morning_limit(morning_track_list)
            @lecture_list << @lecture_list.shift
            organize_morning_track
        else
            @lecture_list = @lecture_list - morning_track_list
            return morning_track_list
        end
    end

    def orgnize_afternoon_track    
       afternoon_track_list = build_track(240)

        @lecture_list = @lecture_list - afternoon_track_list

        return afternoon_track_list
    end 

    def build_track(maximum_duration)
        track_list = Array.new
        total_hours = 0
        @lecture_list.each do |current_lecture|
            total_hours += current_lecture.duration

            if total_hours <= maximum_duration
                track_list.push(current_lecture)
            end
        end
        return track_list
    end

    def exceded_morning_limit(morning_track_list)
        track_total_duration = 0
        morning_track_list.each do |current_lecture|
            track_total_duration += current_lecture.duration
        end
        return track_total_duration != 180
    end
end