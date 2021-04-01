Given('I organized the first day morning track') do
    file_path = File.join(File.dirname(__FILE__), '../../../proposals.txt')
    morning_lecture_list = build_lecture_list(file_path)
    @track_organizer.organize_first_day_morning_track(morning_lecture_list, @conference.first_day_morning)
end

Given('organized the second day morning track') do
    @track_organizer.organize_single_track(@conference.second_day_morning, 180)
end
  
Given('have a list of the remaining lectures') do
    @remaining_lectures = @track_organizer.remaining_lectures_list
    @maximum_duration = 240
end
  
When('I organize first days afternoon track') do
    @track_organizer.organize_single_track(@conference.first_day_afternoon, @maximum_duration)
end
  
Then('the duration of the first afternoon track should be between {int} min and {int} min') do |minimum, maximum|
    hour_result = 0
    @conference.first_day_afternoon.each do |current_lecture|
        hour_result += current_lecture.duration
    end
    expect(hour_result).to be_between(minimum, maximum)
end

Given('organized the first day afternoon track') do
    @maximum_duration = 240
    @track_organizer.organize_single_track(@conference.first_day_afternoon, @maximum_duration)
end
  
When('I organize second days afternoon track') do
    @track_organizer.organize_single_track(@conference.second_day_afternoon, @maximum_duration)
end
  
Then('the duration of the second afternoon track should be between {int} min and {int} min') do |minimum, maximum|
    hour_result = 0
    @conference.second_day_afternoon.each do |current_lecture|
        hour_result += current_lecture.duration
    end
    expect(hour_result).to be_between(minimum, maximum)
end