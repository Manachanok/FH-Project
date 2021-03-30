*** Settings ***
Documentation     A test suite for approving maintenance.
Suite Teardown    Close Browser
Resource          resource.robot

*** Keywords ***
Select Machine Maintenance Menu
    Click Link   //*[@id="sidebar"]/div[2]/ul[1]/li[4]/a
    Sleep   1s
Then Select Report Maintenance
    Click Link   //*[@id="preventive_datamenu"]/li[5]/a
Maintenance Report Page Should Be Open
    Location Should Be    http://127.0.0.1:8000/preventive/maintenance-report 
Select Maintenance Will Be Approved 
    Click Element  xpath://*[@id="myTable"]/tbody/tr[5]/td[10]/center/a[2]
Approve Maintenance
    Wait Until Page Contains    รายงานระบบซ่อมบำรุง
    Sleep   1s
    Click Element    xpath://*[@id="report5"]/div/div/div[2]/div[2]/div[2]/div/label
    Sleep   1s
    Click Element   xpath://*[@id="report5"]/div/div/div[2]/div[3]/button[2]
Then Maintenance Status Should Be Changed
    Sleep   1s
    ${MaintenanceStatus}     Get Text  xpath=//*[@id="myTable"]/tbody/tr[5]/td[9]
    Log To Console      ${MaintenanceStatus} 
    Should Be Equal     ${MaintenanceStatus}    งานเสร็จสิ้น

*** Test Cases ***
Engineer01 Approves Maintenance
    Open Browser To Signin Page
    Input Username  engineer01
    Input Password  engineer01
    Submit Credentials
    Then Select-Department Should Be Open
    Select Engineering Line 8 Department
    Click button    Sign in
    Home Page Should Be Open
    Select Machine Maintenance Menu
    Then Select Report Maintenance
    Maintenance Report Page Should Be Open
    Select Maintenance Will Be Approved 
    Approve Maintenance
    Then Maintenance Status Should Be Changed