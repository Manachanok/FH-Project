*** Settings ***
Documentation     A test suite for adding user to department.
Suite Teardown    Close Browser
Resource          resource.robot

*** Keywords ***
Select User Management Menu
    Click Link   //*[@id="sidebar"]/div[2]/ul[2]/li[2]/a
    Sleep   1s
Then Select User & Department
    Click Link   //*[@id="usermenu"]/li[4]/a
User & Department Page Should Be Open
    Location Should Be    http://127.0.0.1:8000/usermanage/user-department
Click Add New Department Button
    Click Element  xpath:/html/body/div[2]/div/div/div[1]/div/div[2]/a
Fill Data
    Wait Until Page Contains    New Department
    Sleep   1s
    Select From List By Value       id=add_department_code      000000
    Click Element  xpath://*[@id="newDepartment"]/div/div/div/form/div[2]/div[3]/div/button
    Click Element  xpath://*[@id="bs-select-9"]/ul/li[1]
    Click Element  xpath://*[@id="newDepartment"]/div/div/div/form/div[2]/div[3]/div/button
    Click Element  xpath://*[@id="newDepartment"]/div/div/div/form/div[2]/div[4]/div/button
    Click Element  xpath://*[@id="bs-select-10"]/ul/li[1]
    Click Element  xpath://*[@id="newDepartment"]/div/div/div/form/div[2]/div[4]/div/button
    Click Button    name=addMembersDepartment

*** Test Cases ***
Admin Adds User to Department
    Open Browser To Signin Page
    Input Username  system
    Input Password  admin
    Submit Credentials
    Then Select-Department Should Be Open
    Select Admin Department
    Click button    Sign in
    Home Page Should Be Open
    Select User Management Menu
    Then Select User & Department
    User & Department Page Should Be Open
    Click Add New Department Button
    Fill Data
    Page Should Contain     000000