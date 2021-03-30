*** Settings ***
Documentation     A test suite for adding new machine.
Suite Teardown    Close Browser
Resource          resource.robot

*** Keywords ***
Select Machine Data Menu
    Click Link   //*[@id="sidebar"]/div[2]/ul[1]/li[1]/a
Then Select Machine 
    Click Link   //*[@id="machine_manage_menumenu"]/li[1]/a
Machine Management Page Should Be Open
    Location Should Be    http://127.0.0.1:8000/machinemanage/machine-management
Click Add Machine Button
    Click Element  xpath:/html/body/div[2]/div/div[1]/div[1]/div/div[2]/a[1]
Fill Data
    Wait Until Page Contains    Add New Machine
    Sleep   2s
    Input Text  xpath://*[@id="add_machine_brand"]  ${TEST DATA}
    Input Text  xpath://*[@id="add_machine_model"]  ${TEST DATA}
    Input Text  xpath://*[@id="add_serial"]  ${TEST DATA}
    Select From List By Value   id:id_line   2
    Select From List By Value   id:id_mch_type   1
    Select From List By Value   id:id_sub_type   1
    Input Text  xpath://*[@id="add_machine_name"]  ${TEST DATA}
    Input Text  xpath://*[@id="add_mpc"]  A${TEST DATA}
    Input Text  xpath://*[@id="add_machine_asset_code"]  ${TEST DATA}
    Input Text  xpath://*[@id="add_cpm"]  100
    Input Text  xpath://*[@id="add_capacity"]  kg
    Input Text  xpath://*[@id="add_power"]  100
    Input Text  xpath://*[@id="add_hour"]  0
    Input Text  xpath://*[@id="add_supplier_code"]  ${TEST DATA}
    Input Text  xpath://*[@id="add_supplier_name"]  ${TEST DATA}
    Input Text  xpath://*[@id="add_supplier_contact"]  ${TEST DATA}
    Input Text  xpath://*[@id="add_eng_emp_id"]  ${TEST DATA}
    Input Text  xpath://*[@id="add_eng_emp_name"]  ${TEST DATA}
    Input Text  xpath://*[@id="add_eng_emp_contact"]  ${TEST DATA}
    Input Text  xpath://*[@id="add_pro_emp_id"]  ${TEST DATA}
    Input Text  xpath://*[@id="add_pro_emp_name"]  ${TEST DATA}
    Input Text  xpath://*[@id="add_pro_emp_contact"]  ${TEST DATA}

*** Test Cases ***
Admin Adds New Machine
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
    Click Add Machine Button
    Fill Data
    Click button    id:AddmachineButton
    Get Text    class:alert-success