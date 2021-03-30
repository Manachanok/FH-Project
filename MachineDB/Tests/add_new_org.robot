*** Settings ***
Documentation     A test suite for adding new organization.
Suite Teardown    Close Browser
Resource          resource.robot

*** Keywords ***
Select Organization Management Menu
    Click Link   //*[@id="sidebar"]/div[2]/ul[2]/li[3]/a
Then Select Organization
    Click Link   //*[@id="organizationmenu"]/li[1]/a
Organization Management Page Should Be Open
    Location Should Be    http://127.0.0.1:8000/organizemanage/organization-management
Click Add New Organization Button
    Click Element  xpath:/html/body/div[2]/div/div/div[1]/div/div[2]/a
Fill Data
    Wait Until Page Contains    Add new organization
    Sleep   1s
    Input Text  xpath://*[@id="add_org_code"]  ${TEST DATA}
    Input Text  xpath://*[@id="add_org_name"]  ${TEST DATA}

*** Test Cases ***
Admin Adds New Organization
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
    Click Add New Organization Button
    Fill Data
    Click button    id:add_org
    Get Text    class:alert-success