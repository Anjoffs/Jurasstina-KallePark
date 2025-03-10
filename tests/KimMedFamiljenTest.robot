#Grupp 6 - Andreas J, Wassim, Martin.

*** Settings ***
Documentation    Testing the JuraStinaKallePark Page for the scenario Kim med familjen.
Library    SeleniumLibrary
Variables   ${EXECDIR}/util/variables.py
Resource    ${EXECDIR}/resources/keyword_files/Keywords.robot
Resource    ${EXECDIR}/resources/keyword_files/KimMedFamiljen_keywords.robot
Test Setup    Open Page And Register User
Test Teardown    Close Browser

*** Test Cases ***

Invalid Login
    [Tags]   Andreas
    [Documentation]    Testing an invalid login
    Given I Navigated To The Login Site
    When I Enter An Invalid Username And Password
    And I Click The Login Button
    Then I Should See An Error Message

Valid Login
    [Tags]    Andreas
    [Documentation]    Testing a valid login
    Given I Navigated To The Login Site
    When I Enter A Valid Username And Password
    And I Click The Login Button
    Then I Should Be Logged In

Purchase Adult VIP-Tickets
    [Tags]    Martin
    [Documentation]    Testing that you can buy two adult vip-tickets
    Given I Have Logged In With Valid Credentials
    And I Navigate To The Buy Tickets Page
    When I Added Two Adult VIP-tickets To Cart
    Then The Cart Should Be Updated
    And I Can Proceed To Checkout

Purchase Child VIP-Tickets
    [Tags]    Martin
    [Documentation]    Testing that you can buy two child vip-tickets
    Given I Have Logged In With Valid Credentials
    And I Navigate To The Buy Tickets Page
    When I Added Two Child VIP-tickets To Cart
    Then The Cart Should Be Updated
    And I Can Proceed To Checkout

Purchase Safari With Close Encounter On Weekend
    [Tags]    Martin / Andreas
    [Documentation]    Testing that you can buy safari with close encounter on weekend
    Given I am logged In And Have VIP-Tickets
    And I Navigate To The Book Safaris Page
    When I Add The VIP Safari Tours
    Then The Cart Should Be Updated
    And I Can Proceed To Checkout