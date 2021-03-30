*** Settings ***
Documentation     A test suite for adding new department.
Suite Teardown    Close Browser
Resource          resource.robot

*** Keywords ***
Select User Management Menu
    Click Link   //*[@id="sidebar"]/div[2]/ul[2]/li[2]/a
    Sleep   1s
Then Select Department
    Click Link   //*[@id="usermenu"]/li[3]/a
Department Management Page Should Be Open
    Location Should Be    http://127.0.0.1:8000/usermanage/department-management
Click Add New Department Button
    Click Element  xpath:/html/body/div[2]/div/div/div[1]/div/div[2]/a
Fill Data
    Wait Until Page Contains    Add New Department
    Sleep   1s
    Input Text  xpath://*[@id="add_dep_code"]  000000
    Input Text  xpath://*[@id="add_dep_name"]  ${TEST DATA}

*** Test Cases ***
Admin Adds New Department
    Open Browser To Signin Page
    Input Username  system
    Input Password  admin
    Submit Credentials
    Then Select-Department Should Be Open
    Select Admin Department
    Click button    Sign in
    Home Page Should Be Open
    Select User Management Menu
    Then Select Department
    Department Management Page Should Be Open
    Click Add New Department Button
    Fill Data
    Click button    id=add_dep
    Page Should Contain     ${TEST DATA}