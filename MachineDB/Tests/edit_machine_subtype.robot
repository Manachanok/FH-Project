*** Settings ***
Documentation     A test suite for editing machine subtype.
Suite Teardown    Close Browser
Resource          resource.robot

*** Keywords ***
Select Machine Data Menu
    Click Link   //*[@id="sidebar"]/div[2]/ul[1]/li[1]/a
Then Select Machine Subtype
    Sleep   1s
    Click Link   //*[@id="machine_manage_menumenu"]/li[3]/a
Machine Subtype Management Page Should Be Open
    Location Should Be    http://127.0.0.1:8000/machinemanage/machine-subtype/
Select Machine Subtype Will Be Edited
    Click Element  xpath://*[@id="myTable"]/tbody/tr[9]/td[5]/center/a[1]
Edit Data
    Wait Until Page Contains    Setting
    Sleep   1s
    Input Text  xpath://*[@id="set_subtype9"]  A${TEST DATA}
    
*** Test Cases ***
Admin Edits Machine Subtype
    Open Browser To Signin Page
    Input Username  system
    Input Password  admin
    Submit Credentials
    Then Select-Department Should Be Open
    Select Admin Department
    Click button    Sign in
    Home Page Should Be Open
    Select Machine Data Menu
    Then Select Machine Subtype
    Machine Subtype Management Page Should Be Open
    Select Machine Subtype Will Be Edited
    Edit Data
    Click Element    //*[@id="setting13"]/div/div/div[2]/div[4]/button[2]
    Get Text    class:alert-success