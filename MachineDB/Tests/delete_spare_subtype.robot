*** Settings ***
Documentation     A test suite for deleting spare part subtype.
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
Select Spare Part Subtype Will Be Deleteted
    Wait Until Page Contains    Spare part Subtype Management
    Click Element  xpath://*[@id="myTable_paginate"]/span/a[3]
    Sleep   1s
    Click Element  xpath://*[@id="myTable"]/tbody/tr[2]/td[6]/center/a[2]
Confirm Deletion
    Wait Until Page Contains    Confirmation
    Sleep   1s
    Click Element   xpath://*[@id="delete39"]/div/div/div[3]/button[1]
    Get Text    class:alert-success

*** Test Cases ***
Admin Removes Spare Part Subtype
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
    Select Spare Part Subtype Will Be Deleteted
    Confirm Deletion