class TracksOrganizer

    def initialize()
        @remaining_lectures_list = Array.new
    end

    attr_reader :remaining_lectures_list

    
    def organize_first_day_morning_track(lecture_list, first_track_list)
        total_hours = 0
        
        lecture_list.each do |current_lecture|
            total_hours += current_lecture.duration
            if total_hours <= 180
                first_track_list.push(current_lecture)
            else
                @remaining_lectures_list.push(current_lecture) 
            end
        end 
    end
    
    def organize_single_track(track_of_the_day_list, maximum_duration)
        total_hours = 0
                
        @remaining_lectures_list.each do |current_lecture|
            total_hours += current_lecture.duration

            if total_hours <= maximum_duration
                track_of_the_day_list.push(current_lecture)
            end
        end
        @remaining_lectures_list = @remaining_lectures_list - track_of_the_day_list
    end

    def organize_second_morning_track(second_day_morning)
        track_total_duration = 0
        total_hours = 0

        @remaining_lectures_list.each do |current_lecture|
            total_hours += current_lecture.duration

            if total_hours <= 180
                second_day_morning.push(current_lecture)
            end
        end

        second_day_morning.each do |current_lecture|
            track_total_duration += current_lecture.duration
        end

        if track_total_duration != 180 
            @remaining_lectures_list << @remaining_lectures_list.shift
            second_day_morning.clear
            organize_second_morning_track(second_day_morning)
        else
            @remaining_lectures_list = @remaining_lectures_list - second_day_morning
        end
    end 

    def organize_conference_tracks(lecture_list, first_day_morning, first_day_afternoon, 
        second_day_morning, second_day_afternoon,
        morning_maximum_duration, afternoon_maximum_duration)
        
        organize_first_day_morning_track(lecture_list, first_day_morning)
        organize_second_morning_track(second_day_morning)
        organize_single_track(first_day_afternoon, afternoon_maximum_duration)
        organize_single_track(second_day_afternoon, afternoon_maximum_duration)

    end  
end


    