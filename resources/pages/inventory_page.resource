*** Settings *** 
Library           Browser
Resource          ${EXECDIR}/resources/base.resource

*** Variables ***
${BACKPACK_ADD_BUTTON}    data-test=add-to-cart-sauce-labs-backpack
${JACKET_ADD_BUTTON}      data-test=add-to-cart-sauce-labs-fleece-jacket
${CART_BUTTON}            data-test=shopping-cart-link
${CART_ITEM}              css=[aria-label="Cart, 1 items"]

*** Keywords ***
User is on the inventory page
    Wait For Elements State    ${BACKPACK_ADD_BUTTON}    visible

User adds the backpack to the cart
    Click            ${BACKPACK_ADD_BUTTON}
    Get Atribute     ${CART_BUTTON}    aria-label
    Should Be Equal As Strings   ${CART_BUTTON}    ${CART_ITEM}
    Wait Until Keyword Succeeds   5s    200 ms Cart button should have label    Cart, 1 items

User navigates to the cart page
    Click    ${CART_BUTTON}
    Wait Untill Keyword Succeeds   5s    200 ms Get Url  contains   cart.html
    Get Url  contains   cart.html
