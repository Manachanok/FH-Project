*** Settings ***
Library    Selenium2Library

*** Variables ***
${BROWSER}      Chrome
${GOOGLE URL}   http://www.google.com
${keywords_search}    Hello World
${expected_result}    Hello World

*** Keywords ***
go google
    Open Browser    ${GOOGLE URL}    ${BROWSER}
search Hello World
    Input Text    name=q    ${keywords_search}
    Submit Form
result
    Wait Until Page Contains    ${expected_result}

*** Test Cases ***
Search
    go google
    search Hello World
    result
Test Teardown    Close Browser