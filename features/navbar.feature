Feature: Navbar

  Scenario: I can visit about us page
    Given I visit welcome page for about us
    When I click on a link about us
    Then I should see a about us title

  Scenario: I can visit contacts page
    Given I visit welcome page for contacts
    When I click on a link contacts
    Then I should see a contacts title

  Scenario: I can visit my dashboard page
    Given I visit welcome page for dashboard
    When I click on a link my dashboard
    Then I should see a dashboard title

  Scenario: I can visit favorites page
    Given I visit welcome page for favorites
    When I click on a link favorites
    Then I should see a favorites title
