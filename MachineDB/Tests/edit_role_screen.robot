*** Settings ***
Documentation     A test suite for editing role & screen.
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
Select Role & Screen Will Be Edited
    Click Element  xpath://*[@id="myTable_paginate"]/span/a[4]
    Click Element  xpath://*[@id="myTable"]/tbody/tr[9]/td[7]/a[1]
Edit Data
    Wait Until Page Contains    Add New RoleScreen
    Sleep   1s
    Click Element  xpath://*[@id="setting133"]/div/div/div[2]/div[3]/div[2]/div[2]/div/label

*** Test Cases ***
Admin Edits Role & Screen
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
    Select Role & Screen Will Be Edited
    Edit Data
    Click Element    //*[@id="setting133"]/div/div/div[2]/div[4]/button[2]
    Get Text    class:alert-success