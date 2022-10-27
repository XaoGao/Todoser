Feature: Notifications
  
    Scenario: I should see notifications
      Given I am sign in for notifications
      When I visit the notifications page
      Then I should see title for all notifications
