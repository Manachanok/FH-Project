*** Settings ***
Documentation     A test suite for maintenance reporting.
Suite Teardown    Close Browser
Resource          resource.robot

*** Keywords ***
Select Machine Maintenance Menu
    Click Link   //*[@id="sidebar"]/div[2]/ul[1]/li[4]/a
    Sleep   1s
Then Select Report Maintenance
    Click Link   //*[@id="preventive_datamenu"]/li[3]/a
Maintenance Report Page Should Be Open
    Location Should Be    http://127.0.0.1:8000/preventive/maintenance-report
Select Maintenance Job Will Be Reported 
    Click Element  xpath://*[@id="myTable"]/tbody/tr[4]/td[10]/center/a[1]
Report Maintenance
    Wait Until Page Contains    Maintenance Report
    Sleep   1s
    Select From List By Value   id:mtn_result4      maintenance
    Click Element   xpath://*[@id="job4"]/div/div/div[2]/div[17]/button[2]
Then Maintenance Status Should Be Changed
    ${MaintenanceStatus}     Get Text  xpath://*[@id="myTable"]/tbody/tr[4]/td[9]
    Log To Console      ${MaintenanceStatus} 
    Should Be Equal     ${MaintenanceStatus}    รอการอนุมัติงาน

*** Test Cases ***
Engineer02 Reports Maintenance
    Open Browser To Signin Page
    Input Username  engineer02
    Input Password  engineer02
    Submit Credentials
    Then Select-Department Should Be Open
    Select Engineering Line 8 Department
    Click button    Sign in
    Home Page Should Be Open
    Select Machine Maintenance Menu
    Then Select Report Maintenance
    Maintenance Report Page Should Be Open
    Select Maintenance Job Will Be Reported 
    Report Maintenance
    Then Maintenance Status Should Be Changed
    