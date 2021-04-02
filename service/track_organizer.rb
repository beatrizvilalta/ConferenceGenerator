class TracksOrganizer

    def initialize(lecture_list)
        @lecture_list = lecture_list
    end

    attr_accessor :lecture_list


    def organize_morning_track
        track_total_duration = 0
        total_hours = 0
        morning_track_list = Array.new

        @lecture_list.each do |current_lecture|
            total_hours += current_lecture.duration

            if total_hours <= 180
                morning_track_list.push(current_lecture)
            end
        end

        morning_track_list.each do |current_lecture|
            track_total_duration += current_lecture.duration
        end

        if track_total_duration != 180 
            @lecture_list << @lecture_list.shift
            organize_morning_track
        else
            @lecture_list = @lecture_list - morning_track_list
            return morning_track_list
        end
    end

    def orgnize_afternoon_track
        total_hours = 0
        afternoon_track = Array.new
                
        @lecture_list.each do |current_lecture|
            total_hours += current_lecture.duration

            if total_hours <= 240
                afternoon_track.push(current_lecture)
            end
        end
        @lecture_list = @lecture_list - afternoon_track

        return afternoon_track
    end 

    def build_conference
        first_day_morning = organize_morning_track
        second_day_morning = organize_morning_track
        first_day_afternoon = orgnize_afternoon_track
        second_day_afternoon = orgnize_afternoon_track

        conference = Conference.new(first_day_morning, first_day_afternoon, second_day_morning, second_day_afternoon)

        return conference
    end
end