*** Settings ***
Library          Browser

*** Variables ***
${BASE_URL}          https://www.saucedemo.com/

*** Keywords ***
Open Application
    [Arguments]    ${url}=${BASE_URL}    ${headless}=True    ${slow_mo}=0ms
    New Browser    chromium    headless=${headless}    slowMo=${slow_mo}
    New Context    viewport={"width": 1280, "height": 720}
    New Page    ${url}

Close Application
    Close Browser
