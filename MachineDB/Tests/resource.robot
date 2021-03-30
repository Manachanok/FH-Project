*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported Selenium2Library.
Library           Selenium2Library

*** Variables ***
${SERVER}         127.0.0.1:8000
${BROWSER}        Chrome
${DELAY}          0
${VALID USER}     system
${VALID PASSWORD}    admin
${SIGNIN URL}      http://${SERVER}/
${SELECTDEPARTMENT URL}     http://${SERVER}/sign-in/department/
${HOME URL}     http://${SERVER}/home/
${TEST DATA}    test

*** Keywords ***
Open Browser To Signin Page
    Open Browser    ${SIGNIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}

Input Username
    [Arguments]    ${username}
    Input Text    inputUser    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    inputPassword    ${password}

Submit Credentials
    Click Button    signin

Then Select-Department Should Be Open
    Location Should Be    ${SELECTDEPARTMENT URL}

# Select Department
Select Admin Department
    Select From List By Value   id:select_department   8
Select Production Line 8 Department
    Select From List By Value   id:select_department    7
Select Engineering Line 8 Department
    Select From List By Value   id:select_department    5

Home Page Should Be Open
    Location Should Be    ${HOME URL}