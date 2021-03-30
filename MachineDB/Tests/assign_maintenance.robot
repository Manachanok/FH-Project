*** Settings ***
Documentation     A test suite for maintenance assignment.
Suite Teardown    Close Browser
Resource          resource.robot

*** Variables ***
${ASSIGNEE}     engineer02

*** Keywords ***
Select Machine Maintenance Menu
    Click Link   //*[@id="sidebar"]/div[2]/ul[1]/li[4]/a
    Sleep   1s
Then Select Assign Maintenance
    Click Link   //*[@id="preventive_datamenu"]/li[4]/a
Assign Maintenance Page Should Be Open
    Location Should Be    http://127.0.0.1:8000/preventive/maintenance-assign
Select Maintenance Will Be Inspected 
    Select Checkbox     id=assign6
Then Fill Assignee Username And Submit
    Input Text  xpath:/html/body/div[2]/div/div[1]/form/div[2]/div[2]/div/div[3]/input  ${ASSIGNEE}
    Sleep   1s
    Click Element   xpath:/html/body/div[2]/div/div[1]/form/div[2]/div[2]/div/div[4]/button
Assignee Username Should Be Shown In Table
    ${RESULT}   Get Text    //*[@id="myTable"]/tbody/tr[6]/td[8]
    Log To Console      ${RESULT}
    Should Be Equal     ${RESULT}       ${ASSIGNEE}
    
*** Test Cases ***
Engineer01 Assigns Maintenance To Engineer02
    Open Browser To Signin Page
    Input Username  engineer01
    Input Password  engineer01
    Submit Credentials
    Then Select-Department Should Be Open
    Select Engineering Line 8 Department
    Click button    Sign in
    Home Page Should Be Open
    Select Machine Maintenance Menu
    Then Select Assign Maintenance
    Assign Maintenance Page Should Be Open
    Select Maintenance Will Be Inspected 
    Then Fill Assignee Username And Submit
    Assignee Username Should Be Shown In Table