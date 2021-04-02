require 'pry'
require_relative '../service/track_organizer.rb'
require_relative '../model/lecture.rb'
require_relative '../model/conference.rb'
require_relative '../service/build_lecture.rb'
require_relative '../view/conference_view.rb'
extend BuildLecture

file_path = File.join(File.dirname(__FILE__), '../proposals.txt')

lecture_list = build_lecture_list(file_path)
track = TracksOrganizer.new(lecture_list)
conference = track.build_conference


puts 'First Morning'
ConferenceView.show_conference_details(conference.first_day_morning)
puts
puts 'First day Afternoon'
ConferenceView.show_conference_details(conference.first_day_afternoon)
puts
puts 'Second day Morning'
ConferenceView.show_conference_details(conference.second_day_morning)
puts
puts 'Second day Afternoon'
ConferenceView.show_conference_details(conference.second_day_afternoon)
