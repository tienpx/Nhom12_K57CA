Feature: Add a child node
  In order to hold sub-information of a node
  As a user
  I want to create a child node from a given node

  Scenario: Visit the mindmap page
    Given I am an authenticated user
      And I am on the mindmap_index page
    Then I should see the "Add a child node" button

  @javascript
  Scenario: Create a child node from a root node
    Given I am an authenticated user
      And I am on the mindmap_index page
    When I press "New"
      And I click on the root node
      And I press "Add a child node"
      And I click mouse on the mindmap at location(100,100)
    Then I should see a new node added