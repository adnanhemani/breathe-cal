Feature:
  As an allergy sufferer, in order to know the allergen information for
  my location, I should be able to add and edit allergens on the map.
  
Background:
  Given I am on the landing page
  Given I click click here to add an allergen
  
#PIVOTAL ID 152021104
#Click on the map and see the box to create an allergen
Scenario: Once I've loaded the app, I should be able to begin creating an allergen
  When I click on the map
  Then I should view the create allergen box
  
#PIVOTAL ID 152021104
#SAD PATH: Click outside the map, and don't see the box to create an allergen
Scenario: Once I've loaded the app, I should not be able to click outside the map and create an allergen
  When I click on the green area of the sidebar
  Then I should not view the create allergen box

#PIVOTAL ID 152021104
#Be able to fully add an allergen
Scenario: Once the create allergen box is up, I should be able to add an allergen
  Given I click on the map
  Given I should view the create allergen box
  When I fill in title with cat
  When I check cat
  When I press submit
  #Then I should see the allergen on the map
  #check the labelNum before adding marker, then check for a marker with a labelNum of 1 more
  
#PIVOTAL ID 152021104
#Add and edit an allergen on the map, see the edits
Scenario: Once I've loaded the app and added an allergen, I should be able to edit the allergen.
  Given I have added a dog allergen
  When I click on the allergen

#PIVOTAL ID 152021104
#Login and add an allergen, logout, switch users and have it still be there
Scenario: Once I login and add an allergen, that allergen should still be there if I log out/switch users
  #Given


#PIVOTAL ID 152021104
#
