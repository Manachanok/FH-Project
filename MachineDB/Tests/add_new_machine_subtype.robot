*** Settings ***
Documentation     A test suite for adding new machine subtype.
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
Click Add Machine Subtype Button
    Click Element  xpath:/html/body/div[2]/div/div/div[1]/div/div[2]/a
Fill Data
    Wait Until Page Contains    Add New Machine Subtype
    Sleep   2s
    Select From List By Value   id:add_type   1
    Input Text  xpath://*[@id="add_subtype_code"]  ${TEST DATA}
    Input Text  xpath://*[@id="add_subtype"]  ${TEST DATA}

*** Test Cases ***
Admin Adds New Machine Subtype
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
    Click Add Machine Subtype Button
    Fill Data
    Click button    id:AddSubtypeButton
    Get Text    class:alert-success