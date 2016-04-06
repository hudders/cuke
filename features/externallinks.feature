Feature: External links
  In order to ensure integration
  As a tester
  I want all external links to go where they are supposed to

Scenario: Home page - Find out more
  Given I am signed in
  And I access Home page
  When I click to "Find out more"
  Then "WHAT IS MEERKAT MOVIES?" is opened

Scenario: Home page - View FAQs
  Given I am signed in
  And I access Home page
  When I click to "View FAQs"
  Then "Featured Support Categories" is opened

Scenario: Confirm details - Meerkat Toys
  Given I am signed in
  And I access Toys Details page
  When I click to "terms & conditions"
  Then "Meerkat Toy Collection Terms and Conditions" is opened

Scenario: Confirm details - MEERKAT MOVIES
  Given I am signed in
  And I access Movies Details page
  When I click to "terms & conditions"
  Then "MEERKAT MOVIES Terms & Conditions" is opened

Scenario: Confirm details - privacy-policy
 	Given I am signed in
 	And I access Details page
 	When I click to "privacy & cookie policy"
 	Then "Privacy & Cookie Policy" is opened

Scenario: Home page w/ membership - See what's on
  Given I have a membership
  When I access Home page
  And I click to "See what's on"
  Then "WATCH THE LATEST FILMS" is opened

Scenario: Home page w/ membership - Find a cinema
  Given I have a membership
  When I access Home page
  And I click to "Find a cinema"
  Then "FIND YOUR NEAREST CINEMA" is opened