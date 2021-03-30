*** Settings ***
Documentation     A test suite for adding spare part & machine.
Suite Teardown    Close Browser
Resource          resource.robot

*** Keywords ***
Select Spare Part Data Menu
    Click Link   //*[@id="sidebar"]/div[2]/ul[1]/li[2]/a
    Sleep   1s
Then Select Spare Part & Machine
    Click Link   //*[@id="spare_part_menumenu"]/li[5]/a
Spare Part & Machine Management Page Should Be Open
    Location Should Be    http://127.0.0.1:8000/sparepartmanage/spare-pare-machine/
Select Spare Part That Adds Machine
    Click Element  xpath://*[@id="myTable"]/tbody/tr[17]/td[7]/center/a[1]
Add Machine
    Wait Until Page Contains    Setting
    Sleep   1s
    Select From List By Value   id:select_line5   2
    Select From List By Value   id:select_mch_type5   1
    Select From List By Value   id:select_mch_subtype5   1
    Select From List By Value   id:select_mch5   52
    Sleep   1s

*** Test Cases ***
Admin Adds New Spare Part & Machine
    Open Browser To Signin Page
    Input Username  system
    Input Password  admin
    Submit Credentials
    Then Select-Department Should Be Open
    Select Admin Department
    Click button    Sign in
    Home Page Should Be Open
    Select Spare Part Data Menu
    Then Select Spare Part & Machine 
    Spare Part & Machine Management Page Should Be Open
    Select Spare Part That Adds Machine
    Add Machine
    Click button    id:add_sp_and_mch5
    Get Text    class:alert-success