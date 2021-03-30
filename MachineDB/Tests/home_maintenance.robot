*** Settings ***
Documentation     A test suite for testing home maintenance function.
Suite Teardown    Close Browser
Resource          resource.robot

*** Keywords ***
# Production Line Part
Select Request Maintenance Menu
    Click Link   //*[@id="sidebar"]/div[2]/ul[1]/li[2]/a
Then Select Request Maintenance
    Sleep   1s
    Click Link   //*[@id="repair_menumenu"]/li[1]/a
Request Maintenance Page Should Be Open
    Location Should Be    http://127.0.0.1:8000/repair/inform
Click แจ้งซ่อมเครื่องจักร Button
    Click Element  xpath:/html/body/div[2]/div/div/div[1]/div/div[2]/a[1]
Fill Data
    Wait Until Page Contains    ใบแจ้งซ่อมเครื่องจักร
    Sleep   1s
    Select From List By Value   id:inspect_user   product03
    Select From List By Value   id:approve_name   product03
    Select From List By Value   id:department_receive   5
    Select From List By Value   id:production_line   2
    Select From List By Value   id:machine   20
    Input Text  xpath://*[@id="create_repair_notice"]/div/div/div[2]/div[7]/textarea  ${TEST DATA}
    Input Text  xpath://*[@id="create_repair_notice"]/div/div/div[2]/div[8]/textarea  ${TEST DATA}
    Click button    id:create_repair
Then Page Should Contain New Request
    Get Text    class:alert-success
    Page Should Contain     รอการรับใบแจ้ง
Select Maintenance Request Will Be Closed 
    Click Element  xpath://*[@id="myTable"]/tbody/tr[2]/td[10]/center/a[3]
    Wait Until Page Contains    ใบแจ้งซ่อมเครื่องจักร
    Sleep   1s
    Select Radio Button     is_close    is_close
    Sleep   1s
    Click Element   xpath=//*[@id="report2"]/div/div/div[3]/button[2]
    Sleep   1s
    ${CloseMaintenanceRequestStatus}     Get Text  xpath=//*[@id="myTable"]/tbody/tr[2]/td[9]
    Log To Console      ${CloseMaintenanceRequestStatus} 
    Should Be Equal     ${CloseMaintenanceRequestStatus}     ปิดใบแจ้งซ่อม

# Engineer Part
Select Machine Maintenance Menu
    Click Link   //*[@id="sidebar"]/div[2]/ul[1]/li[4]/a
    Sleep   1s
Then Select Receive Maintenance Request
    Click Link   //*[@id="preventive_datamenu"]/li[2]/a
Receive Maintenance Request Page Should Be Open
    Location Should Be    http://127.0.0.1:8000/preventive/maintenance-receive
Select Maintenance Request Will Be Received 
    Click Element  xpath://*[@id="myTable"]/tbody/tr[5]/td[10]/center/a
Receive Maintenance Request
    Wait Until Page Contains    ใบแจ้งซ่อมเครื่องจักร
    Sleep   1s
    Select Radio Button     is_receive      is_receive
    Click Element   xpath://*[@id="setting5"]/div/div/div[3]/button[2]
    ${MaintenanceRequest}     Get Text  xpath://*[@id="myTable"]/tbody/tr[5]/td[2]
    Set Global Variable     ${MaintenanceRequest}
    ${MaintenanceRequestStatus}     Get Text  xpath://*[@id="myTable"]/tbody/tr[5]/td[9]
    Log To Console      ${MaintenanceRequest}
    Log To Console      ${MaintenanceRequestStatus}
    Should Be Equal     ${MaintenanceRequestStatus}   รอการตรวจสอบอะไหล่
Select Maintenance Request Will Be Assigned
    Click Element   xpath=//*[@id="content"]/div[4]/div/div[1]/div/div[1]/div[1]/div[2]/*[name()="svg"]
    Sleep   1s
    Wait Until Page Contains    ใบแจ้งซ่อมเครื่องจักร 1
    Click Element   xpath=//*[@id="more-part1"]/*[name()="svg"]
    Select From List By Value   id:select_sp_group1_more-part1   14
    Select From List By Value   id:select_sp_type1_more-part1   18
    Select From List By Value   id:select_sp_subtype1_more-part1   14
    Select From List By Value   id:select_sp_name1_more-part1   15
    Click Element   //*[@id="request-setting1"]/div/div/form/div[2]/h5[3]/div/div[1]/div/button/div
    Click Element   //*[@id="bs-select-1-1"]
    Sleep   1s
    Click Element   //*[@id="request-setting1"]/div/div/form/div[3]/button[2]
    Sleep   1s
Select Maintenance Job Will Be Reported 
    Reload Page
    Click Element   xpath=//*[@id="content"]/div[4]/div/div[2]/div/div[4]/div[1]/div[2]/*[name()="svg"]
    Sleep   1s
    Select From List By Value   id:mtn_result4   maintenance
    Click Element   //*[@id="job4"]/div/div/form/div[2]/div[17]/button[2]
Select Maintenance Will Be Approved
    Reload Page
    Click Element   xpath=//*[@id="content"]/div[4]/div/div[3]/div/div[5]/div[1]/div[2]/*[name()="svg"]
    Sleep   1s
    Click Element    xpath://*[@id="complete4"]/div/div/form/div[2]/div[2]/div[2]/div/label
    Click Element   xpath://*[@id="complete4"]/div/div/form/div[3]/button[2]
    Sleep   1s

*** Test Cases ***
Product03 Requests Maintenance
    Open Browser To Signin Page
    Input Username  product03
    Input Password  product03
    Submit Credentials
    Then Select-Department Should Be Open
    Select Production Line 8 Department
    Click button    Sign in
    Home Page Should Be Open
    Select Request Maintenance Menu
    Then Select Request Maintenance
    Request Maintenance Page Should Be Open
    Click แจ้งซ่อมเครื่องจักร Button
    Fill Data
    Then Page Should Contain New Request
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
    Select Maintenance Request Will Be Received
    Receive Maintenance Request Page Should Be Open
    Receive Maintenance Request
Engineer01 Handles Maintenance With Home Maintenance Function
    Click Element   xpath=/html/body/div[1]/nav/a
    Home Page Should Be Open
    Select Maintenance Request Will Be Assigned
    Select Maintenance Job Will Be Reported
    Select Maintenance Will Be Approved 
product03 Closes Maintenance Request
    Open Browser To Signin Page
    Input Username  product03
    Input Password  product03
    Submit Credentials
    Then Select-Department Should Be Open
    Select Production Line 8 Department
    Click button    Sign in
    Home Page Should Be Open
    Select Request Maintenance Menu
    Then Select Request Maintenance
    Request Maintenance Page Should Be Open
    Select Maintenance Request Will Be Closed    