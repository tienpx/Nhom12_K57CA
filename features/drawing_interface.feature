Feature: Drawing Interface
  In order to have a page where i can draw my mindnap
  As a logged-in user
  I want a page that contains Drawing interface

  Scenario: Rename mindmap
    Given I am an authenticated user
    And I am on the mindmap_index page
    Then I should see field named "menu_bar"
    Then I should see field named "tools_box"
    Then I should see field named "library"
    Then I should see field named "draw_area"