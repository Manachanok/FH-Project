*** Settings ***
Documentation     A test suite for removing spare part from machine.
Suite Teardown    Close Browser
Resource          resource.robot

*** Keywords ***
Select Machine Data Menu
    Click Link   //*[@id="sidebar"]/div[2]/ul[1]/li[2]/a
    Sleep   1s
Then Select Machine & Spare Part
    Click Link   ///*[@id="spare_part_menumenu"]/li[5]/a
Spare Part & Machine Management Page Should Be Open
    Location Should Be  http://127.0.0.1:8000/sparepartmanage/spare-pare-machine/
Select Machine Want To Remove Spare Part
    Click Element   //*[@id="myTable"]/tbody/tr[17]/td[7]/center/a[2]
Confirm Deletion
    Wait Until Page Contains    Confirmation
    Sleep   1s
    Click Element   xpath://*[@id="delete5"]/div/div/div[3]/button[1]

*** Test Cases ***
Admin Removes Spare Part From Machine
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
    Select Machine Need To Remove Spare Part
    Confirm Deletion