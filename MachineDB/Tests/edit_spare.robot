*** Settings ***
Documentation     A test suite for editing spare part.
Suite Teardown    Close Browser
Resource          resource.robot

*** Keywords ***
Select Spare Part Data Menu
    Click Link   //*[@id="sidebar"]/div[2]/ul[1]/li[2]/a
    Sleep   1s
Then Select Spare Part 
    Click Link   //*[@id="spare_part_menumenu"]/li[1]/a
Spare Part Management Page Should Be Open
    Location Should Be    http://127.0.0.1:8000/sparepartmanage/spare-part/
Select Spare Part Will Be Edited
    Click Element  xpath://*[@id="myTable"]/tbody/tr[5]/td[9]/center/a[1]
Edit Data
    Wait Until Page Contains    Setting
    Sleep   1s
    Input Text  xpath://*[@id="set_sp_name5"]  ${TEST DATA}
    Sleep   1s

*** Test Cases ***
Admin Edits Spare Part
    Open Browser To Signin Page
    Input Username  system
    Input Password  admin
    Submit Credentials
    Then Select-Department Should Be Open
    Select Admin Department
    Click button    Sign in
    Home Page Should Be Open
    Select Spare Part Data Menu
    Then Select Spare Part 
    Spare Part Management Page Should Be Open
    Select Spare Part Will Be Edited
    Edit Data
    Click Element    //*[@id="setting19"]/div/div/div[2]/div[6]/button[2]
    Get Text    class:alert-success