*** Settings ***
Library       Browser
Resource      ${EXECDIR}/resources/base.resource

*** Variables ***
${OVERVIEW_TITLE}       text=Checkout: Overview
${FINISH_BUTTON}       data-test=finish

*** Keywords ***
User sees the order overview
    Wait For Elements State    ${OVERVIEW_TITLE}    visible

User clicks on the finish button
    Click    ${FINISH_BUTTON}
