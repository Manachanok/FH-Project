*** Settings ***
Documentation     A test suite for deleting spare part.
Suite Teardown    Close Browser
Resource          resource.robot

*** Keywords ***
Select Spare Part Data Menu
    Click Link   //*[@id="sidebar"]/div[2]/ul[1]/li[2]/a
    Sleep   1s
Then Select Spare Part 
    Click Link   //*[@id="spare_part_menumenu"]/li[1]/a
Spare Part Management Page Should Be Open
    Location Should Be    http://127.0.0.1:8000/sparepartmanage/spare-part/
Select Spare Part Will Be Deleteted
    Click Element  xpath://*[@id="myTable"]/tbody/tr[5]/td[9]/center/a[2]
Confirm Deletion
    Wait Until Page Contains    Confirmation
    Sleep   1s
    Click Element   xpath://*[@id="delete19"]/div/div/div[3]/button[1]
    Get Text    class:alert-success

*** Test Cases ***
Admin Removes Spare Part
    Open Browser To Signin Page
    Input Username  system
    Input Password  admin
    Submit Credentials
    Then Select-Department Should Be Open
    Select Admin Department
    Click button    Sign in
    Home Page Should Be Open
    Select Spare Part Data Menu
    Then Select Spare Part 
    Spare Part Management Page Should Be Open
    Select Spare Part Will Be Deleteted
    Confirm Deletion