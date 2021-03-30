*** Settings ***
Documentation     A test suite for editing maintenance request.
Suite Teardown    Close Browser
Resource          resource.robot

*** Keywords ***
Select Request Maintenance Menu
    Click Link   //*[@id="sidebar"]/div[2]/ul[1]/li[2]/a
Then Select Request Maintenance
    Click Link   //*[@id="repair_menumenu"]/li/a
Request Maintenance Page Should Be Open
    Location Should Be    http://127.0.0.1:8000/repair/inform
Select Maintenance Request Will Be Edited
    Click Element  xpath://*[@id="myTable"]/tbody/tr[3]/td[10]/center/a[1]
Edit Data
    Wait Until Page Contains    ใบแจ้งซ่อมเครื่องจักร
    Sleep   1s
    Select From List By Value   id:set_inspect_user3   product02
    Select From List By Value   id:set_department_receive3   5
    Input Text  xpath://*[@id="setting3"]/div/div/div[2]/div[9]/textarea  ${TEST DATA}
    Input Text  xpath://*[@id="setting3"]/div/div/div[2]/div[10]/textarea  ${TEST DATA}
    # Sleep   1s
    Click Element    xpath=/html/body/div[2]/div/div/div[10]/div/div/div[2]/div[14]/button[2]

*** Test Cases ***
Product01 Edits Maintenance Request
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
    Select Maintenance Request Will Be Edited
    Edit Data
    