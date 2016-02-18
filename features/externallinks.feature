Feature: External links
  In order to ensure integration
  As a tester
  I want all external links to go where they are supposed to

Scenario: Home page - Find out more
  Given I am signed in
  And I access Home page
  When I click to "Find out more"
  Then "http://www.comparethemarket.com/meerkat/movies/how-to/" is opened

Scenario: Home page - View FAQs
  Given I am signed in
  And I access Home page
  When I click to "View FAQs"
  Then "https://compare-the-market.custhelp.com/" is opened

Scenario: Confirm details - Meerkat Toys
  Given I am signed in
  And I access Details page
  When I click to "Meerkat Toys"
  Then "http://www.comparethemarket.com/information/simples-rewards-terms-and-conditions/" is opened

Scenario: Confirm details - MEERKAT MOVIES
  Given I am signed in
  And I access Details page
  When I click to "MEERKAT MOVIES"
  Then "http://www.comparethemarket.com/information/meerkat-movies-terms/" is opened

Scenario: Confirm details - privacy-policy
 	Given I am signed in
 	And I access Details page
 	When I click to "privacy & cookie policy"
 	Then "http://www.comparethemarket.com/information/privacy-policy/" is opened

Scenario: Home page w/ membership - See what's on
  Given I have a membership
  When I access Home page
  And I click to "See what's on"
  Then "http://www.comparethemarket.com/meerkat/movies/films/" is opened

Scenario: Home page w/ membership - Find a cinema
  Given I have a membership
  When I access Home page
  And I click to "Find a cinema"
  Then "http://www.comparethemarket.com/meerkat/movies/cinema-locator/" is opened