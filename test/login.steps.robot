*** Settings ***
# Library    SeleniumLibrary
Resource    ../resources/login_keywords.resource
# Test Setup    Open Browser    browser=chrome
Suite Setup    Open Browser    browser=chrome


*** Variables ***
# ${URL}    https://www.saucedemo.com/



*** Test Cases ***
Successful Login
    I nagigate to the login page
    I input correct credentials
    I click on the login button
    I am able view the home page

Unsuccessful Login - No credentials
    I nagigate to the login page
    I input no credentials
    I click on the login button
    I am able to see the expected error message for no credentials

Unsuccessful Login - No Username
    I nagigate to the login page
    I input only the password
    I click on the login button
    I am able to see the expected error message for no username

Unsuccessful Login - No Password
    I nagigate to the login page
    I input only the username
    I click on the login button
    I am able to see the expected error message for no password

Unsuccessful Login - Wrong Credentials
    I nagigate to the login page
    I input wrong credentials
    I click on the login button
    I am able to see the expected error message for wrong credentials
