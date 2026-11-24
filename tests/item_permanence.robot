*** Settings ***
Resource    ${EXECDIR}/resources/base.resource
Resource    ${EXECDIR}/resources/steps/item_permanence_steps.resource
Test Setup  Background
Test Teardown   Close Application

*** Test Cases ***

Scenario: User can add an item to the cart and it remains there after logging out and back
    [Tags]    smoke    regression    e2e
    Given User is on the inventory page
    And User adds the backpack to the cart
    When User logs out of the page and logs in again
    Then The backpack should still be present in the cart