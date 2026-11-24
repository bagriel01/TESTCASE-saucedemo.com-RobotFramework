*** Settings ***
Resource        ${EXECDIR}/resources/base.resource
Resource        ${EXECDIR}/resources/steps/buyflow_steps.resource
Test Setup      Background
Test Teardown   Close Application

*** Test Cases ***

Scenario: User can successfully complete a backpack purchase
    [Tags]    smoke    regression    e2e
    Given buyflow_steps.User is on the inventory page
    When buyflow_steps.User adds the backpack to the cart
    And buyflow_steps.User navigates to the cart page
    And buyflow_steps.User proceeds to checkout
    And buyflow_steps.User fills in the checkout information
    And buyflow_steps.User sees the order overview
    And buyflow_steps.Click on the Finish Button
    Then the page should display a "Thank You for your order!" message
