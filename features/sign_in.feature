Feature: client searches 
    As an allergy sufferer with 
    in order to personalize my experience on the application, 
    I should be able to sign in with an account
    
@javascript
Scenario: I should see a sign-up and a sign-in button on the landing page
  Given I am on the landing page
  Then I should see the button "Sign Up"
  And I should see the button "Sign In"
  
@javascript
Scenario: If I click Sign-Up then I should be redirected to sign-up page
  Given I am on the landing page
  When I press "Sign-Up" button
  Then I should be on the sign_up page

@javascript
Scenario: If I click Sign-In then I should be redirected to sign-in page
  Given I am on the landing page
  When I press "Sign-In" button
  Then I should be on the sign_in page

@javascript
Scenario: On the sign-up page I should see email, password, password confirmation fields and a sign-up button
  Given I am on the sign_up page 
  Then I should see the field "Email"
  And I should see the field "Password"
  And I should see the field "Password Confirmation"
  And I should see the button "Sign Up"
 
@javascript
Scenario: If I input the info and click Sign-Up I should be taken to the user homepage
  Given I am on the sign_up page 
  When I fill in "Email" with "JohnWayne@gmail.com"
  And I fill in "Password" with "12345"
  And I fill in "Password Confirmation" with "12345"
  And I press "Sign Up"
  Then I should be on the user homepage
  
@javascript
Scenario: On the sign-in page I should see email, password fields and a sign-in button
  Given I am on the sign_in page 
  Then I should see the field "Email"
  And I should see the field "Password"
  And I should see the button "Sign In"
 
@javascript
Scenario: If I input the info and click Sign-In I should be taken to the user homepage
  Given I am on the sign_in page 
  When I fill in "Email" with "JohnWayne@gmail.com"
  And I fill in "Password" with "12345"
  And I press "Sign In"
  Then I should be on the user homepage
  
  
  