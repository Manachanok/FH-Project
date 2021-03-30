*** Settings ***
Documentation     A test suite for editing machine type.
Suite Teardown    Close Browser
Resource          resource.robot

*** Keywords ***
Select Machine Data Menu
    Click Link   //*[@id="sidebar"]/div[2]/ul[1]/li[1]/a
Then Select Machine Type
    Sleep   1s
    Click Link   //*[@id="machine_manage_menumenu"]/li[2]/a
Machine Type Management Page Should Be Open
    Location Should Be    http://127.0.0.1:8000/machinemanage/machine-type/
Select Machine Type Will Be Edited
    Click Element  xpath://*[@id="myTable"]/tbody/tr[7]/td[4]/center/a[1]
Edit Data
    Wait Until Page Contains    Setting
    Sleep   1s
    Input Text  xpath://*[@id="set_mch_type7"]  A${TEST DATA}
    
*** Test Cases ***
Admin Edits Machine Type
    Open Browser To Signin Page
    Input Username  system
    Input Password  admin
    Submit Credentials
    Then Select-Department Should Be Open
    Select Admin Department
    Click button    Sign in
    Home Page Should Be Open
    Select Machine Data Menu
    Then Select Machine Type
    Machine Type Management Page Should Be Open
    Select Machine Type Will Be Edited
    Edit Data
    Click Element    //*[@id="setting10"]/div/div/div[2]/div[3]/button[2]
    Get Text    class:alert-success