When('I organize it into tracks') do
    @track_organizer.organize_conference_tracks(@lecture_list, @conference.first_day_morning, @conference.first_day_afternoon, 
        @conference.second_day_morning, @conference.second_day_afternoon,
        180, 240)
end
  
Then('I should have no remaining lectures') do
    expect(@track_organizer.remaining_lectures_list).to be_empty
end