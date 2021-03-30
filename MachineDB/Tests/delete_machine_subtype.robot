*** Settings ***
Documentation     A test suite for deleting machine subtype.
Suite Teardown    Close Browser
Resource          resource.robot

*** Keywords ***
Select Machine Data Menu
    Click Link   //*[@id="sidebar"]/div[2]/ul[1]/li[1]/a
Then Select Machine Subtype
    Sleep   1s
    Click Link   //*[@id="machine_manage_menumenu"]/li[3]/a
Machine Subtype Management Page Should Be Open
    Location Should Be    http://127.0.0.1:8000/machinemanage/machine-subtype/
Select Machine Subtype Will Be Deleteted
    Click Element  xpath://*[@id="myTable"]/tbody/tr[9]/td[5]/center/a[2]
Delete Confirmation Should Be Open
    Wait Until Page Contains    Confirmation
    Sleep   2s

*** Test Cases ***
Admin Deletes Machine Subtype
    Open Browser To Signin Page
    Input Username  system
    Input Password  admin
    Submit Credentials
    Then Select-Department Should Be Open
    Select Admin Department
    Click button    Sign in
    Home Page Should Be Open
    Select Machine Data Menu
    Then Select Machine Subtype
    Machine Subtype Management Page Should Be Open
    Select Machine Subtype Will Be Deleteted
    Delete Confirmation Should Be Open
    Click Element    //*[@id="delete15"]/div/div/div[3]/button[1]