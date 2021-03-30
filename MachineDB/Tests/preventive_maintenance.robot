*** Settings ***
Documentation     A test suite for handling preventive maintenance.
Suite Teardown    Close Browser
Resource          resource.robot

*** Variables ***
${ASSIGNEE}     engineer01

*** Keywords ***
First Step : Assign Job To Assignee
    Click Link   //*[@id="sidebar"]/div[2]/ul[1]/li[4]/a
    Sleep   1s
    Click Link   //*[@id="preventive_datamenu"]/li[4]/a
    Location Should Be    http://127.0.0.1:8000/preventive/maintenance-assign
    # Select Maintenance Will Be Inspected 
    Select Checkbox     id=assign1
    # Then Fill Assignee Username And Submit
    Input Text  xpath:/html/body/div[2]/div/div[1]/form/div[2]/div[2]/div/div[3]/input  ${ASSIGNEE}
    Sleep   1s
    Click Element   xpath:/html/body/div[2]/div/div[1]/form/div[2]/div[2]/div/div[4]/button
    # Assignee Username Should Be Shown In Table
    ${RESULT}   Get Text    //*[@id="myTable"]/tbody/tr[1]/td[8]
    Log To Console      ${RESULT}
    Should Be Equal     ${RESULT}       ${ASSIGNEE}
Second Step : Assignee Does Job Then Reports It
    # Select Report Maintenance
    Click Link   //*[@id="navbarCollapse"]/div/a[5]
    # Maintenance Report Page Should Be Open
    Location Should Be    http://127.0.0.1:8000/preventive/maintenance-report
    # Select Maintenance Job Will Be Reported 
    Click Element  xpath://*[@id="myTable"]/tbody/tr[1]/td[10]/center/a[1]
    Wait Until Page Contains    Maintenance Report
    Sleep   1s
    Select From List By Value   id:mtn_result1      maintenance
    Input Text      //*[@id="chang_life_hour_sp1"]      300
    Input Text      //*[@id="check_life_hour_sp1"]      300
    Click Element   xpath://*[@id="job1"]/div/div/div[2]/div[14]/button[2]
    # Then Maintenance Status Should Be Changed
    ${MaintenanceStatus}     Get Text  xpath=//*[@id="myTable"]/tbody/tr[1]/td[9]
    Log To Console      ${MaintenanceStatus} 
    Should Be Equal     ${MaintenanceStatus}    รอการอนุมัติงาน
Third Step : Assignor Approves Job
    # Select Maintenance Job Will Be Approved
    Click Link  //*[@id="myTable"]/tbody/tr[1]/td[10]/center/a[2]
    Wait Until Page Contains    รายงานระบบซ่อมบำรุง
    Sleep   1s
    Click Element    xpath://*[@id="report1"]/div/div/div[2]/div[2]/div[2]/div/label
    Sleep   1s
    Click Element   xpath://*[@id="report1"]/div/div/div[2]/div[3]/button[2]
    # Then Maintenance Status Should Be Changed
    Sleep   2s
    ${MaintenanceStatus}     Get Text  xpath=//*[@id="myTable"]/tbody/tr[1]/td[9]
    Log To Console      ${MaintenanceStatus} 
    Should Be Equal     ${MaintenanceStatus}    งานเสร็จสิ้น
    
*** Test Cases ***
Engineer01 Handles Preventive Maintenance
    Open Browser To Signin Page
    Input Username  engineer01
    Input Password  engineer01
    Submit Credentials
    Then Select-Department Should Be Open
    Select Engineering Line 8 Department
    Click button    Sign in
    Home Page Should Be Open
    First Step : Assign Job To Assignee
    Second Step : Assignee Does Job Then Reports It
    Third Step : Assignor Approves Job
