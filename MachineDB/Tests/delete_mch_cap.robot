*** Settings ***
Documentation     A test suite for deleting machine&product capacity.
Suite Teardown    Close Browser
Resource          resource.robot


*** Keywords ***
Select Machine Data Menu
    Click Link   //*[@id="sidebar"]/div[2]/ul[1]/li[1]/a
    Sleep   1s
Then Select Capacity
    Click Link   //*[@id="machine_manage_menumenu"]/li[4]/a
Machine Capacity Page Should Be Open
    Location Should Be    http://127.0.0.1:8000/machinemanage/capacity/
Select Machine Capacity Will Be Deleteted
    Wait Until Page Contains Element    //*[@id="myTable_next"]
    Click Element  xpath://*[@id="myTable_next"]
    Sleep   1s
    Click Element  xpath://*[@id="myTable"]/tbody/tr[3]/td[8]/center/a[2]
Confirm Deletion
    Wait Until Page Contains    Confirmation
    Sleep   1s
    Click Element   xpath://*[@id="delete21"]/div/div/div[3]/button[1]

*** Test Cases ***
Admin Removes Machine Capacity
    Open Browser To Signin Page
    Input Username  system
    Input Password  admin
    Submit Credentials
    Then Select-Department Should Be Open
    Select Admin Department
    Click button    Sign in
    Home Page Should Be Open
    Select Machine Data Menu
    Then Select Capacity
    Machine Capacity Page Should Be Open
    Select Machine Capacity Will Be Deleteted
    Confirm Deletion