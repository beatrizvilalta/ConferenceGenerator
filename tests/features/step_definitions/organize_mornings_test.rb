Given('I have a list of lectures') do
  @lecture_list = build_lecture_list("proposals.txt")
end

When('I organize the first day morning track') do
  morning_lecture_list = build_lecture_list("proposals.txt")
  @track_organizer.organize_first_day_morning_track(morning_lecture_list, @conference.first_day_morning)
end
  
Then('I should have a {int} min track') do |int|
  hour_result = 0
  @conference.first_day_morning.each do |current_lecture|
      hour_result += current_lecture.duration
  end

  expect(hour_result).to eql(int)
end

When('I organize second days morning track') do
  @track_organizer.organize_single_track(@conference.second_day_morning, 180)
end

Then('the second day morning should have a {int} min track') do |int|
  hour_result = 0
  @conference.second_day_morning.each do |current_lecture|
      hour_result += current_lecture.duration
  end

  expect(hour_result).to eql(int)
end
  
  