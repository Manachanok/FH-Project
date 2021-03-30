*** Settings ***
Documentation     A test suite for deleting role & screen.
Suite Teardown    Close Browser
Resource          resource.robot

*** Keywords ***
Select User Management Menu
    Click Link   //*[@id="sidebar"]/div[2]/ul[2]/li[2]/a
    Sleep   1s
Then Select Role & Screen
    Click Link   //*[@id="usermenu"]/li[6]/a
Role & Screen Management Page Should Be Open
    Location Should Be    http://127.0.0.1:8000/usermanage/role-screen-management
Select Role & Screen Will Be Deleteted
    Click Element  xpath://*[@id="myTable_paginate"]/span/a[4]
    Click Element  xpath://*[@id="myTable"]/tbody/tr[9]/td[7]/a[2]
Confirm Deletion
    Wait Until Page Contains    Confirmation
    Sleep   1s
    Click Element   xpath://*[@id="delete133"]/div/div/div[3]/button[1]
    Get Text    class=alert-success

*** Test Cases ***
Admin Deletes Role & Screen
    Open Browser To Signin Page
    Input Username  system
    Input Password  admin
    Submit Credentials
    Then Select-Department Should Be Open
    Select Admin Department
    Click button    Sign in
    Home Page Should Be Open
    Select User Management Menu
    Then Select Role & Screen
    Role & Screen Management Page Should Be Open
    Select Role & Screen Will Be Deleteted
    Confirm Deletion