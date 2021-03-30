*** Settings ***
Documentation     A test suite for adding new spare part subtype.
Suite Teardown    Close Browser
Resource          resource.robot

*** Keywords ***
Select Spare Part Data Menu
    Click Link   //*[@id="sidebar"]/div[2]/ul[1]/li[2]/a
    Sleep   1s
Then Select Spare Part Subtype
    Click Link   //*[@id="spare_part_menumenu"]/li[4]/a
Spare part Subtype Management Page Should Be Open
    Location Should Be    http://127.0.0.1:8000/sparepartmanage/subtype/
Click Add Subtype Spare Part Button
    Click Element  xpath:/html/body/div[2]/div/div/div[1]/div/div[2]/a
Fill Data
    Wait Until Page Contains    Add New Spare Part Subtype
    Sleep   1s
    Select From List By Value   id:add_sp_group   21
    Select From List By Value   id:add_sp_type   49
    Input Text  xpath://*[@id="add_sp_subtype_code"]  ${TEST DATA}
    Input Text  xpath://*[@id="add_sp_subtype_name"]  ${TEST DATA}

*** Test Cases ***
Admin Adds New Spare Part Type
    Open Browser To Signin Page
    Input Username  system
    Input Password  admin
    Submit Credentials
    Then Select-Department Should Be Open
    Select Admin Department
    Click button    Sign in
    Home Page Should Be Open
    Select Spare Part Data Menu
    Then Select Spare Part Subtype
    Spare part Subtype Management Page Should Be Open
    Click Add Subtype Spare Part Button
    Fill Data
    Click button    id:add_spare_part_subtype
    Get Text    class:alert-success