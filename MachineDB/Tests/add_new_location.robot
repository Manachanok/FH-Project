*** Settings ***
Documentation     A test suite for adding new location.
Suite Teardown    Close Browser
Resource          resource.robot

*** Keywords ***
Select Organization Management Menu
    Click Link   //*[@id="sidebar"]/div[2]/ul[2]/li[3]/a
    Sleep   1s
Then Select Location
    Click Link   //*[@id="organizationmenu"]/li[3]/a
Location Management Page Should Be Open
    Location Should Be    http://127.0.0.1:8000/organizemanage/location-management
Click Add New Location Button
    Click Element  xpath:/html/body/div[2]/div/div/div[1]/div/div[2]/a
Fill Data
    Wait Until Page Contains    Add New Location
    Sleep   1s
    Input Text  xpath://*[@id="add_site"]  ${TEST DATA}
    Input Text  xpath://*[@id="add_building"]  ${TEST DATA}
    Input Text  xpath://*[@id="add_floor"]  ${TEST DATA}

*** Test Cases ***
Admin Adds New Location
    Open Browser To Signin Page
    Input Username  system
    Input Password  admin
    Submit Credentials
    Then Select-Department Should Be Open
    Select Admin Department
    Click button    Sign in
    Home Page Should Be Open
    Select Organization Management Menu
    Then Select Location
    Location Management Page Should Be Open
    Click Add New Location Button
    Fill Data
    Click button    name:add_location
    Get Text    class:alert-success