Feature: Drawing Interface
  In order to have a page where i can draw my mindnap
  As a logged-in user
  I want a page that contains Drawing interface

  Scenario: Rename mindmap
    Given I am on drawing_page
    When I click button "title"
    Then I should see "rename" input field
    When I enter "newname" to "rename" input field
    Then I should see "title" is "newname"