*** Settings ***
Documentation     A test suite for adding new machine & product capacity.
Suite Teardown    Close Browser
Resource          resource.robot

*** Keywords ***
Select Machine Data Menu
    Click Link   //*[@id="sidebar"]/div[2]/ul[1]/li[1]/a
    Sleep   1s
Then Select Capacity
    Click Link   //*[@id="machine_manage_menumenu"]/li[4]/a
Machine Capacity Page Should Be Open
    Location Should Be    http://127.0.0.1:8000/machinemanage/capacity/
Click Add Machine Capacity Button
    Click Element  xpath:/html/body/div[2]/div/div/div[1]/div/div[2]/a
Fill Data
    Wait Until Page Contains    Add New Machine & Product
    Sleep   1s
    Select From List By Value   id:id_line   2
    Select From List By Value   id:id_mch   52
    Select From List By Value   id:id_product   7
    Input Text  xpath://*[@id="add_rm_name"]  ${TEST DATA}
    Input Text  xpath://*[@id="add_rm_batch_size"]  100
    Input Text  xpath://*[@id="add_rm_batch_unit"]  kg
    Input Text  xpath://*[@id="add_fg_batch_size"]  10
    Input Text  xpath://*[@id="add_fg_batch_time"]  10
    Sleep   2s

*** Test Cases ***
Admin Adds New Machine Capacity
    Open Browser To Signin Page
    Input Username  system
    Input Password  admin
    Submit Credentials
    Then Select-Department Should Be Open
    Select Admin Department
    Click button    Sign in
    Home Page Should Be Open
    Select Machine Data Menu
    Then Select Capacity
    Machine Capacity Page Should Be Open
    Click Add Machine Capacity Button
    Fill Data
    Click Button    id:Add_machine_capacity