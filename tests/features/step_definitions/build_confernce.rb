Given('I have built the conference') do
    file_path = File.join(File.dirname(__FILE__), '../../../proposals.txt')
    lecture_list = build_lecture_list(file_path)
    
    @track_organizer = TracksOrganizer.new(lecture_list)    
    @conference = @track_organizer.build_conference    
end
  
When('I verify the first day morning track') do
    
    first_day_morning = @conference.first_day_morning
    
    @hour_result = 0
    first_day_morning.each do |current_lecture|        
        @hour_result += current_lecture.duration
    end
end

Then('I should have a {int} min track') do |int|
    expect(@hour_result).to eq(int)
end
  
When('I verify the first days afternoon track') do
    first_day_afternoon = @conference.first_day_afternoon

    @hour_result = 0
    first_day_afternoon.each do |current_lecture|
        @hour_result += current_lecture.duration
    end

end

Then('the duration of the first afternoon track should be between {int} min and {int} min') do |minimum, maximum|
    expect(@hour_result).to be_between(minimum, maximum)
end
  
When('I verify the second day morning track') do
    second_day_morning = @conference.second_day_morning

    @hour_result = 0
    second_day_morning.each do |current_lecture|
        @hour_result += current_lecture.duration
    end
end

Then('the second day morning should have a {int} min track') do |int|
    expect(@hour_result).to eq(int)
end
  
When('I verify the second days afternoon track') do
    second_day_afternoon = @conference.second_day_afternoon

    @hour_result = 0
    second_day_afternoon.each do |current_lecture|
        @hour_result += current_lecture.duration
    end
end

Then('the duration of the second afternoon track should be between {int} min and {int} min') do |minimum, maximum|
    expect(@hour_result).to be_between(minimum, maximum)
end

When('I verify the original lecture list') do
    @remaining_lecture_list = @track_organizer.lecture_list
end
  
Then('I should have no remaining lectures on the list') do
    expect(@remaining_lecture_list).to be_empty
end