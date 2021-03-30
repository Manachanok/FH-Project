*** Settings ***
Documentation     A test suite for admin signin.
Resource          resource.robot

*** Test Cases ***
Admin Signin
    Open Browser To Signin Page
    Input Username  system
    Input Password  admin
    Submit Credentials
    Then Select-Department Should Be Open
    Select Admin Department
    Click button    Sign in
    Home Page Should Be Open