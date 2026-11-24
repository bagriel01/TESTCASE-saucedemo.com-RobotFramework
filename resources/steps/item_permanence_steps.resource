*** Settings ***
Resource            ${EXECDIR}/resources/base.resource
Resource            ${EXECDIR}/resources/steps/login_steps.resource
Resource            ${EXECDIR}/resources/pages/inventory_page.resource
Resource            ${EXECDIR}/resources/steps/login_steps.resource

*** Variables ***
${MENU_BUTTON}      id=react-burger-menu-btn
${LOGOUT_LINK}      id=logout_sidebar_link

*** Keywords ***
Background
    Open Application                                   ${BASE_URL}    headless=False    slow_mo=50ms
    User enters valid username and password
    User clicks on the login button
    User should be redirected to the inventory page

User is on the inventory page
    Get Url  ==  ${URL_INVENTORY}

User adds the backpack to the cart
    Click    ${BACKPACK_ADD_BUTTON}

User logs out of the page and logs in again
        Open Menu
        Click Logout
        User is on the login page
        User enters valid username and password
        User clicks on the login button

The backpack should still be present in the cart
    Open Cart Page
    Validate Cart Contains Item    Sauce Labs Backpack