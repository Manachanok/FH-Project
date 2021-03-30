*** Settings ***
Documentation     A test suite for adding new machine type.
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
Click Add Machine Type Button
    Click Element  xpath:/html/body/div[2]/div/div/div[1]/div/div[2]/a
Fill Data
    Wait Until Page Contains    Add New Machine Type
    Sleep   2s
    Input Text  xpath://*[@id="add_type_code"]  ${TEST DATA}
    Input Text  xpath://*[@id="add_type"]  ${TEST DATA}

*** Test Cases ***
Admin Adds New Machine Type
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
    Click Add Machine Type Button
    Fill Data
    Click button    id:AddtypeButton
    Get Text    class:alert-success