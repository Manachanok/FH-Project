*** Settings ***
Documentation     A test suite for adding new menu.
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
Click Add New Menu Button
    Click Element  xpath:/html/body/div[2]/div/div/div[1]/div/div[2]/a
Fill Data
    Wait Until Page Contains    Add New Menu
    Sleep   1s
    Input Text  xpath://*[@id="add_menu_id"]  AAAAA
    Input Text  xpath://*[@id="add_menu_name"]  AAAAA
    Input Text  xpath://*[@id="add_menu_level"]     0
    Input Text  xpath://*[@id="add_menu_index"]     10

*** Test Cases ***
Admin Adds New Menu
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
    Click Add New Menu Button
    Fill Data
    Click button    id=Addmenu
    Get Text    class:alert-success