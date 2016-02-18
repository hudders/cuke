Feature: Claim toy
  In order to get a toy
  As a customer
  I want to claim a toy

Scenario: Claim toy
  Given I have a qualifying purchase
  When I claim a toy
  Then I am approved for a toy

Scenario: Cannot claim toy with the travel product
  Given I have a qualifying purchase
  When I select the travel insurance product
  Then I cannot claim a toy

Scenario: Cannot claim toy with the mobile phone product
  Given I have a qualifying purchase
  When I select the mobile phone product
  Then I cannot claim a toy

# Scenario: Deny toy claim
#   Given I do not have a qualifying purchase
#   When I claim a toy
#   Then I am not approved for a toy