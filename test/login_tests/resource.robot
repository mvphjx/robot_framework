*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported Selenium2Library.
Library           Selenium2Library

*** Variables ***
${SERVER}         192.168.129.107:7950/abisweb
${BROWSER}        Chrome
${DELAY}          1
${VALID USER}     han
${VALID PASSWORD}    4690255
${LOGIN URL}      http://${SERVER}/
${WELCOME URL}    http://${SERVER}/home/
${ERROR URL}      http://${SERVER}/home/

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be    UserLogin

Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open

Input Username
    [Arguments]    ${username}
    Input Text     UserName    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    PassWord    ${password}

Submit Credentials
    Click Element    loginbutton

Welcome Page Should Be Open
    Location Should Be    ${WELCOME URL}
    Title Should Be    门户主页
