*** Settings ***
Documentation     A test suite for deleting organization & production line.
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
Select Organization Wants To Remove Production Line
    Click Element   //*[@id="myTable"]/tbody/tr[13]/td[4]/a[2]
Confirm Deletion
    Wait Until Page Contains    Confirmation
    Sleep   1s
    Click Element   xpath://*[@id="delete5"]/div/div/div[3]/button[1]
    Get Text    class:alert-success

*** Test Cases ***
Admin Deletes Organization & Production Line
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
    Select Organization Wants To Remove Production Line
    Confirm Deletion
    