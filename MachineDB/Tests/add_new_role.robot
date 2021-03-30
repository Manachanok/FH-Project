*** Settings ***
Documentation     A test suite for adding new role.
Suite Teardown    Close Browser
Resource          resource.robot

*** Keywords ***
Select User Management Menu
    Click Link   //*[@id="sidebar"]/div[2]/ul[2]/li[2]/a
    Sleep   1s
Then Select Role
    Click Link   //*[@id="usermenu"]/li[2]/a
Role Management Page Should Be Open
    Location Should Be    http://127.0.0.1:8000/usermanage/role-management
Click Add New Role Button
    Click Element  xpath:/html/body/div[2]/div/div/div[1]/div/div[2]/a
Fill Data
    Wait Until Page Contains    Add New Role
    Sleep   1s
    Input Text  xpath://*[@id="add_roleid"]  AAA
    Input Text  xpath://*[@id="add_rolename"]  ${TEST DATA}

*** Test Cases ***
Admin Adds New Role
    Open Browser To Signin Page
    Input Username  system
    Input Password  admin
    Submit Credentials
    Then Select-Department Should Be Open
    Select Admin Department
    Click button    Sign in
    Home Page Should Be Open
    Select User Management Menu
    Then Select Role
    Role Management Page Should Be Open
    Click Add New Role Button
    Fill Data
    Click button    id=Addrole
    Get Text    class:alert-success