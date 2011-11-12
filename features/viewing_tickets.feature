Feature: Viewing tickets
  In order to view the tickets for a project
  As a user
  I want to see them on that project's page

  Background:
    Given a project exists
    And the project has a ticket
    And another project exists
    And the second project has a different ticket
    And I am on the home page

  Scenario: Viewing tickets for a given project
    When I navigate to the project's page
    Then I should see the first project's ticket
    And I should not see the second project's ticket
    When I navigate to the first ticket's page
    Then I should see the first ticket's information

    When I go back to the home page
    And I navigate to the second project's page
    Then I should see the second project's ticket
    And I should not see the first project's ticket
    When I navigate to the second ticket's page
    Then I should see the second ticket's information
