*** Settings ***
Library              Browser
Resource             ${EXECDIR}/resources/base.resource

*** Variables ***
${USERNAME}          standard_user
${USERNAME_FIELD}    label=Username
${PASSWORD}          secret_sauce
${PASSWORD_FIELD}    label=Password
${LOGIN_BUTTON}      data-test=login-button
${INVALID_USERNAME}  invalid_user
${INVALID_PASSWORD}  invalid_password
${ERROR_MESSAGE}     text=Epic sadface: Username and password do not match any user in this service
${URL_INVENTORY}     ${BASE_URL}inventory.html

*** Keywords ***

Valid Login
    [Tags]    smoke
    Open Browser To Login Page
    Fill Text    ${USERNAME_FIELD}    ${USERNAME}
    Fill Text    ${PASSWORD_FIELD}    ${PASSWORD}
    Click        ${LOGIN_BUTTON}
    Location Should Be    ${URL_INVENTORY}

Invalid Login
    [Tags]    negative
    Open Browser To Login Page
    Fill Text    ${USERNAME_FIELD}    ${INVALID_USERNAME}
    Fill Text    ${PASSWORD_FIELD}    ${INVALID_PASSWORD}
    Click        ${LOGIN_BUTTON}
    Element Should Be Visible    ${ERROR_MESSAGE}
