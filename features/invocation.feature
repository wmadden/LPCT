@wip
Feature: Invocation
  As a Lonely Planet Admin
  I want visitors to see the latest listings
  E.g. by regenerating the site from shitty XML files
  
  Scenario: When I don't provide input files I should be told that I need to
    When I invoke the processor without input files
    Then I should see a usage message
  
  Scenario: When I provide valid inputs then I should get some HTML
    When I invoke the processor with valid input files
    Then some output files should be created