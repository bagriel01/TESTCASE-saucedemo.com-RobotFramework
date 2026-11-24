*** Settings ***
Resource          ${EXECDIR}/resources/base.resource
Resource          ${EXECDIR}/resources/steps/login_steps.resource
Test Setup        Open Application
Test Teardown     Close Application

*** Test Cases ***

Scenario: User logs in with valid id and password
    [Tags]    smoke    login
    Given User is on the login page
    When User enters valid username and password
    And User clicks on the login button
    Then User should be redirected to the inventory page

Scenario: User logs in with invalid id and password
    [Tags]    regression    login
    Given User is on the login page
    When User enters invalid username and password
    And User clicks on the login button
    Then User should see the error message "Epic sadface: Username and password do not match any user in this service"

