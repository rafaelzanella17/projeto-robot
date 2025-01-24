*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/login_keywords.resource
Test Setup    Open Browser    browser=chrome    

*** Variables ***
${URL}    https://www.saucedemo.com/
${BROWSER}    chrome
${USERNAME}    standard_user
${PASSWORD}    secret_sauce


*** Test Cases ***
Successful Login
    I nagigate to the login page    ${URL}
    I input correct credentials    ${USERNAME}    ${PASSWORD}
    I click on the login button
    I am able view the home page

Unsuccessful Login - No credentials
    I nagigate to the login page    ${URL}
    I input no credentials
    I click on the login button
    I am able to see the expected error message    Epic sadface: Username is required

Unsuccessful Login - No Username
    I nagigate to the login page    ${URL}
    I input only the password    ${PASSWORD}
    I click on the login button
    I am able to see the expected error message    Epic sadface: Username is required

Unsuccessful Login - No Password
    I nagigate to the login page    ${URL}
    I input only the username    ${USERNAME}
    I click on the login button
    I am able to see the expected error message    Epic sadface: Password is required

Unsuccessful Login - Wrong Credentials
    I nagigate to the login page    ${URL}
    I input wrong credentials    Usuario    Senha
    I click on the login button
    I am able to see the expected error message    Epic sadface: Username and password do not match any user in this service
