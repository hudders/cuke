Feature: Claim new membership as non-member
	In order to get Meerkat Movies
  	As a non-member
  	I want to apply for a membership

Scenario: Approved claim
  	Given I have a qualifying purchase
  	When I claim Meerkat Movies
  	Then I am approved for Meerkat Movies

Scenario: Denied claim
	Given I do not have a qualifying purchase
	When I claim Meerkat Movies
	Then I am not approved for Meerkat Movies
	And The claim status is "Validating"

Scenario: Already have a membership
	Given I have a membership
	When I try to claim Meerkat Movies
	Then I cannot claim Meerkat Movies