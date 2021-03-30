*** Settings ***
Documentation     A test suite for adding new role & screen.
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
Click Add New RoleScreen Button
    Click Element  xpath:/html/body/div[2]/div/div/div[1]/div/div[2]/a
Fill Data
    Wait Until Page Contains    Add New RoleScreen
    Sleep   1s
    Select From List By Value       id=add_rs_role      admin
    Select From List By Value       id=add_rs_screen      AAAAA
    Click Element  xpath://*[@id="createrolescreen"]/div/div/div[2]/div[3]/div[2]/div[2]/div/label
    Click Element  xpath://*[@id="createrolescreen"]/div/div/div[2]/div[3]/div[3]/div[2]/div/label
    Click Element  xpath://*[@id="createrolescreen"]/div/div/div[2]/div[3]/div[4]/div[2]/div/label

*** Test Cases ***
Admin Adds New Role & Screen
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
    Click Add New RoleScreen Button
    Fill Data
    Click button    name=Addrolescreen
    Get Text    class:alert-success