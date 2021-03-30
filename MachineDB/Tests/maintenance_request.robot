*** Settings ***
Documentation     A test suite for requesting maintenance.
Suite Teardown    Close Browser
Resource          resource.robot

*** Keywords ***
Select Request Maintenance Menu
    Click Link   //*[@id="sidebar"]/div[2]/ul[1]/li[2]/a
Then Select Request Maintenance
    Click Link   //*[@id="repair_menumenu"]/li/a
Request Maintenance Page Should Be Open
    Location Should Be    http://127.0.0.1:8000/repair/inform
Click แจ้งซ่อมเครื่องจักร Button
    Click Element  xpath:/html/body/div[2]/div/div/div[1]/div/div[2]/a[1]
Fill Data
    Wait Until Page Contains    ใบแจ้งซ่อมเครื่องจักร
    Sleep   1s
    Select From List By Value   id:inspect_user   product02
    Select From List By Value   id:approve_name   product03
    Select From List By Value   id:department_receive   5
    Select From List By Value   id:production_line   2
    Select From List By Value   id:machine   17
    Input Text  xpath://*[@id="create_repair_notice"]/div/div/div[2]/div[7]/textarea  ${TEST DATA}
    Input Text  xpath://*[@id="create_repair_notice"]/div/div/div[2]/div[8]/textarea  ${TEST DATA}

*** Test Cases ***
Product01 Requests Maintenance
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
    Click แจ้งซ่อมเครื่องจักร Button
    Fill Data
    Click button    id:create_repair
    Get Text    class:alert-success