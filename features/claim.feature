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

@noclear
Scenario Outline: Can claim movies with each product
	Given I do not have a qualifying purchase
	When I select the <productName> product
	Then I can claim Meerkat Movies

	Examples:
	| productName        |
	| car insurance	     |
	| travel insurance   |
	| home insurance     |
	| pet insurance      |
	| energy  		     |
	| van insurance	     |
	| bike insurance     |
	| credit card	     |
	| loan			     |
	| life insurance     |
	| landlord insurance |
	| mobile phone		 |
	| broadband			 |

@noclear
Scenario Outline: Can claim martha reward with most products
	Given I do not have a qualifying purchase
	When I select the <productName> product
	Then I <canOrCannot> claim martha reward

	Examples:
	| productName        | canOrCannot |
	| car insurance	     | can         |
	| travel insurance   | cannot      |
	| home insurance     | can         |
	| pet insurance      | can         |
	| energy  		     | can         |
	| van insurance	     | can         |
	| bike insurance     | can         |
	| credit card	     | can         |
	| loan			     | can         |
	| life insurance     | can         |
	| landlord insurance | can         |
	| mobile phone		 | cannot      |
	| broadband			 | can         |

@noclear @toytest
Scenario Outline: Can claim both martha rewards
  Given I have a qualifying purchase
  When I select the <toyName> toy
  Then I am able to claim the <toyName> toy

  Examples:
  | toyName            |
  | SergeiSupermanToy  |
  | AleksandrBatmanToy |
