*** Settings ***
Documentation     A test suite for deleting organization.
Suite Teardown    Close Browser
Resource          resource.robot

*** Keywords ***
Select Organization Management Menu
    Click Link   //*[@id="sidebar"]/div[2]/ul[2]/li[3]/a
Then Select Organization
    Click Link   //*[@id="organizationmenu"]/li[1]/a
Organization Management Page Should Be Open
    Location Should Be    http://127.0.0.1:8000/organizemanage/organization-management
Select Organization Will Be Deleteted
    Click Element  xpath://*[@id="myTable"]/tbody/tr[5]/td[5]/a[2]
Confirm Deletion
    Wait Until Page Contains    Confirmation
    Sleep   1s
    Click Element   xpath://*[@id="delete5"]/div/div/div[3]/button[1]
    Get Text    class:alert-success

*** Test Cases ***
Admin Deletes Organization
    Open Browser To Signin Page
    Input Username  system
    Input Password  admin
    Submit Credentials
    Then Select-Department Should Be Open
    Select Admin Department
    Click button    Sign in
    Home Page Should Be Open
    Select Organization Management Menu
    Then Select Organization
    Organization Management Page Should Be Open
    Select Organization Will Be Deleteted
    Confirm Deletion