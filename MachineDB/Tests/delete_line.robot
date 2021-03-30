*** Settings ***
Documentation     A test suite for deleting production line.
Suite Teardown    Close Browser
Resource          resource.robot

*** Variables ***
${NEWLINE}  999

*** Keywords ***
Select Organization Management Menu
    Click Link   //*[@id="sidebar"]/div[2]/ul[2]/li[3]/a
    Sleep   1s
Then Select Production Line
    Click Link   //*[@id="organizationmenu"]/li[2]/a
Production Line Management Page Should Be Open
    Location Should Be    http://127.0.0.1:8000/organizemanage/production-line-management
Select Production Line Will Be Deleteted
    Click Element  xpath://*[@id="myTable"]/tbody/tr[4]/td[6]/a[2]
Confirm Deletion
    Wait Until Page Contains    Confirmation
    Sleep   1s
    Click Element   xpath://*[@id="delete5"]/div/div/div[3]/button[1]
    Get Text    class:alert-success

*** Test Cases ***
Admin Deletes Production Line
    Open Browser To Signin Page
    Input Username  system
    Input Password  admin
    Submit Credentials
    Then Select-Department Should Be Open
    Select Admin Department
    Click button    Sign in
    Home Page Should Be Open
    Select Organization Management Menu
    Then Select Production Line
    Production Line Management Page Should Be Open
    Select Production Line Will Be Deleteted
    Confirm Deletion
    