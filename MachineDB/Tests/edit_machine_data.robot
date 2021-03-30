*** Settings ***
Documentation     A test suite for editing machine data.
Suite Teardown    Close Browser
Resource          resource.robot

*** Keywords ***
Select Machine Data Menu
    Click Link   //*[@id="sidebar"]/div[2]/ul[1]/li[1]/a
Then Select Machine 
    Click Link   //*[@id="machine_manage_menumenu"]/li[1]/a
Machine Management Page Should Be Open
    Location Should Be    http://127.0.0.1:8000/machinemanage/machine-management
Select Machine Data Will Be Edited
    Click Element  xpath://*[@id="myTable"]/tbody/tr[1]/td[9]/center/a[1]
Edit Data
    Wait Until Page Contains    Setting
    Sleep   2s
    Input Text  xpath://*[@id="set_mch_name1"]  A${TEST DATA}
    Input Text  xpath://*[@id="set_cpm1"]  101

*** Test Cases ***
Admin Edits Machine Data
    Open Browser To Signin Page
    Input Username  system
    Input Password  admin
    Submit Credentials
    Then Select-Department Should Be Open
    Select Admin Department
    Click button    Sign in
    Home Page Should Be Open
    Select Machine Data Menu
    Then Select Machine
    Machine Management Page Should Be Open
    Select Machine Data Will Be Edited
    Edit Data
    Click button    name:EditMch
    Get Text    class:alert-success