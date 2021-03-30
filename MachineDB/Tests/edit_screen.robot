*** Settings ***
Documentation     A test suite for editing screen.
Suite Teardown    Close Browser
Resource          resource.robot

*** Keywords ***
Select User Management Menu
    Click Link   //*[@id="sidebar"]/div[2]/ul[2]/li[2]/a
    Sleep   1s
Then Select Screen
    Click Link   //*[@id="usermenu"]/li[5]/a
Screen Management Page Should Be Open
    Location Should Be    http://127.0.0.1:8000/usermanage/screen-management
Select Screen Will Be Edited
    Click Element  xpath://*[@id="myTable"]/tbody/tr[1]/td[6]/a[1]
Edit Data
    Wait Until Page Contains    Setting
    Sleep   1s
    Input Text  xpath://*[@id="set_screenname1"]  AAAAAA

*** Test Cases ***
Admin Edits Screen
    Open Browser To Signin Page
    Input Username  system
    Input Password  admin
    Submit Credentials
    Then Select-Department Should Be Open
    Select Admin Department
    Click button    Sign in
    Home Page Should Be Open
    Select User Management Menu
    Then Select Screen
    Screen Management Page Should Be Open
    Select Screen Will Be Edited
    Edit Data
    Click Element    //*[@id="settingAAAAA"]/div/div/div[2]/div[5]/button[2]
    Get Text    class:alert-success