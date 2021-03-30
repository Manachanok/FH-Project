*** Settings ***
Documentation     A test suite for adding organization & production line.
Suite Teardown    Close Browser
Resource          resource.robot

*** Keywords ***
Select Organization Management Menu
    Click Link   //*[@id="sidebar"]/div[2]/ul[2]/li[3]/a
    Sleep   1s
Then Select Organization & Production Line
    Click Link   //*[@id="organizationmenu"]/li[4]/a
Organization & Production Line Management Page Should Be Open
    Location Should Be  http://127.0.0.1:8000/organizemanage/organize-production-line
Select Organization Wants To Add Production Line
    Click Element   //*[@id="myTable"]/tbody/tr[13]/td[4]/a[1]
Add Production Line
    Wait Until Page Contains    Setting
    Sleep   1s
    Select From List By Value   id:select_line5   4

*** Test Cases ***
Admin Adds New Organization & Production Line
    Open Browser To Signin Page
    Input Username  system
    Input Password  admin
    Submit Credentials
    Then Select-Department Should Be Open
    Select Admin Department
    Click button    Sign in
    Home Page Should Be Open
    Select Organization Management Menu
    Then Select Organization & Production Line
    Organization & Production Line Management Page Should Be Open
    Select Organization Wants To Add Production Line
    Add Production Line
    Click Element    //*[@id="setting5"]/div/div/div[2]/div[4]/button[2]
    Get Text    class:alert-success