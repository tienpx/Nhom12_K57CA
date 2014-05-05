Feature: Create a new mindmap
  In order to start making a mindmap
  As a user
  I want to have a new mindmap with only one root node when I click on 'New' in the menu bar


  Scenario: New mindmap
    Given I am on the mindmap_index page
    When I click "New"
    Then I should see only one root node in the drawing area
