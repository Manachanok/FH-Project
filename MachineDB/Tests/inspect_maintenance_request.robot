*** Settings ***
Documentation     A test suite for inspecting maintenance request.
Suite Teardown    Close Browser
Resource          resource.robot

*** Keywords ***
Select Request Maintenance Menu
    Click Link   //*[@id="sidebar"]/div[2]/ul[1]/li[2]/a
    Sleep   1s
Then Select Inspect Maintenance Request
    Click Link   //*[@id="repair_menumenu"]/li[2]/a
Inspect Maintenance Request Page Should Be Open
    Location Should Be    http://127.0.0.1:8000/repair/inspect
Select Maintenance Request Will Be Inspected
    ${MaintenanceRequest}     Get Text  xpath://*[@id="myTable"]/tbody/tr/td[2]
    Set Global Variable     ${MaintenanceRequest}
    Log To Console      ${MaintenanceRequest} 
    Click Element  xpath://*[@id="myTable"]/tbody/tr/td[10]/center/a
Inspect Maintenance Request
    Wait Until Page Contains    ใบแจ้งซ่อมเครื่องจักร
    Sleep   1s
    Select Radio Button     is_inspect      is_inspect
    Click Element   xpath://*[@id="setting1"]/div/div/div[3]/button[2]
    Page Should Not Contain     ${MaintenanceRequest}

*** Test Cases ***
Product02 Inspects Maintenance Request
    Open Browser To Signin Page
    Input Username  product02
    Input Password  product02
    Submit Credentials
    Then Select-Department Should Be Open
    Select Production Line 8 Department
    Click button    Sign in
    Home Page Should Be Open
    Select Request Maintenance Menu
    Then Select Inspect Maintenance Request
    Inspect Maintenance Request Page Should Be Open
    Select Maintenance Request Will Be Inspected
    Inspect Maintenance Request
    