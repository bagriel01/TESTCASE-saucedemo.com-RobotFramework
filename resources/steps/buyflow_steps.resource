*** Settings ***
Resource           ${EXECDIR}/resources/pages/login_page.resource
Resource           ${EXECDIR}/resources/pages/inventory_page.resource
Resource           ${EXECDIR}/resources/pages/cart_page.resource
Resource           ${EXECDIR}/resources/pages/checkout_page.resource
Resource           ${EXECDIR}/resources/pages/overview_page.resource
Resource           ${EXECDIR}/resources/pages/complete_page.resource
Resource           ${EXECDIR}/resources/base.resource
Resource           ${EXECDIR}/resources/steps/login_steps.resource

*** Variables ***
${FIRST_NAME}    John
${LAST_NAME}     Doe
${POSTAL_CODE}   12345

*** Keywords ***
Background
    Open Application                                   ${BASE_URL}    headless=False    slow_mo=50ms
    User enters valid username and password
    User clicks on the login button
    User should be redirected to the inventory page

User is on the inventory page
    Get Url  ==  ${URL_INVENTORY}

User adds the backpack to the cart
    Click                     ${BACKPACK_ADD_BUTTON}    

User navigates to the cart page
    Click                     ${CART_BUTTON}
    Get Url  contains   cart.html

User proceeds to checkout
    Click                     ${CHECKOUT_BUTTON}

User fills in the checkout information
    Fill Buyer Information    ${FIRST_NAME}    ${LAST_NAME}    ${POSTAL_CODE}
    Click                     ${CONTINUE_BUTTON}
User sees the order overview
    Get Url     contains    checkout-step-two.html

Click on the Finish Button
    Click                    ${FINISH_BUTTON}

