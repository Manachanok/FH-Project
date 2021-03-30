*** Settings ***
Documentation     A test suite for editing user.
Suite Teardown    Close Browser
Resource          resource.robot

*** Keywords ***
Select User Management Menu
    Click Link   //*[@id="sidebar"]/div[2]/ul[2]/li[2]/a
    Sleep   1s
Then Select User
    Click Link   //*[@id="usermenu"]/li[1]/a
User Management Page Should Be Open
    Location Should Be    http://127.0.0.1:8000/usermanage/user-management
Select User Will Be Edited
    Click Element  xpath://*[@id="myTable"]/tbody/tr[1]/td[9]/a[1]
Edit Data
    Wait Until Page Contains    Setting
    Sleep   1s
    Select From List By Value   id=select_role1     user

*** Test Cases ***
Admin Edits User
    Open Browser To Signin Page
    Input Username  system
    Input Password  admin
    Submit Credentials
    Then Select-Department Should Be Open
    Select Admin Department
    Click button    Sign in
    Home Page Should Be Open
    Select User Management Menu
    Then Select User
    User Management Page Should Be Open
    Select User Will Be Edited
    Edit Data
    Click Element    //*[@id="setting000000"]/div/div/div[2]/div[5]/button[2]
    Get Text    class:alert-success