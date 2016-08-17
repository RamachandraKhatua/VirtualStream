*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported Selenium2Library.
Library           Selenium2Library

*** Variables ***
${SERVER}         10.110.46.171
${BROWSER}        Firefox
${DELAY}          0
${VALID USER}     1a@xsportal.local
${VALID PASSWORD}    Emsee123!
${LOGIN URL}      https://${SERVER}/login
${WELCOME URL}    https://10.110.46.171/
${ERROR URL}      https://${SERVER}/login

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be    Login

Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open

Input Username
    [Arguments]    ${username}
    Input Text    username     ${username}

Input Password
    [Arguments]    ${password}
    Input Text   password    ${password}

Submit Credentials
    Click Button    button_login

Welcome Page Should Be Open
    Set Selenium Speed    10
    Location Should Be    ${WELCOME URL}
    Title Should Be    Dashboard
