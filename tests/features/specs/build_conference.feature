@build_conference
Feature: Build Conference

    Background: Build Conference
        Given I have built the conference

    @organize_first_day_morning_track
    Scenario: Organize the first day morning track
        When I verify the first day morning track
        Then I should have a 180 min track

    @organize_first_day_afternoon_track
    Scenario: Organize the first day afternoon track
        When I verify the first days afternoon track
        Then the duration of the first afternoon track should be between 180 min and 240 min

    @organize_second_day_morning_track
    Scenario: Organize the second day morning track
        When I verify the second day morning track
        Then the second day morning should have a 180 min track

    @organize_second_day_afternoon_track
    Scenario: Organize the second day afternoon track
        When I verify the second days afternoon track
        Then the duration of the second afternoon track should be between 180 min and 240 min

    @integrate_tracks
    Scenario: Integrate tracks
        When I verify the original lecture list
        Then I should have no remaining lectures on the list

