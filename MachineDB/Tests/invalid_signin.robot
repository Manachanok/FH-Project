*** Settings ***
Documentation     A test suite containing tests related to invalid signin.
Suite Setup       Open Browser To Signin Page
Suite Teardown    Close Browser
Test Template     Signin With Invalid Credentials Should Fail
Resource          resource.robot

*** Test Cases ***               USER NAME        PASSWORD
Invalid Username                 invalid          ${VALID PASSWORD}
Invalid Password                 ${VALID USER}    invalid
Invalid Username And Password    invalid          whatever
Empty Username                   ${EMPTY}         ${VALID PASSWORD}
Empty Password                   ${VALID USER}    ${EMPTY}
Empty Username And Password      ${EMPTY}         ${EMPTY}

*** Keywords ***
Signin With Invalid Credentials Should Fail
    [Arguments]    ${username}    ${password}
    Input Username    ${username}
    Input Password    ${password}
    Submit Credentials
    Signin Should Have Failed

Signin Should Have Failed
    Location Should Be    ${SIGNIN URL} 
    Get Text    class:alert
