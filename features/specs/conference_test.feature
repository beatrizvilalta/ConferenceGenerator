Feature: Conference

    @build_lecture
    Scenario Outline: Build lecture successfully
        Given I have a "<line>"
        When I separate it by title and duration
        Then I should have a lecture with the right "<title>" and <duration>

        Examples:
            | line                                                                        | title                                                                 | duration |
            | Diminuindo tempo de execução de testes em aplicações Rails enterprise 60min | Diminuindo tempo de execução de testes em aplicações Rails enterprise | 60       |
            | Rails para usuários de Django lightning                                     | Rails para usuários de Django                                         | 5        |

    @build_lecture_list_successfully
    Scenario: Build Lecture List successfully
        Given I have a file with lectures
        When I read the file
        Then I should have a Lecture List

    @build_lect_list_unsuccessfully
    Scenario: Build Lecture unsuccessfully
        Given I have an empty file
        When I read the file
        Then I should have an empty list

    @organize_first_day_morning_track
    Scenario: Organize the first day morning track
        Given I have a list of lectures
        When I organize first days morning track
        Then I should have a 180 min track

    @organize_first_day_afternoon_track
    Scenario: Organize the first day afternoon track
        Given I organized the first day morning track
        And have a list of the remaining lectures
        When I organize first days afternoon track
        Then the duration of the tracks should be between 180 min and 240 min

@organize_second_day_morning_track
# Scenario: Organize the second day morning track
#     Given I have a list of lectures
#     When I organize second days morning track
#     Then I should have a 3 hour track

@organize_second_day_afternoon_track
# Scenario: Organize the second day afternoon track
#     Given I have a list of lectures
#     When I organize second days afternoon track
#     Then I should have at least a 3 hour track
#     And a less than 4 hour track

@integrate_tracks
