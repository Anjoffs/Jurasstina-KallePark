*** Settings ***
Library    SeleniumLibrary
Variables   ${EXECDIR}/util/variables.py
Resource    ${EXECDIR}/resources/keyword_files/Keywords.robot
Resource    ${EXECDIR}/resources/keyword_files/StinaPalle_keywords.robot
Test Setup    I Am On The Page    ${HTML_PATH}    ${browser}    ${title}
Test Teardown    Close Browser

*** Test Cases ***

Register User
    [Tags]   New-feature
    [Documentation]    Test to register a new user and verify success message.
    ${valid_username2}    Set Variable    Stina-Palle
    ${valid_password2}    Set Variable    Stina4251!
    When I register a user with username     ${valid_username2}    ${valid_password2}
    Then I should see the registration success message    ${successful_message_element}    ${successful_message}

Purchase Regular Tickets
    [Tags]    New-feature
    [Documentation]    Test for purchasing one regular tickets.
    Given Iam registered and logged in    
    When I Add one Regular Tickets To Cart
   
Book Herbivore Tour
    [Tags]   New-feature
    [Documentation]    Testar att logga in och boka "Herbivore Tour".
    Given Iam registered and logged in
    When I Choose Safari Date
    Then I Can go To Checkout