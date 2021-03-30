*** Settings ***
Documentation     A test suite for receiving maintenance request.
Suite Teardown    Close Browser
Resource          resource.robot

*** Keywords ***
Select Machine Maintenance Menu
    Click Link   //*[@id="sidebar"]/div[2]/ul[1]/li[4]/a
    Sleep   1s
Then Select Receive Maintenance Request
    Click Link   //*[@id="preventive_datamenu"]/li[2]/a
Receive Maintenance Request Page Should Be Open
    Location Should Be    http://127.0.0.1:8000/preventive/maintenance-receive
Select Maintenance Request Will Be Received 
    Click Element  xpath://*[@id="myTable"]/tbody/tr[4]/td[10]/center/a
Receive Maintenance Request
    Wait Until Page Contains    ใบแจ้งซ่อมเครื่องจักร
    Sleep   1s
    Select Radio Button     is_receive      is_receive
    Click Element   xpath://*[@id="setting4"]/div/div/div[3]/button[2]
    ${MaintenanceRequestStatus}     Get Text  xpath://*[@id="myTable"]/tbody/tr[4]/td[9]
    Log To Console      ${MaintenanceRequestStatus}
    Should Be Equal     ${MaintenanceRequestStatus}   รอการตรวจสอบอะไหล่

*** Test Cases ***
Engineer01 Receives Maintenance Request
    Open Browser To Signin Page
    Input Username  engineer01
    Input Password  engineer01
    Submit Credentials
    Then Select-Department Should Be Open
    Select Engineering Line 8 Department
    Click button    Sign in
    Home Page Should Be Open
    Select Machine Maintenance Menu
    Then Select Receive Maintenance Request
    Receive Maintenance Request Page Should Be Open
    Select Maintenance Request Will Be Received
    Receive Maintenance Request
    