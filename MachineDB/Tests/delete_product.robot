*** Settings ***
Documentation     A test suite for deleting product.
Suite Teardown    Close Browser
Resource          resource.robot

*** Keywords ***
Select Organization Management Menu
    Click Link   //*[@id="sidebar"]/div[2]/ul[2]/li[3]/a
    Sleep   1s
Then Select Product
    Click Link   //*[@id="organizationmenu"]/li[5]/a
Product Management Page Should Be Open
    Location Should Be    http://127.0.0.1:8000/organizemanage/product-management
Select Product Will Be Deleted
    Click Element  xpath://*[@id="myTable"]/tbody/tr[2]/td[7]/a[2]
Confirm Deletion
    Wait Until Page Contains    Confirmation
    Sleep   1s
    Click Element   xpath://*[@id="delete8"]/div/div/div[3]/button[1]
    Get Text    class:alert-success

*** Test Cases ***
Admin Deletes Product
    Open Browser To Signin Page
    Input Username  system
    Input Password  admin
    Submit Credentials
    Then Select-Department Should Be Open
    Select Admin Department
    Click button    Sign in
    Home Page Should Be Open
    Select Organization Management Menu
    Then Select Product
    Product Management Page Should Be Open
    Select Product Will Be Deleted
    Confirm Deletion