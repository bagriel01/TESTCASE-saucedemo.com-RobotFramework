*** Settings ***
Library          Browser

*** Variables ***
${BASE_URL}          https://www.saucedemo.com/

*** Keywords ***
Open Application
    [Arguments]    ${url}=${BASE_URL}
    New Browser    chromium    headless=True
    New Context    viewport={"width": 1280, "height": 720}
    New Page    ${url}

Close Application
    Close Browser
