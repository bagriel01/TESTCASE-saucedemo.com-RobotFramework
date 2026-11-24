*** Settings ***
Resource    ${EXECDIR}/resources/pages/login_page.resource

*** Keywords ***
User is on the login page
    Wait For Elements State    ${USERNAME_FIELD}    visible

User enters valid username and password
    Fill Text    ${USERNAME_FIELD}    ${USERNAME}
    Fill Text    ${PASSWORD_FIELD}    ${PASSWORD}

User enters invalid username and password
    Fill Text    ${USERNAME_FIELD}    ${INVALID_USERNAME}
    Fill Text    ${PASSWORD_FIELD}    ${INVALID_PASSWORD}

User clicks on the login button
    Click        ${LOGIN_BUTTON}

User should be redirected to the inventory page
    Get Url  ==  ${URL_INVENTORY}

User should see the error message "${text}"
    Wait For Elements State      ${ERROR_MESSAGE}  visible
    Get Text   ${ERROR_MESSAGE}  contains          ${text}