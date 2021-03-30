*** Settings ***
Documentation     A test suite for deleting machine data.
Suite Teardown    Close Browser
Resource          resource.robot

*** Keywords ***
Select Machine Data Menu
    Click Link   //*[@id="sidebar"]/div[2]/ul[1]/li[1]/a
Then Select Machine 
    Click Link   //*[@id="machine_manage_menumenu"]/li[1]/a
Machine Management Page Should Be Open
    Location Should Be    http://127.0.0.1:8000/machinemanage/machine-management
Select Machine Data Will Be Deleteted
    Click Element  xpath://*[@id="myTable"]/tbody/tr[1]/td[9]/center/a[2]
Delete Confirmation Should Be Open
    Wait Until Page Contains    Confirmation
    Sleep   2s


*** Test Cases ***
Admin Deletes Machine Data
    Open Browser To Signin Page
    Input Username  system
    Input Password  admin
    Submit Credentials
    Then Select-Department Should Be Open
    Select Admin Department
    Click button    Sign in
    Home Page Should Be Open
    Select Machine Data Menu
    Then Select Machine
    Machine Management Page Should Be Open
    Select Machine Data Will Be Deleteted
    Delete Confirmation Should Be Open
    Click button    name:deletemachine
    Get Text    class:alert-success