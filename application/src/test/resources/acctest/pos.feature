Feature: Points of Sale Management
  This feature allows users to create and modify points of sale (POS).

  Scenario: Insert and retrieve two POS
    Given an empty POS list
    When I insert POS with the following elements
      | name                   | description             | type             | campus | street          | houseNumber | postalCode | city     |
      | Lidl (Nürnberger Str.) | Vending machine at Lidl | VENDING_MACHINE  | ZAPF   | Nürnberger Str. | 3a          | 95448      | Bayreuth |
      | New Cafe               | Fancy new cafe          | CAFE             | MAIN   | Teststraße      | 99          | 12345      | New City |
    Then the POS list should contain the same elements in the same order

  Scenario: Update one of three existing POS
    Given the following POS exist:
      | name         | description          | type         | campus | street       | houseNumber | postalCode | city     |
      | Coffee Bar   | Best espresso        | CAFE         | MAIN   | Hauptstraße  | 3a          | 95448      | Bayreuth |
      | Snack Point  | Fresh sandwiches     | CAFE         | MAIN   | Nebenstraße  | 99          | 12345      | New City |
      | Juice Corner | Natural juices only  | VENDING_MACHINE | ZAPF  | Marktstraße  | 15          | 17745      | old City |
    When I update the POS "Snack Point" with description "Delicious snacks and wraps"
    Then the POS "Snack Point" should have description "Delicious snacks and wraps"