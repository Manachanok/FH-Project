*** Settings ***
Documentation     A test suite with a single test for valid signin.
Suite Teardown    Close Browser
Resource          resource.robot

*** Test Cases ***
Signin
    Open Browser To Signin Page
    Input Username  system
    Input Password  admin
    Submit Credentials
    Then Select-Department Should Be Open