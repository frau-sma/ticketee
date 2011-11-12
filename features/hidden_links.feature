Feature: Hidden links
  In order to clean up the user experience
  As the system
  I want to hide links from users who cannot use them

  Background:
    Given a project exists

  Scenario: New Project link is hidden for non-signed-in users
    Given I am on the home page
    Then I should not see the "New Project" link

  Scenario: New Project link is hidden for ordinary users
    Given I am a confirmed user
    And I am signed in
    And I am on the home page
    Then I should not see the "New Project" link

  Scenario: New Project link is visible for admin users
    Given I am an admin user
    And I am signed in
    And I am on the home page
    Then I should see the "New Project" link

  Scenario: Edit Project link is hidden for non-signed-in users
    Given I am on the home page
    And I navigate to the project's page
    Then I should not see the "Edit Project" link

  Scenario: Edit Project link is hidden for ordinary users
    Given I am a confirmed user
    And I am signed in
    And I am on the home page
    And I navigate to the project's page
    Then I should not see the "Edit Project" link

  Scenario: Edit Project link is visible for admin users
    Given I am an admin user
    And I am signed in
    And I am on the home page
    And I navigate to the project's page
    Then I should see the "Edit Project" link

  Scenario: Delete Project link is hidden for non-signed-in users
    Given I am on the home page
    And I navigate to the project's page
    Then I should not see the "Delete Project" link

  Scenario: Delete Project link is hidden for ordinary users
    Given I am a confirmed user
    And I am signed in
    And I am on the home page
    And I navigate to the project's page
    Then I should not see the "Delete Project" link

  Scenario: Delete Project link is visible for admin users
    Given I am an admin user
    And I am signed in
    And I am on the home page
    And I navigate to the project's page
    Then I should see the "Delete Project" link
