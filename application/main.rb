require 'pry'
require_relative '../service/track_organizer.rb'
require_relative '../model/lecture.rb'
require_relative '../model/conference.rb'
require_relative '../service/build_lecture.rb'

extend BuildLecture

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


conference = Conference.new
track = TracksOrganizer.new
file_path = File.join(File.dirname(__FILE__), '../proposals.txt')

lecture_list = build_lecture_list(file_path)
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
