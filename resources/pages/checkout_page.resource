*** Settings ***
Library           Browser
Resource          ${EXECDIR}/resources/base.resource

*** Variables ***
${FIRST_NAME_FIELD}    data-test=firstName
${LAST_NAME_FIELD}     data-test=lastName
${POSTAL_CODE_FIELD}   data-test=postalCode
${CONTINUE_BUTTON}     data-test=continue

*** Keywords ***
Fill Buyer Information
    [Arguments]    ${first_name}    ${last_name}    ${postal_code}
    Fill Text    ${FIRST_NAME_FIELD}     ${first_name}
    Fill Text    ${LAST_NAME_FIELD}      ${last_name}
    Fill Text    ${POSTAL_CODE_FIELD}    ${postal_code}