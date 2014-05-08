Feature: Image Library
  In order to make my mindmap more beautiful
  As a logged-in user
  I want the mindmap drawing page should contain Image Lib

  @javascript
  Scenario: Visit the mindmap page
    Given I am an authenticated user
    And I am on the mindmap_index page
    Then I should see the "category" select box
    Then I should see the "load images" button

  Scenario: Load image lib
    Given I am an authenticated user
    And I am on the mindmap_index page
    When I select "art" from "category"
    And I press "load images" button
    Then I should see "Palette" image
