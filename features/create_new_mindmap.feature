Feature: Create a new mindmap
  In order to start making a mindmap
  As a user
  I want to have a new mindmap with only one root node when I click on 'New' in the menu bar

  Scenario: Visit the mindmap page
    Given I am an authenticated user
      And I am on the mindmap_index page
    Then I should see the "New" button

  @javascript
  Scenario: Create a new mindmap
    Given I am an authenticated user
      And I am on the mindmap_index page
    When I press "New"
    Then I should see only one root node in the drawing area
