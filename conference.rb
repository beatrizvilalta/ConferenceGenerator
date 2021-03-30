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

    def initialize
        @first_day_morning = Array.new
        @first_day_afternoon = Array.new
        @remaining_lectures = Array.new
    end 

    attr_accessor :first_day_morning, :first_day_afternoon, :remaining_lectures

    
    def organize_first_day_morning_track(lecture_list)
        total_hours = 0
        
        lecture_list.each do |current_lecture|
            total_hours += current_lecture.duration
            if total_hours <= 180
                @first_day_morning.push(current_lecture)
            else
                @remaining_lectures.push(current_lecture) 
            end
        end 
        

        
    end

    def organize_tracks
        total_hours = 0
        index_list = Array.new
                
        @remaining_lectures.each do |current_lecture|

            total_hours += current_lecture.duration

            if total_hours < 240
                @first_day_afternoon.push(current_lecture)
            end
        end
        @remaining_lectures = @remaining_lectures - @first_day_afternoon
    end

end


track = TracksOrganizer.new

track.organize_first_day_morning_track(build_lecture_list('proposals.txt'))
puts 'Morning'
track.first_day_morning.each do |current_lecture|
    puts "title #{current_lecture.title}, duration #{current_lecture.duration}" 
end
track.organize_tracks
puts 'Afternoon'
track.first_day_afternoon.each do |current_lecture|
    puts "title #{current_lecture.title}, duration #{current_lecture.duration}" 
end

class Conference

    def initialize()
    end

    # def initialize(first_day_morning, first_day_afternoon, second_day_morning, second_day_afternoon)
    #     @first_day_morning = first_day_morning
    #     @first_day_afternoon = first_day_afternoon
    #     @second_day_morning = second_day_morning
    #     @second_day_afternoon = second_day_afternoon
    # end

    attr_accessor :first_day_morning, :first_day_afternoon, :second_day_morning, :second_day_afternoon
    
end



 

