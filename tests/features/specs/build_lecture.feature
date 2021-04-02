@build_lecture
Feature: Build Lecture

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