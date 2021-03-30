*** Settings ***
Documentation     A test suite for approving maintenance request.
Suite Teardown    Close Browser
Resource          resource.robot

*** Keywords ***
Select Request Maintenance Menu
    Click Link   //*[@id="sidebar"]/div[2]/ul[1]/li[2]/a
    Sleep   1s
Then Select Approve Maintenance Request
    Click Link   //*[@id="repair_menumenu"]/li[3]/a
Approve Maintenance Request Page Should Be Open
    Location Should Be    http://127.0.0.1:8000/repair/approve
Select Maintenance Request Will Be Approved
    ${MaintenanceRequest}     Get Text  xpath://*[@id="myTable"]/tbody/tr/td[2]
    Set Global Variable     ${MaintenanceRequest}
    Log To Console      ${MaintenanceRequest} 
    Click Element  xpath://*[@id="myTable"]/tbody/tr/td[10]/center/a
Approve Maintenance Request
    Wait Until Page Contains    ใบแจ้งซ่อมเครื่องจักร
    Sleep   1s
    Select Radio Button     is_approve      is_approve
    Click Element   xpath://*[@id="setting1"]/div/div/div[3]/button[2]
    Page Should Not Contain     ${MaintenanceRequest}
    Sleep   1s

*** Test Cases ***
Product03 Approves Maintenance Request
    Open Browser To Signin Page
    Input Username  product03
    Input Password  product03
    Submit Credentials
    Then Select-Department Should Be Open
    Select Production Line 8 Department
    Click button    Sign in
    Home Page Should Be Open
    Select Request Maintenance Menu
    Then Select Approve Maintenance Request
    Approve Maintenance Request Page Should Be Open
    Select Maintenance Request Will Be Approved
    Approve Maintenance Request
    