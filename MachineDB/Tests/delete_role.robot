*** Settings ***
Documentation     A test suite for deleting role.
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
Select Role Will Be Deleteted
    Click Element  xpath://*[@id="myTable"]/tbody/tr[1]/td[4]/a[2]
Confirm Deletion
    Wait Until Page Contains    Confirmation
    Sleep   1s
    Click Element   xpath://*[@id="deleteAAA"]/div/div/div[3]/button[1]
    Get Text    class=alert-success

*** Test Cases ***
Admin Deletes Role
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
    Select Role Will Be Deleteted
    Confirm Deletion