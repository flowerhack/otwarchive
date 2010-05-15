﻿@users
Feature: Tag wrangling

  Scenario: Log in as a tag wrangler and see wrangler pages
    Given I have no users
      And the following admin exists
      | login       | password | 
      | Zooey       | secret   |
      And the following activated user exists
      | login       | password      | 
      | dizmo       | wrangulator   |
      And a warning exists with name: "No Warnings", canonical: true
    When I am logged in as "dizmo" with password "wrangulator"
    Then I should not see "Tag Wrangling"
    When I follow "Log out"
      And I go to the admin_login page
      And I fill in "admin_login" with "Zooey"
      And I fill in "admin_password" with "secret"
      And I press "Log in as admin"
    Then I should see "Logged in successfully"
    When I fill in "query" with "dizmo"
      And I press "Find"
    Then I should see "dizmo" within "#admin_users_table"
    When I check "user_tag_wrangler"
      And I press "Update"
    Then I should see "User was successfully updated"
    When I follow "Log out"
      And I am logged in as "dizmo" with password "wrangulator"
    Then I should see "Hi, dizmo!"
    When I follow "Tag Wrangling"
    Then I should see "Wrangling Home"
      And I should not see "Stargate SG-1"
    When I follow "Wranglers"
    Then I should see "Tag Wrangling Assignments"
      And I should not see "Stargate SG-1"
    When I follow "Mass Wrangling"
    Then I should see "Fandoms by media (0)"
    When I follow "Fandoms by media (0)"
    Then I should see "Mass Wrangle New/Unwrangled Tags"
      And I should not see "Stargate SG-1"
    When I go to the new work page
      And I select "Not Rated" from "Rating"
      And I check "No Warnings"
      And I fill in "Fandoms" with "Stargate SG-1"
      And I fill in "Work Title" with "Revenge of the Sith 2"
      And I fill in "content" with "That could be an amusing crossover."
      And I press "Preview"
      And I press "Post"
		Then I should see "Work was successfully posted."
    When I follow "Tag Wrangling"
    Then I should see "Wrangling Home"
      And I should see "Mass Wrangling"
      And I should see "Fandoms by media (1)"
    When I follow "Fandoms by media (1)"
    Then I should see "Mass Wrangle New/Unwrangled Tags"
      And I should see "Stargate SG-1"
    When I view the work "Revenge of the Sith 2"
    Then I should see "Stargate SG-1"
    When I follow "Stargate SG-1"
    Then I should see "Edit"
    When I follow "Edit" within ".header"
    Then I should see "Edit Stargate SG-1 Tag"
    When I check "tag_canonical"
      And I press "Save changes"
    Then I should see "Tag was updated"
    When I follow "Tag Wrangling"
    Then I should see "Wrangling Home"
      And I should not see "Stargate SG-1"
    When I follow "Wranglers"
    Then I should see "Tag Wrangling Assignments"
      And I should see "Stargate SG-1"
      And I should not see "dizmo" within ".wranglers"
    When I fill in "tag_fandom_string" with "Stargate SG-1"
      And I press "Assign"
      And I follow "Wrangling Home"
    Then I should see "Stargate SG-1"
    When I follow "Wranglers"
    Then I should see "Stargate SG-1"
      And I should see "dizmo" within ".wranglers"