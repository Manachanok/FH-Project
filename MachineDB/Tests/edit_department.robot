*** Settings ***
Documentation     A test suite for editing department.
Suite Teardown    Close Browser
Resource          resource.robot

*** Variables ***
${NEWDEP}  ZZZZ

*** Keywords ***
Select User Management Menu
    Click Link   //*[@id="sidebar"]/div[2]/ul[2]/li[2]/a
    Sleep   1s
Then Select Department
    Click Link   //*[@id="usermenu"]/li[3]/a
Department Management Page Should Be Open
    Location Should Be    http://127.0.0.1:8000/usermanage/department-management
Select Department Will Be Edited
    Click Element  xpath://*[@id="myTable"]/tbody/tr[1]/td[4]/a[1]
Edit Data
    Wait Until Page Contains    Setting
    Sleep   1s
    Input Text  xpath://*[@id="set_dep_name"]  ${NEWDEP}
    Click Element    //*[@id="setting10"]/div/div/div[2]/div[3]/button[2]
Department Has Changed
    Page Should Contain     ${NEWDEP}

*** Test Cases ***
Admin Edits Department
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
    Select Department Will Be Edited
    Edit Data
    Department Has Changed