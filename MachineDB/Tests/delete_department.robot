*** Settings ***
Documentation     A test suite for deleting department.
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
Select Department Will Be Deleteted
    Click Element  xpath://*[@id="myTable"]/tbody/tr[1]/td[4]/a[2]
Confirm Deletion
    Wait Until Page Contains    Confirmation
    Sleep   1s
    Click Element   xpath://*[@id="delete9"]/div/div/div[3]/button[1]
    Page Should Not Contain     ${TEST DATA}

*** Test Cases ***
Admin Deletes Department
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
    Select Department Will Be Deleteted
    Confirm Deletion