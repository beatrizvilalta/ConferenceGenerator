Given('I have a list of lectures') do
  file_path = File.join(File.dirname(__FILE__), '../../../proposals.txt')
  @lecture_list = build_lecture_list(file_path)
end

When('I organize the first day morning track') do
  @track_organizer.organize_first_day_morning_track(@lecture_list, @conference.first_day_morning)
end
  
Then('I should have a {int} min track') do |int|
  hour_result = 0
  @conference.first_day_morning.each do |current_lecture|
      hour_result += current_lecture.duration
  end

  expect(hour_result).to eq(int)
end

When('I organize second days morning track') do
  @track_organizer.organize_second_morning_track(@conference.second_day_morning)
end

Then('the second day morning should have a {int} min track') do |int|
  hour_result = 0
  @conference.second_day_morning.each do |current_lecture|
      hour_result += current_lecture.duration
  end

  expect(hour_result).to eq(int)
end
  
  