*** Settings ***
Documentation     A test suite for maintenance inspecting.
Suite Teardown    Close Browser
Resource          resource.robot

*** Keywords ***
Select Machine Maintenance Menu
    Click Link   //*[@id="sidebar"]/div[2]/ul[1]/li[4]/a
    Sleep   1s
Then Select Inspect Maintenance
    Click Link   //*[@id="preventive_datamenu"]/li[3]/a
Inspect Maintenance Page Should Be Open
    Location Should Be    http://127.0.0.1:8000/preventive/maintenance-inspect
Select Maintenance Will Be Inspected 
    Click Element  xpath://*[@id="myTable"]/tbody/tr[4]/td[10]/center/a
Inspect Maintenance
    Wait Until Page Contains    ใบแจ้งซ่อมเครื่องจักร
    Sleep   1s
    Select From List By Value   id:select_sp_group1_4   14
    Select From List By Value   id:select_sp_type1_4    18
    Select From List By Value   id:select_sp_subtype1_4  14
    Select From List By Value   id:select_sp_name1_4   15
    # Click Element   xpath://*[@id="4"]/span
    # Select From List By Value   id:select_sp_group2_4   14
    # Select From List By Value   id:select_sp_type2_4    18
    # Select From List By Value   id:select_sp_subtype2_4  15
    # Select From List By Value   id:select_sp_name2_4   18
    Click Element   xpath://*[@id="setting4"]/div/div/form/div[3]/button[2]
Then Maintenance Status Should Be Changed
    ${MaintenanceStatus}     Get Text  xpath://*[@id="myTable"]/tbody/tr[4]/td[9]
    Log To Console      ${MaintenanceStatus} 
    Should Be Equal     ${MaintenanceStatus}    อยู่ในระหว่างการทำงาน

*** Test Cases ***
Engineer01 Inspects Maintenance
    Open Browser To Signin Page
    Input Username  engineer01
    Input Password  engineer01
    Submit Credentials
    Then Select-Department Should Be Open
    Select Engineering Line 8 Department
    Click button    Sign in
    Home Page Should Be Open
    Select Machine Maintenance Menu
    Then Select Inspect Maintenance
    Inspect Maintenance Page Should Be Open
    Select Maintenance Will Be Inspected 
    Inspect Maintenance
    Then Maintenance Status Should Be Changed