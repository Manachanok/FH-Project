*** Settings ***
Documentation     A test suite for deleting spare part type.
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
Select Spare Part Type Will Be Deleteted
    Wait Until Page Contains    Spare part Type Management
    Click Element  xpath://*[@id="myTable_paginate"]/span/a[3]
    Sleep   1s
    Click Element  xpath://*[@id="myTable"]/tbody/tr[8]/td[5]/a[2]
Confirm Deletion
    Wait Until Page Contains    Confirmation
    Sleep   1s
    Click Element   xpath://*[@id="delete50"]/div/div/div[3]/button[1]
    Get Text    class:alert-success

*** Test Cases ***
Admin Deletes Spare Part Type
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
    Select Spare Part Type Will Be Deleteted
    Confirm Deletion