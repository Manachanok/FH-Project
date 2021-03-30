*** Settings ***
Documentation     A test suite for adding new spare part type.
Suite Teardown    Close Browser
Resource          resource.robot

*** Keywords ***
Select Spare Part Data Menu
    Click Link   //*[@id="sidebar"]/div[2]/ul[1]/li[2]/a
    Sleep   1s
Then Select Spare Part Type
    Click Link   //*[@id="spare_part_menumenu"]/li[3]/a
Spare part Type Management Page Should Be Open
    Location Should Be    http://127.0.0.1:8000/sparepartmanage/type/
Click Add Type Spare Part Button
    Click Element  xpath:/html/body/div[2]/div/div/div[1]/div/div[2]/a
Fill Data
    Wait Until Page Contains    Add New Spare Part Type
    Sleep   1s
    Select From List By Value   id:add_group   21
    Input Text  xpath://*[@id="add_sp_type_code"]  ${TEST DATA}
    Input Text  xpath://*[@id="add_sp_type_name"]  ${TEST DATA}

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
    Then Select Spare Part Type
    Spare part Type Management Page Should Be Open
    Click Add Type Spare Part Button
    Fill Data
    Click button    id:add_spare_part_type
    Get Text    class:alert-success