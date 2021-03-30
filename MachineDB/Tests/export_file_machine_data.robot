*** Settings ***
Documentation     A test suite for exporting machine file.
Library           OperatingSystem
Suite Teardown    Close Browser
Resource          resource.robot

*** Keywords ***
Select Machine Data Menu
    Click Link   //*[@id="sidebar"]/div[2]/ul[1]/li[1]/a
Then Select Machine 
    Click Link   //*[@id="machine_manage_menumenu"]/li[1]/a
Machine Management Page Should Be Open
    Location Should Be    http://127.0.0.1:8000/machinemanage/machine-management
Click Export to File Button
    Click Element  xpath:/html/body/div[2]/div/div[1]/div[1]/div/div[2]/a[2]
Select Data
    Wait Until Page Contains    Export File
    Sleep   2s
    Click Element   xpath://*[@id="dropdown-semantic"]/div
    Click Element   xpath://*[@id="dropdown-semantic"]/div/div[2]/div[1]
    Click Element   xpath://*[@id="dropdown-semantic"]/div/div[2]/div[2]
    Click Element   xpath://*[@id="dropdown-semantic"]/div/div[2]/div[3]
    Sleep   1s
    Click Element   xpath://*[@id="ms-machines_choices"]
    Click Element   xpath://*[@id="1574-selectable"]
    Sleep   1s
Select Docx File
    Select From List By Value   name:file_type  docx
Select Xls File
    Select From List By Value   name:file_type  excel
Docx File Should Be Downloaded
    Sleep   2s
    File Should Exist   /Users/MS/Downloads/machine_data.docx
Xls File Should Be Downloaded
    Sleep   2s
    File Should Exist   /Users/MS/Downloads/Machines.xls

*** Test Cases ***
Export Docx File
    Open Browser To Signin Page
    Input Username  system
    Input Password  admin
    Submit Credentials
    Then Select-Department Should Be Open
    Select Admin Department
    Click button    Sign in
    Home Page Should Be Open
    Select Machine Data Menu
    Then Select Machine
    Machine Management Page Should Be Open
    Click Export to File Button
    Select Data
    Select Docx File
    Click button    id:ExportButton
    Docx File Should Be Downloaded

Export Xls File
    Select Xls File
    Click button    id:ExportButton
    Xls File Should Be Downloaded