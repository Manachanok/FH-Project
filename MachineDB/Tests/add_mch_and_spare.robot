*** Settings ***
Documentation     A test suite for adding machine & spare part.
Suite Teardown    Close Browser
Resource          resource.robot

*** Keywords ***
Select Machine Data Menu
    Click Link   //*[@id="sidebar"]/div[2]/ul[1]/li[1]/a
    Sleep   1s
Then Select Machine & Spare Part
    Click Link   //*[@id="machine_manage_menumenu"]/li[5]/a
Machine & Spare Part Page Should Be Open
    Location Should Be  http://127.0.0.1:8000/machinemanage/machine-spare-part/
Select Machine That Adds Spare Part
    Click Element   //*[@id="myTable"]/tbody/tr[1]/td[5]/center/a[1]
Add Spare Part
    Wait Until Page Contains    Add Spare Part
    Sleep   1s
    Select From List By Value   id:select_sp_group1   14
    Select From List By Value   id:select_sp_type1   18
    Select From List By Value   id:select_sp_subtype1   14
    Select From List By Value   id:select_sp_name1   15

*** Test Cases ***
Admin Adds New Machine & Spare part
    Open Browser To Signin Page
    Input Username  system
    Input Password  admin
    Submit Credentials
    Then Select-Department Should Be Open
    Select Admin Department
    Click button    Sign in
    Home Page Should Be Open
    Select Machine Data Menu
    Then Select Machine & Spare Part
    Machine & Spare Part Page Should Be Open
    Select Machine That Adds Spare Part
    Add Spare Part
    Click Button    name:add_mch_and_sp