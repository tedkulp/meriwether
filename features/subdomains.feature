Feature: Subdomains

  Scenario: Invalid subomdains should 404
    Given I visit subdomain test
    When I request page /
    Then I should get a 404 error

  Scenario: Valid subomdains should work
    Given subdomain test is valid
    And I visit subdomain test
    When I request page /
    Then I should get a valid page
