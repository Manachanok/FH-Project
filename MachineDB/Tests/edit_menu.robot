*** Settings ***
Documentation     A test suite for editing menu.
Suite Teardown    Close Browser
Resource          resource.robot

*** Keywords ***
Select User Management Menu
    Click Link   //*[@id="sidebar"]/div[2]/ul[2]/li[2]/a
    Sleep   1s
Then Select Menu
    Click Link   //*[@id="usermenu"]/li[7]/a
Menu Management Page Should Be Open
    Location Should Be    http://127.0.0.1:8000/usermanage/menu-management
Select Menu Will Be Edited
    Click Element  xpath://*[@id="myTable"]/tbody/tr[7]/td[9]/a[1]
Edit Data
    Wait Until Page Contains    Setting
    Sleep   1s
    Select From List By Value       id=select_parent7      AAAAA

*** Test Cases ***
Admin Edits Menu
    Open Browser To Signin Page
    Input Username  system
    Input Password  admin
    Submit Credentials
    Then Select-Department Should Be Open
    Select Admin Department
    Click button    Sign in
    Home Page Should Be Open
    Select User Management Menu
    Then Select Menu
    Menu Management Page Should Be Open
    Select Menu Will Be Edited
    Edit Data
    Click Element    //*[@id="settingAAAAA"]/div/div/div[2]/div[5]/button[2]
    Get Text    class:alert-success