Given('I have a list of lectures') do
  @lecture_list = build_lecture_list("proposals.txt")
end
  
When('I organize first days morning track') do
  @tracks = TracksOrganizer.new
  @tracks.organize_first_day_morning_track(@lecture_list)
end
  
Then('I should have a {int} min track') do |int|
  hour_result = 0
  @tracks.first_day_morning.each do |current_lecture|
      hour_result += current_lecture.duration
  end

  expect(hour_result).to eql(int)
end


Given('I organized the first day morning track') do

  morning_lecture_list = build_lecture_list("proposals.txt")

  @new_track = TracksOrganizer.new
  @new_track.organize_first_day_morning_track(morning_lecture_list)
end

Given('have a list of the remaining lectures') do
  @remaining_lectures = @new_track.remaining_lectures
  @maximum_duration = 240
end

When('I organize first days afternoon track') do
  @new_track.organize_tracks
end

Then('the duration of the tracks should be between {int} min and {int} min') do |minimum, maximum|
  hour_result = 0
  @new_track.first_day_afternoon.each do |current_lecture|
      hour_result += current_lecture.duration
  end

  expect(hour_result).to be_between(minimum, maximum)
end
  
  