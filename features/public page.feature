<<<<<<< HEAD
Feature: Public page
    In order to improve my mindmap with others' opinions
    As a registered user
    I want a public page that others can view and alow them to post comments.

Scenario: View public page as a registered users
    Given I have logged in
    And I am on a public page
    Then I should see a mindmap
    And I should see a comment field
    And I should see a name field
    And I should see a post button

    
Scenario: View public page anonymously
    Given I haven't logged in
    And I am on a public page
    Then I should see a mindmap
    
Scenario: Posting a comment
    Given I have logged in
    And I am on a public page
    And I fill in the comment field with "First comment"
    And I fill in the name field with "Bob"
    When I press the post button
    Then I should see "Bob"
    Then I should see "First comment"
=======
Feature: Public page
    In order to improve my mindmap with others' opinions
    As a registered user
    I want a public page that others can view and alow them to post comments.

Scenario: View public page as a registered users
    Given I have logged in
    And I am on a public page
    Then I should see a mindmap
    And I should see a comment field
    And I should see a name field
    And I should see a post button

    
Scenario: View public page anonymously
    Given I haven't logged in
    And I am on a public page
    Then I should see a mindmap
    
Scenario: Posting a comment
    Given I have logged in
    And I am on a public page
    And I fill in the comment field with "First comment"
    And I fill in the name field with "Bob"
    When I press the post button
    Then I should see "Bob"
    Then I should see "First comment"
>>>>>>> 1cbc2b590a99f4611f025397e916440200b33749
