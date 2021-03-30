*** Settings ***
Documentation     A test suite for deleting machine type.
Suite Teardown    Close Browser
Resource          resource.robot

*** Keywords ***
Select Machine Data Menu
    Click Link   //*[@id="sidebar"]/div[2]/ul[1]/li[1]/a
Then Select Machine Type
    Sleep   1s
    Click Link   //*[@id="machine_manage_menumenu"]/li[2]/a
Machine Type Management Page Should Be Open
    Location Should Be    http://127.0.0.1:8000/machinemanage/machine-type/
Select Machine Type Will Be Deleteted
    Click Element  xpath://*[@id="myTable"]/tbody/tr[7]/td[4]/center/a[2]
Delete Confirmation Should Be Open
    Wait Until Page Contains    Confirmation
    Sleep   2s

*** Test Cases ***
Admin Deletes Machine Type
    Open Browser To Signin Page
    Input Username  system
    Input Password  admin
    Submit Credentials
    Then Select-Department Should Be Open
    Select Admin Department
    Click button    Sign in
    Home Page Should Be Open
    Select Machine Data Menu
    Then Select Machine Type
    Machine Type Management Page Should Be Open
    Select Machine Type Will Be Deleteted
    Delete Confirmation Should Be Open
    Click Element    //*[@id="delete10"]/div/div/div[3]/button[1]
    Get Text    class:alert-success