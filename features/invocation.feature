Feature: Invocation
  As a Lonely Planet Admin
  I want visitors to see the latest listings
  E.g. by regenerating the site from shitty XML files
  
  Scenario: When I don't provide input files I should be told that I need to
    When I invoke the processor without input files
    Then I should see an error message in the console
  
  Scenario: When I provide valid inputs then I should not get any errors
    When I invoke the processor with valid input files
    Then I shouldn't see any output in the console
