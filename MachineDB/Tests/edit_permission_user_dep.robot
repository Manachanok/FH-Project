*** Settings ***
Documentation     A test suite for editing permission of department's member.
Suite Teardown    Close Browser
Resource          resource.robot

*** Keywords ***
Select User Management Menu
    Click Link   //*[@id="sidebar"]/div[2]/ul[2]/li[2]/a
    Sleep   1s
Then Select User & Department
    Click Link   //*[@id="usermenu"]/li[4]/a
User & Department Page Should Be Open
    Location Should Be    http://127.0.0.1:8000/usermanage/user-department
Select Member Tab
    Click Element  xpath://*[@id="members-tab"]
Select Member's Permission Will Be Edited
    Sleep   1s
    Click Element  xpath://*[@id="myTable1"]/tbody/tr[1]/td[7]/a
Edit Permission
    Sleep   1s
    Click Element   //*[@id="edit000000"]/div/div/form/div[2]/div/table/tbody/tr[1]/td[5]/center/label
    Click Element   //*[@id="edit000000"]/div/div/form/div[2]/div/table/tbody/tr[1]/td[6]/center/label
    Click Element   //*[@id="edit000000"]/div/div/form/div[2]/div/table/tbody/tr[1]/td[7]/center/label
    Click Element   //*[@id="edit000000"]/div/div/form/div[2]/div/table/tbody/tr[1]/td[8]/center/label
    Sleep   1s
    Click Element   //*[@id="edit000000"]/div/div/form/div[3]/button[2]

*** Test Cases ***
Admin Edits Permission In Department
    Open Browser To Signin Page
    Input Username  system
    Input Password  admin
    Submit Credentials
    Then Select-Department Should Be Open
    Select Admin Department
    Click button    Sign in
    Home Page Should Be Open
    Select User Management Menu
    Then Select User & Department
    User & Department Page Should Be Open
    Select Member Tab
    Select Member's Permission Will Be Edited
    Edit Permission