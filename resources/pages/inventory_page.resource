*** Settings *** 
Library           Browser
Resource          ${EXECDIR}/resources/base.resource

*** Variables ***
${BACKPACK_ADD_BUTTON}    data-test=add-to-cart-sauce-labs-backpack
${CART_BUTTON}            data-test=shopping-cart-link
${CART_ITEM}              css=[aria-label="Cart, 1 items"]
${LOGOUT_BUTTON}          id=logout_sidebar_link

*** Keywords ***
Validate Inventory Page
    Wait For Elements State    ${BACKPACK_ADD_BUTTON}    visible

Add item backpack to the cart
    Click            ${BACKPACK_ADD_BUTTON}
    Get Atribute     ${CART_BUTTON}    aria-label
    Should Be Equal As Strings   ${CART_BUTTON}    ${CART_ITEM}
    Wait Until Keyword Succeeds    5s    200 ms    Cart button should have label    Cart, 1 items

Open Cart Page
    Click    ${CART_BUTTON}
    Get Url  contains   cart.html

Open Menu
    Click    ${MENU_BUTTON}

Click Logout
    Click    ${LOGOUT_BUTTON}
    Get Url  contains  ${BASE_URL} 

Validate Cart Contains Item
    [Arguments]    ${item_name}
    Get Text    css=.cart_item .inventory_item_name    ==    ${item_name}