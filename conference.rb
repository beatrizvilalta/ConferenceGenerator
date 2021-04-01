require 'pry'
# Você está planejando uma grande conferencia de programação e recebeu diversas propostas de palestras, 
# mas você está com problemas para organizá-las de acordo com as restrições de tempo do dia - existem tantas possibilidades! 
# Então, você decide escrever um programa para fazer isso por você.

#     A conferencia tem várias tracks, cada qual tendo uma sessão pela manhã e outra pela tarde.
#     Cada sessão contém várias palestras.
#     Sessões pela manhã começam às 9h e devem terminar às 12h, para o almoço.
#     Sessões pela tarde começam às 13h e devem terminar a tempo de realizar o evento de networking.
#     O evento de networking deve começar depois das 16h, mas antes das 17h.
#     Nenhum dos nomes das palestras possui números.
#     A duração de todas as palestras são fornecidas em minutos ou definidas como lightning (palestras de 5 minutos).
#     Os palestrantes serão bastante pontuais, então não há a necessidade de intervalos entre as palestras.

# TODO:
# 1 - ler arquivo - Done
# 2 - separar o texto e o tempo - in progress
# 3 - botar em uma lista com texto e tempos separados
# 4 - organizar a lista de acordo as sessões


class Lecture

    def initialize(title, duration)
        @title = title
        @duration = duration
    end

    attr_reader :title, :duration
    
end


def build_lecture(line)

    if line.include? "lightning"
        line.sub!("lightning", "5min")
    end

    splittig = line.split(/(\d+)(?=\s*min)/) 
    title = splittig[0].strip!
    duration = splittig[1].to_i

    lecture = Lecture.new(title, duration)

    return lecture

end

def build_lecture_list(file_path)
    lecture_list = Array.new

    File.foreach(file_path) do |line| 

        lecture = build_lecture(line)

        lecture_list.push(lecture)
    end

    return lecture_list
end


    
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

    # def organize_second_morning_track(second_day_morning, maximum_duration)
    #     current_hours = 0
    #     total_hours = 0

    #     @remaining_lectures_list.each do |current_lecture|
    #         total_hours += current_lecture.duration

    #         if total_hours <= maximum_duration
    #             second_day_morning.push(current_lecture)
    #         end
    #     end

    #     second_day_morning.each do |current_lecture|
    #         current_hours += current_lecture.duration
    #     end

    #     if current_hours != 180 
    #         @remaining_lectures_list << @remaining_lectures_list.shift
            
    #         organize_second_morning_track(second_day_morning, maximum_duration)
    #     else
    #         @remaining_lectures_list = @remaining_lectures_list - second_day_morning
    #     end
    # end

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

    def organize_conference_tracks(lecture_list, first_day_morning, first_day_afternoon, 
        second_day_morning, second_day_afternoon,
        morning_maximum_duration, afternoon_maximum_duration)
        
        organize_first_day_morning_track(lecture_list, first_day_morning)
        organize_single_track(second_day_morning, morning_maximum_duration)
        organize_single_track(first_day_afternoon, afternoon_maximum_duration)
        organize_single_track(second_day_afternoon, afternoon_maximum_duration)

    end
end


class Conference

    def initialize()
        @first_day_morning = Array.new
        @first_day_afternoon = Array.new
        @second_day_morning = Array.new
        @second_day_afternoon = Array.new
    end

    attr_accessor :first_day_morning, :first_day_afternoon, :second_day_morning, :second_day_afternoon
    
end

conference = Conference.new
track = TracksOrganizer.new

lecture_list = build_lecture_list('proposals.txt')
first_day_morning_track = conference.first_day_morning
first_day_afternoon_track = conference.first_day_afternoon
second_day_morning_track = conference.second_day_morning
second_day_afternoon_track = conference.second_day_afternoon
morning_maximum_duration = 180
afternoon_maximum_duration = 240

track.organize_conference_tracks(lecture_list, first_day_morning_track, first_day_afternoon_track, 
    second_day_morning_track, second_day_afternoon_track, 
    morning_maximum_duration, afternoon_maximum_duration)

puts 'First day Morning'
conference.first_day_morning.each do |current_lecture|
    puts "title #{current_lecture.title}, duration #{current_lecture.duration}" 
end
puts
puts 'First day Afternoon'
conference.first_day_afternoon.each do |current_lecture|
    puts "title #{current_lecture.title}, duration #{current_lecture.duration}" 
end
puts
puts 'Second day Morning'
conference.second_day_morning.each do |current_lecture|
    puts "title #{current_lecture.title}, duration #{current_lecture.duration}" 
end
puts
puts 'Second day Afternoon'
conference.second_day_afternoon.each do |current_lecture|
    puts "title #{current_lecture.title}, duration #{current_lecture.duration}" 
end
