*** Settings ***
Documentation     A test suite for editing department's member.
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
Select Department Will Be Edited
    Click Element  xpath://*[@id="myTable"]/tbody/tr[1]/td[5]/a
Add Member
    Wait Until Page Contains    Edit Department's member
    Sleep   1s
    Click Element   //*[@id="editDepartment000000"]/div/div/div[2]/div[1]/div/button
    Sleep   1s
    Click Element  xpath://*[@id="add-more-members"]/div/div[1]/div/button
    Click Element  xpath://*[@id="bs-select-1"]/ul/li[1]
    Click Element  xpath://*[@id="add-more-members"]/div/div[1]/div/button
    Click Element  xpath://*[@id="add-more-members"]/div/div[2]/div/button
    Click Element  xpath://*[@id="bs-select-2"]/ul/li[3]
    Click Element  xpath://*[@id="add-more-members"]/div/div[2]/div/button
    Click Element  xpath://*[@id="editDepartment000000"]/div/div/div[3]/button[2]
Remove Member
    Wait Until Page Contains    Edit Department's member
    Sleep   1s
    Click Element  xpath=//*[@id="editDepartment000000"]/div/div/div[2]/div[3]/div[1]
    Click Element  xpath://*[@id="delete-member1"]
    Click Element  xpath://*[@id="editDepartment000000"]/div/div/div[3]/button[2]

*** Test Cases ***
Admin Adds Department's Member
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
    Select Department Will Be Edited
    Add Member
Admin Removes Department's Member
    Select Department Will Be Edited
    Remove Member