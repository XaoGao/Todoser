Feature: Navbar

  Scenario: I can click a navbar href about us
    Given I visit my page
    When I click on navbar href about us
    Then I see a page message

  Scenario: I can click a navbar href contacts
    Given I visit root page
    When I click on navbar href contacts
    Then I see a page

  Scenario: I can click a navbar href my dashboard
    Given I visit on dashboard page
    When I click on navbar href my dashboard
    Then I see a message

  Scenario: I can click a navbar href favorites
    Given I visit on favorite page
    When I click on navbar href favorites
    Then I see a favorite message
