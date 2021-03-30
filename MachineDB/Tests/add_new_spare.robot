*** Settings ***
Documentation     A test suite for adding new spare part.
Suite Teardown    Close Browser
Resource          resource.robot

*** Keywords ***
Select Spare Part Data Menu
    Click Link   //*[@id="sidebar"]/div[2]/ul[1]/li[2]/a
Then Select Spare Part 
    Click Link   //*[@id="spare_part_menumenu"]/li[1]/a
Spare Part Management Page Should Be Open
    Location Should Be    http://127.0.0.1:8000/sparepartmanage/spare-part/
Click Add Spare Part Button
    Click Element  xpath:/html/body/div[2]/div/div/div[1]/div/div[2]/a
Fill Data
    Wait Until Page Contains    Add New Spare Part
    Sleep   1s
    Select From List By Value   id:id_sp_group   14
    Select From List By Value   id:id_sp_type   18
    Select From List By Value   id:id_sp_subtype   14
    Input Text  xpath://*[@id="add_sp_name"]  ${TEST DATA}
    Input Text  xpath://*[@id="add_sp_brand"]  ${TEST DATA}
    Input Text  xpath://*[@id="add_sp_model"]  ${TEST DATA}

*** Test Cases ***
Admin Adds New Spare Part
    Open Browser To Signin Page
    Input Username  system
    Input Password  admin
    Submit Credentials
    Then Select-Department Should Be Open
    Select Admin Department
    Click button    Sign in
    Home Page Should Be Open
    Select Spare Part Data Menu
    Then Select Spare Part 
    Spare Part Management Page Should Be Open
    Click Add Spare Part Button
    Fill Data
    Click button    id:add_spare_part
    Get Text    class:alert-success