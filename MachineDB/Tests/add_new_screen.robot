*** Settings ***
Documentation     A test suite for adding new screen.
Suite Teardown    Close Browser
Resource          resource.robot

*** Keywords ***
Select User Management Menu
    Click Link   //*[@id="sidebar"]/div[2]/ul[2]/li[2]/a
    Sleep   1s
Then Select Screen
    Click Link   //*[@id="usermenu"]/li[5]/a
Screen Management Page Should Be Open
    Location Should Be    http://127.0.0.1:8000/usermanage/screen-management
Click Add New Screen Button
    Click Element  xpath:/html/body/div[2]/div/div/div[1]/div/div[2]/a
Fill Data
    Wait Until Page Contains    Add New Screen
    Sleep   1s
    Input Text  xpath://*[@id="screen_id"]  AAAAA
    Input Text  xpath://*[@id="screen_name"]  AAAAA
    Input Text  xpath://*[@id="file_py"]  ${TEST DATA}
    Input Text  xpath://*[@id="file_html"]  ${TEST DATA}

*** Test Cases ***
Admin Adds New Screen
    Open Browser To Signin Page
    Input Username  system
    Input Password  admin
    Submit Credentials
    Then Select-Department Should Be Open
    Select Admin Department
    Click button    Sign in
    Home Page Should Be Open
    Select User Management Menu
    Then Select Screen
    Screen Management Page Should Be Open
    Click Add New Screen Button
    Fill Data
    Click button    id=Addscreen
    Get Text    class:alert-success