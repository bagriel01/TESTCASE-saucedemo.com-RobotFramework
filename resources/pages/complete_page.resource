*** Settings ***
Library           Browser
Resource          ${EXECDIR}/resources/base.resource

*** Variables ***
${COMPLETE_HEADER}    text=Thank you for your order!

*** Keywords ***
the page should display a "Thank You for your order!" message
    Wait For Elements State    ${COMPLETE_HEADER}    visible
    