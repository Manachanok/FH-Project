*** Settings ***
Documentation     A test suite for deleting maintenance request.
Suite Teardown    Close Browser
Resource          resource.robot

*** Keywords ***
Select Request Maintenance Menu
    Click Link   //*[@id="sidebar"]/div[2]/ul[1]/li[2]/a
Then Select Request Maintenance
    Click Link   //*[@id="repair_menumenu"]/li/a
Request Maintenance Page Should Be Open
    Location Should Be    http://127.0.0.1:8000/repair/inform
Select Maintenance Request Will Be Deleteted
    Click Element  xpath://*[@id="myTable"]/tbody/tr[3]/td[10]/center/a[2]
Confirm Deletion
    Wait Until Page Contains    Confirmation
    Sleep   1s
    Click Element   xpath://*[@id="delete4"]/div/div/div[3]/button[1]

*** Test Cases ***
Product01 Deletes Maintenance Request
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
    Select Maintenance Request Will Be Deleteted
    Confirm Deletion
    