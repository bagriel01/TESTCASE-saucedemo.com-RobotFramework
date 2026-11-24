*** Settings ***
Library       Browser
Resource      ${EXECDIR}/resources/base.resource

*** Variables ***
${OVERVIEW_TITLE}       text=Checkout: Overview
${FINISH_BUTTON}        data-test=finish

*** Keywords ***
Order Overview Page Should Be Displayed
    Wait For Elements State    ${OVERVIEW_TITLE}    visible

Click Finish Button
    Click    ${FINISH_BUTTON}
