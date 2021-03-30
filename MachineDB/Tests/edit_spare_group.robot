*** Settings ***
Documentation     A test suite for editing spare part group.
Suite Teardown    Close Browser
Resource          resource.robot

*** Keywords ***
Select Spare Part Data Menu
    Click Link   //*[@id="sidebar"]/div[2]/ul[1]/li[2]/a
    Sleep   1s
Then Select Spare Part Group
    Click Link   //*[@id="spare_part_menumenu"]/li[2]/a
Spare part Group Management Page Should Be Open
    Location Should Be    http://127.0.0.1:8000/sparepartmanage/group/
Select Spare Part Group Will Be Edited
    Click Element  xpath://*[@id="myTable"]/tbody/tr[6]/td[4]/center/a[1]
Edit Data
    Wait Until Page Contains    Setting
    Sleep   1s
    Input Text  xpath://*[@id="set_sp_group_name6"]  A${TEST DATA}

*** Test Cases ***
Admin Edits Spare Part Group
    Open Browser To Signin Page
    Input Username  system
    Input Password  admin
    Submit Credentials
    Then Select-Department Should Be Open
    Select Admin Department
    Click button    Sign in
    Home Page Should Be Open
    Select Spare Part Data Menu
    Then Select Spare Part Group
    Spare part Group Management Page Should Be Open
    Select Spare Part Group Will Be Edited
    Edit Data
    Click Element    //*[@id="setting21"]/div/div/div[2]/div[3]/button[2]
    Get Text    class:alert-success