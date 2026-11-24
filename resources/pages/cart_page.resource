*** Settings ***
Library           Browser
Resource          ${EXECDIR}/resources/base.resource

*** Variables ***
${CHECKOUT_BUTTON}        data-test=checkout
${REMOVE_ITEM_BUTTON}     data-test=remove-sauce-labs-backpack

*** Keywords ***
Click Checkout
    Click    ${CHECKOUT_BUTTON}
    Get Url  contains   checkout-step-one.html
