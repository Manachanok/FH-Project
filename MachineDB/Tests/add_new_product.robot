*** Settings ***
Documentation     A test suite for adding new product.
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
Click Add New Product Button
    Click Element  xpath:/html/body/div[2]/div/div/div[1]/div/div[2]/a
Fill Data
    Wait Until Page Contains    Add new Product
    Sleep   1s
    Input Text  xpath://*[@id="add_product_name"]  ${TEST DATA}
    Input Text  xpath://*[@id="add_product_code"]  ${TEST DATA}
    Input Text  xpath://*[@id="add_product_capacity"]  0
    Input Text  xpath://*[@id="add_product_labour"]  0
    Select From List By Value   id:add_select_pline   2

*** Test Cases ***
Admin Adds New Product
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
    Click Add New Product Button
    Fill Data
    Click button    name:Addpline
    Get Text    class:alert-success