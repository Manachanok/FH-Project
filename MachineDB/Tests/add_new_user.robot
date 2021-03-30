*** Settings ***
Documentation     A test suite for adding new user.
Suite Teardown    Close Browser
Resource          resource.robot

*** Keywords ***
Select User Management Menu
    Click Link   //*[@id="sidebar"]/div[2]/ul[2]/li[2]/a
    Sleep   1s
Then Select User
    Click Link   //*[@id="usermenu"]/li[1]/a
User Management Page Should Be Open
    Location Should Be    http://127.0.0.1:8000/usermanage/user-management
Click Add New User Button
    Click Element  xpath:/html/body/div[2]/div/div/div[1]/div/div[2]/a
Fill Data
    Wait Until Page Contains    Add New User
    Sleep   1s
    Input Text  xpath://*[@id="add_username"]  000000
    Input Text  xpath://*[@id="add_fname"]  ${TEST DATA}
    Input Text  xpath://*[@id="add_lname"]  ${TEST DATA}
    Input Text  xpath://*[@id="add_email"]   ${TEST DATA}@email.com
    Input Text  xpath://*[@id="add_password"]   ${TEST DATA}11
    Input Text  xpath://*[@id="add_cfpassword"]   ${TEST DATA}11

*** Test Cases ***
Admin Adds New User
    Open Browser To Signin Page
    Input Username  system
    Input Password  admin
    Submit Credentials
    Then Select-Department Should Be Open
    Select Admin Department
    Click button    Sign in
    Home Page Should Be Open
    Select User Management Menu
    Then Select User
    User Management Page Should Be Open
    Click Add New User Button
    Fill Data
    Click button    id=Adduser
    Get Text    class:alert-success