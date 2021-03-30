*** Settings ***
Documentation     A test suite for adding new spare part group.
Suite Teardown    Close Browser
Resource          resource.robot

*** Keywords ***
Select Spare Part Data Menu
    Click Link   //*[@id="sidebar"]/div[2]/ul[1]/li[2]/a
    Sleep   1s
Then Select Spare Part Group
    Click Link   //*[@id="spare_part_menumenu"]/li[2]/a
Spare part Group Management Page Should Be Open
    Location Should Be    http://127.0.0.1:8000/sparepartmanage/group/
Click Add Group Spare Part Button
    Click Element  xpath:/html/body/div[2]/div/div/div[1]/div/div[2]/a
Fill Data
    Wait Until Page Contains    Add New Spare Part Group
    Sleep   1s
    Input Text  xpath://*[@id="add_sp_group_code"]  ${TEST DATA}
    Input Text  xpath://*[@id="add_sp_group_name"]  ${TEST DATA}

*** Test Cases ***
Admin Adds New Spare Part Group
    Open Browser To Signin Page
    Input Username  system
    Input Password  admin
    Submit Credentials
    Then Select-Department Should Be Open
    Select Admin Department
    Click button    Sign in
    Home Page Should Be Open
    Select Spare Part Data Menu
    Then Select Spare Part Group
    Spare part Group Management Page Should Be Open
    Click Add Group Spare Part Button
    Fill Data
    Click button    id:add_spare_part_group
    Get Text    class:alert-success