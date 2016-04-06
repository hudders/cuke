Feature: Claim toy
  In order to get a toy
  As a customer
  I want to claim a toy

@noclear
Scenario: Claim toy
  Given I have a qualifying purchase
  When I claim a toy
  Then I am approved for a toy

@noclear
Scenario Outline: Can claim toys with most products
  Given I have a qualifying purchase
  When I select the <productName> product
  Then I <canOrCannot> claim a toy

  Examples:
  | productName        | canOrCannot |
  | car insurance      | can         |
  | travel insurance   | cannot      |
  | home insurance     | can         |
  | pet insurance      | can         |
  | energy             | can         |
  | van insurance      | can         |
  | bike insurance     | can         |
  | credit card        | can         |
  | loan               | can         |
  | life insurance     | can         |
  | landlord insurance | can         |
  | mobile phone       | cannot      |
  | broadband          | can         |

@noclear @toytest
Scenario Outline: Can claim all toys
  Given I have a qualifying purchase
  When I select the <toyName> toy
  Then I am able to claim the <toyName> toy

  Examples:
  | toyName     |
  | Sergei      |
  | Aleksandr   |
  | Oleg        |
  | Maiya       |
  | Yakov       |
  | Bogdan      |
  | Vassily     |
  # | Surprise me |