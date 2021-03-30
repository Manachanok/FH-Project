*** Settings ***
Documentation     A test suite for editing organization.
Suite Teardown    Close Browser
Resource          resource.robot

*** Keywords ***
Select Organization Management Menu
    Click Link   //*[@id="sidebar"]/div[2]/ul[2]/li[3]/a
Then Select Organization
    Click Link   //*[@id="organizationmenu"]/li[1]/a
Organization Management Page Should Be Open
    Location Should Be    http://127.0.0.1:8000/organizemanage/organization-management
Select Organization Will Be Edited
    Click Element  xpath://*[@id="myTable"]/tbody/tr[5]/td[5]/a[1]
Edit Data
    Wait Until Page Contains    Setting
    Sleep   1s
    Input Text  xpath://*[@id="set_org_name5"]  ${TEST DATA}

*** Test Cases ***
Admin Edits Organization
    Open Browser To Signin Page
    Input Username  system
    Input Password  admin
    Submit Credentials
    Then Select-Department Should Be Open
    Select Admin Department
    Click button    Sign in
    Home Page Should Be Open
    Select Organization Management Menu
    Then Select Organization
    Organization Management Page Should Be Open
    Select Organization Will Be Edited
    Edit Data
    Click Element    //*[@id="setting5"]/div/div/div[2]/div[4]/button[2]
    Get Text    class:alert-success