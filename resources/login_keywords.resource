*** Settings ***
Library    SeleniumLibrary
Variables    ../variables/variables.py  


*** Keywords ***
I nagigate to the login page
    [Arguments]    ${URL}
    Go To    ${URL}

I input correct credentials
    Wait Until Element Is Visible    id=user-name 
    Input Text    id=user-name    ${LOGIN_DATA["correctData"]["username"]}
    Input Text    id=password    ${LOGIN_DATA["correctData"]["password"]}

I input wrong credentials
    Wait Until Element Is Visible    id=user-name
    Input Text    id=user-name    ${LOGIN_DATA["wrongData"]["wrongData"]}
    Input Text    id=password    ${LOGIN_DATA["wrongData"]["password"]}

I click on the login button
    Click Button    id=login-button

I am able view the home page
    ${location}    Get Location
    Should Be Equal    ${location}    https://www.saucedemo.com/inventory.html

I am able to see the expected error message for no credentials
    Wait Until Element Contains    css=[data-test="error"]    ${ERROR_MESSAGES["errorCredentials"]}

I am able to see the expected error message for no username
    Wait Until Element Contains    css=[data-test="error"]    ${ERROR_MESSAGEs["errorUsername"]}

I am able to see the expected error message for no password
    Wait Until Element Contains    css=[data-test="error"]    ${ERROR_MESSAGES["errorPassword"]}

I am able to see the expected error message for wrong credentials
    Wait Until Element Contains    css=[data-test="error"]    ${ERROR_MESSAGES["wrongCredentials"]}


I input only the username
    Wait Until Element Is Visible    id=user-name 
    Input Text    id=user-name    ${LOGIN_DATA["correctData"]["username"]}

I input only the password
    Wait Until Element Is Visible    id=user-name 
    Input Text    id=password    ${LOGIN_DATA["correctData"]["password"]}

I input no credentials
    Wait Until Element Is Visible    id=user-name