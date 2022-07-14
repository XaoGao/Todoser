Feature: Registration  

    Scenario: I can create a new account
      Given I am on registration page
      When I fill all fields and submit form
      Then I see a welcome message for new user