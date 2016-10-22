Feature: Locations 
    As an allergy sufferer
    in order to look for allergens for a location,
    I need to be able to see nearby locations, 
    search for a location, and add locations as favorites. 

@javascript
Scenario: Searching for a location  
    Given I am on the landing page
    And the map has been loaded
    And my location is set to "37.8716" lat and "-122.2727" lng
    Then the center of the map should be approximately "37.8716" lat and "-122.2727" lng
 