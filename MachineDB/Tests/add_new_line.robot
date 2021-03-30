*** Settings ***
Documentation     A test suite for adding new production line.
Suite Teardown    Close Browser
Resource          resource.robot

*** Keywords ***
Select Organization Management Menu
    Click Link   //*[@id="sidebar"]/div[2]/ul[2]/li[3]/a
    Sleep   1s
Then Select Production Line
    Click Link   //*[@id="organizationmenu"]/li[2]/a
Production Line Management Page Should Be Open
    Location Should Be    http://127.0.0.1:8000/organizemanage/production-line-management
Click Add New Line Button
    Click Element  xpath:/html/body/div[2]/div/div/div[1]/div/div[2]/a
Fill Data
    Wait Until Page Contains    Add New Production Line
    Sleep   1s
    Input Text  xpath://*[@id="add_prodline"]  0
    Select From List By Value   id:add_select_site   7
    Select From List By Value   id:add_select_building   7
    Select From List By Value   id:add_select_floor   6

*** Test Cases ***
Admin Adds New Production Line
    Open Browser To Signin Page
    Input Username  system
    Input Password  admin
    Submit Credentials
    Then Select-Department Should Be Open
    Select Admin Department
    Click button    Sign in
    Home Page Should Be Open
    Select Organization Management Menu
    Then Select Production Line
    Production Line Management Page Should Be Open
    Click Add New Line Button
    Fill Data
    Click button    name:Addprodline
    Get Text    class:alert-success