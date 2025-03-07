#Grupp 6 - Andreas J, Wassim, Martin.

*** Settings ***
Library    SeleniumLibrary
Variables    ${EXECDIR}/util/variables.py
Resource    ${EXECDIR}/resources/keyword_files/Keywords.robot

*** Keywords ***

I register a user with username
    [Tags]   Wassim
    [Arguments]   ${username}  ${password}
    Click Link    ${Register_link}
    Input Text    ${username_register_input_id}    ${username}
    Input Text    ${password_register_input_id}    ${password}
    Click Button    ${register_button}
     
I should see the registration success message
    [Tags]   Wassim
    [Arguments]    ${successful_message_element}    ${successful_message}
    Wait Until Element Is Visible    ${successful_message_element}
    Element Should Contain    ${successful_message_element}    ${successful_message}
    Wait Until Element Is Visible  ${login_Section}

Iam registered and logged in 
    I register a user with username  ${valid_username2}  ${valid_password2}
    I am logged in with valid credentials    ${valid_username2}    ${valid_password2}
    
I am logged in with valid credentials
    [Arguments]     ${valid_username2}    ${valid_password2}
    Click Link    ${loginlink_element}
    Wait Until Element Is Visible    ${login_Section}
    Input Text    ${username_input_id}    ${valid_username2}
    Input Text    ${password_input_id}     ${valid_password2}
    Click Button    ${login_button}
    Wait Until Element Is Visible  ${home_section}
  
I Add one Regular Tickets To Cart
    [Arguments]    ${ticket_type}    ${ticket_option}    ${ticket_quantity}
    Click Link  ${Ticketlink_element}
    Select From List By Value    ${ticket_type_selector}    ${ticket_type}
    Select From List By Value      ${ticket_category_selector}    ${ticket_option}
    Input Text    ${ticket_quantity}    1
    Click Button    ${add_to_cart_button}
    Alert Should Be Present   ${alert_cart_message}    ACCEPT

I Choose Safari Date
    I Add one Regular Tickets To Cart     ${ticket_type}    ${ticket_option}    ${ticket_quantity}
    Execute JavaScript    document.getElementById('safari-section').style.display = 'block'
    Wait Until Element Is Visible    ${safari_type_category}
    Input Text    ${safari_dates_category}    ${safari_weekday_date}
    I Select Herbivore Tour safari
    I add the tours to cart


I Select Herbivore Tour safari
    Select From List By Value   ${safari_type_category}   ${safari_type}
    
I add the tours to cart
    Click Button    ${safari_cart_button}
    Alert Should Be Present    ${alert_cart_message}

 I Can go To Checkout 
    Click Element    ${cart_nav_button}
    Click Button    ${proceed_to_checkout_button}


### Test to write new keywords for a new testcase


I Have Navigated To Buy Tickets Page While Logged In
    Register User
    Logging In
    Go To Buy Tickets Page

Register User
    Execute Javascript    document.getElementById('register-section').style.display = 'block'
    Input Text    ${username_register_input_id}    ${valid_username}
    Input Text   ${password_register_input_id}    ${valid_password}
    Click Button    ${register_button}

Logging In
    Execute JavaScript    document.getElementById('login-section').style.display = 'block'
    Input Text    ${username_input_id}    ${valid_username}
    Input Text    ${password_input_id}    ${valid_password}
    Click Button    ${login_button}
    Wait Until Element Is Visible    ${cart_visible}

Go To Buy Tickets Page
    Execute JavaScript    document.getElementById('tickets-section').style.display = 'block'

I Add A Regular Ticket And A Safari Tour To Cart
    Regular Ticket
    Herbivore Safari Tour

Regular Ticket
    Select From List By Value    id=ticket-type    ${adult_ticket_type}
    Select From List By Value    id=ticket-category    ${regular_ticket_category}
    Input Text    id=ticket-quantity    1
    Click Button    ${add_to_cart_button}
    #Alert Should Be Present    ${alert_cart_message}    ACCEPT
    Handle Alert    ACCEPT

Herbivore Safari Tour
    Go To Book Safari Page
    Input Text    ${safari_dates_category}    ${safari_weekday_date}
    Select From List By Value    ${safari_type_category}    ${safari_type}
    Click Button    ${safari_cart_button}
    #Alert Should Be Present    ${alert_cart_message}    ACCEPT
    Handle Alert    ACCEPT

Go To Book Safari Page
    Execute JavaScript    document.getElementById('safari-section').style.display = 'block'
    Wait Until Element Is Visible    ${safari_type_category}

I Want To Proceed To Checkout
    Go To Cart Page
    Click Button    ${proceed_to_checkout_button}
    Handle Alert    ACCEPT

Go To Cart Page
    Execute JavaScript    document.getElementById('cart-section').style.display = 'block'