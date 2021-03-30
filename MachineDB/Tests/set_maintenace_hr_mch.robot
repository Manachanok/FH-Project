*** Settings ***
Documentation     A test suite for setting machine & spare part maintenance hour.
Suite Teardown    Close Browser
Resource          resource.robot

*** Variables ***
${LASTHR}          999

*** Keywords ***
Select Machine Data Menu
    Click Link   //*[@id="sidebar"]/div[2]/ul[1]/li[1]/a
    Sleep   1s
Then Select Machine & Spare Part
    Click Link   //*[@id="machine_manage_menumenu"]/li[5]/a
Machine & Spare Part Page Should Be Open
    Location Should Be  http://127.0.0.1:8000/machinemanage/machine-spare-part/
Click Setting Machine&Sparepart Button
    Click Element  xpath:/html/body/div[2]/div/div/div[1]/div/div[2]/a
Fill Data
    Wait Until Page Contains    Setting
    Sleep   1s
    Select From List By Value   id:select_machine   52
    Select From List By Value   id:select_spare_part   15
    Input Text  xpath://*[@id="next_mtn_change"]    ${LASTHR}
    Click Element    //*[@id="setting"]/div/div/div[3]/button[2]
Check Data At Machine Maintenance Data Page
    Click Element   xpath:/html/body/div[1]/nav/a
    Location Should Be  http://127.0.0.1:8000/home/
    Click Link   //*[@id="sidebar"]/div[2]/ul[1]/li[4]/a
    Sleep   1s
    Click Link  //*[@id="preventive_datamenu"]/li[1]/a
    Wait Until Page Contains    Machine Maintenance Data
    ${RESULT}   Get Text    //*[@id="myTable"]/tbody/tr[1]/td[6]
    Should Be Equal     ${RESULT}     ${LASTHR}   

*** Test Cases ***
Admin Sets Machine & Spare Part Maintenance Hour
    Open Browser To Signin Page
    Input Username  system
    Input Password  admin
    Submit Credentials
    Then Select-Department Should Be Open
    Select Admin Department
    Click button    Sign in
    Home Page Should Be Open
    Select Machine Data Menu
    Then Select Machine & Spare Part
    Machine & Spare Part Page Should Be Open
    Click Setting Machine&Sparepart Button
    Fill Data
    Check Data At Machine Maintenance Data Page
    