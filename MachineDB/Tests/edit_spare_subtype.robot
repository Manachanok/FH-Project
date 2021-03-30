*** Settings ***
Documentation     A test suite for editing spare part subtype.
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
Select Spare Part Subtype Will Be Edited
    Wait Until Page Contains    Spare part Subtype Management
    Click Element  xpath://*[@id="myTable_paginate"]/span/a[3]
    Sleep   1s
    Click Element  xpath://*[@id="myTable"]/tbody/tr[2]/td[6]/center/a[1]
Edit Data
    Wait Until Page Contains    Setting
    Sleep   1s
    Input Text  xpath://*[@id="set_sp_name22"]  A${TEST DATA}

*** Test Cases ***
Admin Edits Spare Part Type
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
    Select Spare Part Subtype Will Be Edited
    Edit Data
    Click Button    //*[@id="setting38"]/div/div/div[2]/div[5]/button[2]
    Get Text    class:alert-success