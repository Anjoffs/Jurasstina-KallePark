#Grupp 6 - Andreas J, Wassim, Martin.

*** Settings ***
Library    SeleniumLibrary
Variables  ${EXECDIR}/util/variables.py
Resource    ${EXECDIR}/resources/keyword_files/Keywords.robot

*** Keywords ***

Open Page And Register User
    [Tags]    Martin
    I Am On The Page    ${HTML_PATH}    ${browser}    ${title}
    I Have Registered A Valid User

I Have Registered A Valid User
    [Tags]    Andreas
    Execute Javascript    document.getElementById('register-section').style.display = 'block'
    Type In Element    ${username_register_input_id}    ${valid_username}
    Type In Element    ${password_register_input_id}    ${valid_password}
    Click Button    ${register_button}

Type In Element
    [Tags]    Andreas
    [Arguments]    ${id_element}    ${text_to_write}
    Input Text    ${id_element}    ${text_to_write}

I Navigated To The Login Site
    [Tags]    Andreas
    Execute JavaScript    document.getElementById('login-section').style.display = 'block'

I Navigate To The Buy Tickets Page
    [Tags]    Martin
    Execute JavaScript    document.getElementById('tickets-section').style.display = 'block'

I Navigate To The Book Safaris Page
    [Tags]    Martin
    Execute JavaScript    document.getElementById('safari-section').style.display = 'block'
    Wait Until Element Is Visible    ${safari_type_category}

Navigate To Cart Page
    [Tags]    Martin
    Execute JavaScript    document.getElementById('cart-section').style.display = 'block'

I Enter An Invalid Username And Password
    [Tags]    Andreas
    Type In Element    ${username_input_id}    ${invalid_username}
    Type In Element    ${password_input_id}    ${invalid_passwords}

I Enter A Valid Username And Password
    [Tags]    Andreas
    Type In Element    ${username_input_id}    ${valid_username}
    Type In Element    ${password_input_id}    ${valid_password}

I Click The Login Button
    [Tags]    Andreas
    Click Button    ${login_button}

I Should See An Error Message
    [Tags]    Andreas
    Wait Until Element Is Visible    ${error_message_element}
    Wait Until Element Contains    ${error_message_element}    ${error_message}

I Should Be Logged In
    [Tags]    Andreas
    Wait Until Element Is Visible    ${cart_visible}

I Have Logged In With Valid Credentials
    [Tags]    Martin
    I Navigated To The Login Site
    I Enter A Valid Username And Password
    I Click The Login Button
    Wait Until Element Is Visible    ${cart_visible}

I Added Two Adult VIP-tickets To Cart
    [Tags]    Martin
    Select ticket type    ${adult_ticket_type}
    Select ticket category    ${vip_ticket_category}
    Select ticket quantity    ${two_ticket_quantity}
    Click Button    ${add_to_cart_button}
    Alert Should Be Present    ${alert_cart_message}    ACCEPT

I Added Two Child VIP-tickets To Cart
    [Tags]    Martin
    Select ticket type    ${child_ticket_type}
    Select ticket category    ${vip_ticket_category}
    Select ticket quantity    ${two_ticket_quantity}
    Click Button    ${add_to_cart_button}
    Alert Should Be Present    ${alert_cart_message}    ACCEPT

Select Ticket Type
    [Tags]    Martin
    [Arguments]    ${adult_ticket_type}
    Select From List By Value    ${ticket_type_selector}    ${adult_ticket_type}

Select Ticket Category
    [Tags]    Martin
    [Arguments]    ${vip_ticket_category}
    Select From List By Value    ${ticket_category_selector}    ${vip_ticket_category}

Select Ticket Quantity
    [Tags]    Martin
    [Arguments]    ${two_ticket_quantity}
    Input Text    ${ticket_quantity}    ${two_ticket_quantity}

Select Safari Weekend Date
    [Tags]    Andreas
    Input Text    ${safari_dates_category}    ${safari_weekend_date}

Select Safari Exclusive Tour
    [Tags]    Andreas
    Select From List By Value    ${safari_type_category}    ${herbivore_feeding_tour}
    Select From List By Value    ${safari_type_category}    ${rumble_thrill}

The Cart Should Be Updated
    [Tags]    Martin
    Navigate To Cart Page
    Verify Cart Quantity    ${expected_ticket_quantity}

Verify Cart Quantity
    [Tags]    Martin
    [Arguments]    ${expected_ticket_quantity}
    ${cart_text}    Get Text    ${cart_details}
    Should Contain    ${cart_text}    ${expected_ticket_quantity}

I Can Proceed To Checkout
    [Tags]    Martin
    Click Button    ${proceed_to_checkout_button}
    Handle Alert    ACCEPT

I am logged In And Have VIP-Tickets
    [Tags]    Martin
    I Have Logged In With Valid Credentials
    I Navigate To The Buy Tickets Page
    I Added Two Adult VIP-tickets To Cart
    I Added Two Child VIP-tickets To Cart

I Add The VIP Safari Tours
    [Tags]    Andreas
    Select Safari Weekend Date
    Select Safari Exclusive Tour
    Click Button    ${safari_cart_button}
    Alert Should Be Present    ${alert_cart_message}    ACCEPT