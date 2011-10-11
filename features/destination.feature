@wip
Feature: Destinations
  As a Lonely Planet Admin
  I want visitors to buy my products and services related to a destination
  E.g. by viewing information about the destination on my site
  
  Background:
    Given there is a destinations file containing
      """
      <destinations>
        <destination atlas_id="1" title="Someplace">
          <introductory>
            <introduction>
              <overview>This is an excellent place to go</overview>
            </introduction>
          </introductory>
        </destination>
      </destinations>
      """
      And I have not described any relationships between destinations
  
  Scenario: When a destination is described it should be rendered
     When I invoke the processor
     Then I should see a destination file called "1.html"
  
  Scenario: When a destination is described its properties should be visible
     When I invoke the processor
      And I open the destination "1"
     Then I should see the heading "Someplace"
      And I should see "This is an excellent place to go"
  