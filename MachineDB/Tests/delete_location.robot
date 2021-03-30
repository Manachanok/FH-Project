*** Settings ***
Documentation     A test suite for deleting location.
Suite Teardown    Close Browser
Resource          resource.robot

*** Keywords ***
Select Organization Management Menu
    Click Link   //*[@id="sidebar"]/div[2]/ul[2]/li[3]/a
    Sleep   1s
Then Select Location
    Click Link   //*[@id="organizationmenu"]/li[3]/a
Location Management Page Should Be Open
    Location Should Be    http://127.0.0.1:8000/organizemanage/location-management
Select Location Will Be Deleteted
    Click Element  xpath://*[@id="myTable"]/tbody/tr[3]/td[6]/a[2]
Confirm Deletion
    Wait Until Page Contains    Confirmation
    Sleep   1s
    Click Element   xpath://*[@id="delete4"]/div/div/div[3]/button[1]
    Get Text    class:alert-success

*** Test Cases ***
Admin Deletes Location
    Open Browser To Signin Page
    Input Username  system
    Input Password  admin
    Submit Credentials
    Then Select-Department Should Be Open
    Select Admin Department
    Click button    Sign in
    Home Page Should Be Open
    Select Organization Management Menu
    Then Select Location
    Location Management Page Should Be Open
    Select Location Will Be Deleteted
    Confirm Deletion