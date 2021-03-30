*** Settings ***
Documentation     A test suite with a changing new password.
Suite Teardown    Close Browser
Resource          resource.robot

*** Variables ***
${SIGNIN URL}      http://${SERVER}/
${RESETPASSWORD URL}    http://127.0.0.1:8000/resetpassword/

*** Keywords ***
Then Reset Password Page Should Be Open
    Location Should Be    ${RESETPASSWORD URL}

Input Username
    [Arguments]    ${username}
    Input Text    inputUser    ${username} 

Input Old Password
    [Arguments]    ${oldpassword}
    Input Text  id:oldPassword     ${oldpassword}

Input New Password
    [Arguments]    ${newpassword}
    Input Text  id:newPassword     ${newpassword}

Confirm New Password
    [Arguments]    ${cfpassword}
    Input Text  id:conPassword     ${cfpassword}

Then Signin Should Be Open
    Location Should Be  ${SIGNIN URL} 

*** Test Cases ***
Reset Password
    Open Browser To Signin Page
    Click Link  reset password
    Then Reset Password Page Should Be Open
    Input Username  system
    Input Old Password  admin
    Input New Password  password
    Confirm New Password    password
    Click button    Reset Password
    Then Signin Should Be Open