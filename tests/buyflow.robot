*** Settings ***
Resource        ${EXECDIR}/resources/base.resource
Resource        ${EXECDIR}/resources/steps/buyflow_steps.resource
Test Setup      Background
Test Teardown   Close Application

*** Test Cases ***

Scenario: User can successfully complete a backpack purchase
    [Tags]    smoke    regression    e2e
    Given User is on the inventory page
    When User adds the backpack to the cart
    And User navigates to the cart page
    And User proceeds to checkout
    And User fills in the checkout information
    And User sees the order overview
    And Click on the Finish Button
    Then the page should display a "Thank You for your order!" message
