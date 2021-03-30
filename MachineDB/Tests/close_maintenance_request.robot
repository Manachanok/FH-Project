*** Settings ***
Documentation     A test suite for closing maintenance.
Suite Teardown    Close Browser
Resource          resource.robot

*** Keywords ***
Select Request Maintenance Menu
    Click Link   //*[@id="sidebar"]/div[2]/ul[1]/li[2]/a
Then Select Request Maintenance
    Click Link   //*[@id="repair_menumenu"]/li/a
Request Maintenance Page Should Be Open
    Location Should Be    http://127.0.0.1:8000/repair/inform
Select Maintenance Request Will Be Closed
    Click Element  xpath://*[@id="myTable"]/tbody/tr[3]/td[10]/center/a[3]
Close Maintenance Request
    Wait Until Page Contains    ใบแจ้งซ่อมเครื่องจักร
    Sleep   1s
    Select Radio Button     is_close    is_close
    Sleep   1s
    Click Element   xpath=//*[@id="report3"]/div/div/div[3]/button[2]
Then Maintenance Request Status Should Be Changed
    Sleep   1s
    ${MaintenanceRequestStatus}     Get Text  xpath=//*[@id="myTable"]/tbody/tr[3]/td[9]
    Log To Console      ${MaintenanceRequestStatus} 
    Should Be Equal     ${MaintenanceRequestStatus}     ปิดใบแจ้งซ่อม

*** Test Cases ***
Product01 Closes Maintenance Request
    Open Browser To Signin Page
    Input Username  product01
    Input Password  product01
    Submit Credentials
    Then Select-Department Should Be Open
    Select Production Line 8 Department
    Click button    Sign in
    Home Page Should Be Open
    Select Request Maintenance Menu
    Then Select Request Maintenance
    Request Maintenance Page Should Be Open
    Select Maintenance Request Will Be Closed
    Close Maintenance Request
    Then Maintenance Request Status Should Be Changed