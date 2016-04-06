Feature: Allow authenticated users access
  In order to claim rewards
  As a user
  I want to access the journey

Scenario: Signed in user can access homepage
  Given I am signed in
  When I access Home page
  Then Home page is displayed

Scenario: Signed in user can access choose product page
  Given I am signed in
  When I access Product page
  Then Product page is displayed

Scenario: Signed in user can access choose reward page
  Given I am signed in
  When I access Reward page
  Then Reward page is displayed

Scenario: Signed in user can access confirm details page
  Given I am signed in
  When I access Toys Details page
  Then Toys Details page is displayed
  
Scenario: Signed in user is redirected to homepage from congratulations page
  Given I am signed in
  When I access Congratulations page
  Then Home page is displayed

Scenario: Signed in user can access claims history page
  Given I am signed in
  When I access History page
  Then History page is displayed

# Signed in above, signed out below this point.
Scenario: Signed out user is redirected to signin page from homepage
  Given I am not signed in
  When I access Home page
  Then Sign In page is displayed

Scenario: Signed out user is redirected to signin page from choose product page
  Given I am not signed in
  When I access Product page
  Then Sign In page is displayed

Scenario: Signed out user is redirected to signin page from choose reward page
  Given I am not signed in
  When I access Reward page
  Then Sign In page is displayed

Scenario: Signed out user is redirected to signin page from confirm details page
  Given I am not signed in
  When I access Details page
  Then Sign In page is displayed 

Scenario: Signed out user is redirected to signin page from congratulations page
  Given I am not signed in
  When I access Congratulations page
  Then Sign In page is displayed

Scenario: Signed out user is redirected to signin page from claims history page
  Given I am not signed in
  When I access History page
  Then Sign In page is displayed