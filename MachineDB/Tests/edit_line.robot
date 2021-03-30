*** Settings ***
Documentation     A test suite for editing production line.
Suite Teardown    Close Browser
Resource          resource.robot

*** Variables ***
${NEWLINE}  999

*** Keywords ***
Select Organization Management Menu
    Click Link   //*[@id="sidebar"]/div[2]/ul[2]/li[3]/a
    Sleep   1s
Then Select Production Line
    Click Link   //*[@id="organizationmenu"]/li[2]/a
Production Line Management Page Should Be Open
    Location Should Be    http://127.0.0.1:8000/organizemanage/production-line-management
Select Production Line Will Be Edited
    Click Element  xpath://*[@id="myTable"]/tbody/tr[4]/td[6]/a[1]
Edit Data
    Wait Until Page Contains    Setting
    Sleep   1s
    Input Text  xpath://*[@id="set_production_line4"]  ${NEWLINE}
    Click Element    //*[@id="setting5"]/div/div/div[2]/div[6]/button[2]
Production Line Has Changed
    Page Should Contain     ${NEWLINE}

*** Test Cases ***
Admin Edits Production Line
    Open Browser To Signin Page
    Input Username  system
    Input Password  admin
    Submit Credentials
    Then Select-Department Should Be Open
    Select Admin Department
    Click button    Sign in
    Home Page Should Be Open
    Select Organization Management Menu
    Then Select Production Line
    Production Line Management Page Should Be Open
    Select Production Line Will Be Edited
    Edit Data
    Production Line Has Changed
    