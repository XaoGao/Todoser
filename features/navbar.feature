Feature: Navbar

    Scenario: I can click a navbar href
      Given I logged in and visit my page
      When I click on navbar href
      Then I see a page message