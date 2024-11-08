*** Settings ***
Library           SeleniumLibrary
Library           OperatingSystem
Library           RequestsLibrary
Library           Collections
Library           BuiltIn
Library           XML

*** Variables ***
${url}            https://automationteststore.com/
${browser}        chrome
${input_name}     id=loginFrm_loginname
${input_pwd}      id=loginFrm_password
${btn_login}      xpath://button[@title="Login"]
${address-id}     id=address_1_a_2212722127
${check_address_path}    //table[@class="table confirm_shippment_options"]//a[@class="btn btn-default btn-xs"]
${new-first-name}    User2
${new-last-name}    Test2
${postal-code}    2246
${comment}        This is my comment!
${edit_comment}    Goi dien truoc khi giao hang nha
${special_characters}    !@.dda$$%
${UNIT_PRICE_XPATH}    //table[@class="table table-striped table-bordered"]//td[@class="align_right"]
${QUANTITY_XPATH}    //table[@class="table table-striped table-bordered"]//td[@class="align_center"]

*** Test Cases ***
TC1 Test the checkout process with an empty cart
    [Tags]    Logged
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Login
    Click Element    xpath://li[@data-id="menu_checkout"]//a
    Title Should Be    Shopping Cart
    Element Should Contain    xpath://div[@class="contentpanel"]    Your shopping cart is empty!
    Close Browser

TC2 Verify Checkout Success From Checkout Page
    [Tags]    Logged
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Login
    Add Product
    Click Element    xpath://li[@data-id="menu_checkout"]//a
    Scroll Element Into View    //div[@class="row confirm_total"]
    Sleep    2s
    ${actual_total_product_value} =    Get the total product value
    ${actual_total_price} =    Get Total Price
    Should Be Equal As Numbers    ${actual_total_product_value}    ${actual_total_price}
    Click Button    id=checkout_btn
    Sleep    2s
    Title Should Be    Your Order Has Been Processed!
    Close Browser

TC3 Verify When User Add New Address That All Required Fields Are Left Blank
    [Tags]    Logged
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Login
    Add Product
    Go To The Check Address Page
    ${fn_text}=    Get Text    id=Address2Frm_firstname
    Should Be Equal As Strings    ${fn_text}    ${EMPTY}
    ${ln_text}=    Get Text    id=Address2Frm_lastname
    Should Be Equal As Strings    ${ln_text}    ${EMPTY}
    ${address1_text}=    Get Text    id=Address2Frm_address_1
    Should Be Equal As Strings    ${address1_text}    ${EMPTY}
    ${city}=    Get Text    id=Address2Frm_city
    Should Be Equal As Strings    ${city}    ${EMPTY}
    ${city}=    Get Text    id=Address2Frm_city
    Should Be Equal As Strings    ${city}    ${EMPTY}
    ${region}=    Get Text    //*[@id="Address2Frm_zone_id"]/option[1]
    Should Be Equal As Strings    ${region}    --- Please Select ---
    ${code}=    Get Text    id=Address2Frm_postcode
    Should Be Equal As Strings    ${code}    ${EMPTY}
    Click Element    //div[@class="registerbox"]//button
    Page Should Contain Element    //span[@class="help-block"]
    Close Browser

TC4 Check Missing Firstname input validation In Checkout Address Page
    [Tags]    Logged
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Login
    Add Product
    Click Element    xpath://li[@data-id="menu_checkout"]/a
    Add New Address/Payment    ${EMPTY}    ${new-last-name}    //table[@class="table confirm_shippment_options"]//a[@class="btn btn-default btn-xs"]
    Click Element    //div[@class="registerbox"]//button
    Element Text Should Be    //div[@class="registerbox"]//div[1]//span[@class="help-block"]    First Name must be between 1 and 32 characters!
    Close Browser

TC5 Check invalid City input validation In Checkout Address Page
    [Tags]    Logged
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Login
    Add Product
    Click Element    xpath://li[@data-id="menu_checkout"]/a
    Click Element    //table[@class="table confirm_shippment_options"]//a[@class="btn btn-default btn-xs"]
    Click Element    //a[@class="btn btn-default mr10"]
    Title Should Be    Checkout Address
    Input Text    id=Address2Frm_firstname    HIHI
    Input Text    id=Address2Frm_lastname    huhu
    Input Text    id=Address2Frm_address_1    Le Van Luong, Quan 7
    Input Text    id=Address2Frm_city    AA
    Scroll Element Into View    //div[@class="registerbox"]//button
    Select From List by Value    id=Address2Frm_zone_id    3513
    Input Text    id=Address2Frm_postcode    23233
    Click Element    //div[@class="registerbox"]//button
    Element Text Should Be    //div[@class="registerbox"]//div[6]//span[@class="help-block"]    City must be between 3 and 32 characters!
    Close Browser

TC6 Verify Checkout Process With Add New Address
    [Tags]    Logged
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Login
    Add Product
    Click Element    xpath://li[@data-id="menu_checkout"]//a
    Add New Address/Payment    ${new-first-name}    ${new-last-name}    //table[@class="table confirm_shippment_options"]//a[@class="btn btn-default btn-xs"]
    Click Element    xpath://div[@class="registerbox"]//button
    Sleep    2s
    Scroll Element Into View    //div[@class="row confirm_total"]
    ${actual_total_product_value} =    Get the total product value
    ${actual_total_price} =    Get Total Price
    Should Be Equal As Numbers    ${actual_total_product_value}    ${actual_total_price}
    Click Button    id=checkout_btn
    Sleep    2s
    Title Should Be    Your Order Has Been Processed!

TC7 Verify Checkout Success From Checkout Page Select The New Available Address
    [Tags]    Logged
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Login
    Add Product
    Click Element    xpath://li[@data-id="menu_checkout"]//a
    Select Other Address
    Scroll Element Into View    xpath://div[@class="row confirm_total"]
    Sleep    2s
    ${actual_total_product_value} =    Get the total product value
    ${actual_total_price} =    Get Total Price
    Should Be Equal As Numbers    ${actual_total_product_value}    ${actual_total_price}
    Click Button    id=checkout_btn
    Sleep    2s
    Title Should Be    Your Order Has Been Processed!
    Close Browser

TC8 Verify Checkout Success From Checkout Page Add New Payment
    [Tags]    Logged
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Login
    Add Product
    Click Element    xpath://li[@data-id="menu_checkout"]/a
    Add New Address/Payment    User_new    Payment    xpath://table[@class="table confirm_payment_options"]//a[@class="btn btn-default btn-xs"]
    Click Element    xpath://div[@class="registerbox"]//button
    Sleep    2s
    Scroll Element Into View    //div[@class="row confirm_total"]
    ${actual_total_product_value} =    Get the total product value
    ${actual_total_price} =    Get Total Price
    Should Be Equal As Numbers    ${actual_total_product_value}    ${actual_total_price}
    Click Button    id=checkout_btn
    Sleep    2s
    Title Should Be    Your Order Has Been Processed!
    Close Browser

TC9 Verify Checkout Success From Checkout Page Select The New Available Payment
    [Tags]    Logged
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Login
    Add Product
    Click Element    xpath://li[@data-id="menu_checkout"]/a
    Select Other Payment
    Scroll Element Into View    //div[@class="row confirm_total"]
    Sleep    2s
    ${actual_total_product_value} =    Get the total product value
    ${actual_total_price} =    Get Total Price
    Should Be Equal As Numbers    ${actual_total_product_value}    ${actual_total_price}
    Click Button    id=checkout_btn
    Sleep    2s
    Title Should Be    Your Order Has Been Processed!
    Close Browser

TC10 Check product quantity after edit quantity
    [Tags]    Logged
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Login
    Add Product
    Go to Checkout page
    Click Element    xpath://a[@class="pull-right mr10 btn btn-default btn-xs"]
    Input Text    id=cart_quantity50    2
    Click Button    id=cart_update
    ${new_quantity}    Get Value    id=cart_quantity50
    Click Element    id=cart_checkout1
    ${quantity_after_update}    Get Text    //table[@class="table confirm_products"]//td[4]
    Should Be Equal As Strings    ${new_quantity}    ${quantity_after_update}
    Close Browser

TC11 Check to update the total price when changing the product quantity
    [Tags]    Logged
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Login
    Add Product
    Go to Checkout page
    ${old_sum}=    Get Text    //td[@class="checkout_heading"]
    Click Element    xpath://a[@class="pull-right mr10 btn btn-default btn-xs"]
    Input Text    id=cart_quantity50    2
    Click Button    id=cart_update
    Click Element    id=cart_checkout1
    ${new_sum}=    Get Text    //td[@class="checkout_heading"]
    Should Not Be Equal As Strings    ${old_sum}    ${new_sum}
    Close Browser

TC12 Check Adding Comments Success In Delivery Information Page
    [Tags]    Logged
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Login
    Add Product
    Go to Checkout page
    #go to Delivery Information Page
    Click Element    //table[@class="table confirm_shippment_options"]//a[@class="btn btn-default btn-xs"]
    Title Should Be    Delivery Information
    #add comment
    Input Text    id=shipping_comment    ${comment}
    Click Element    //button[@title="Continue"]
    Sleep    2s
    Scroll Element Into View    //div[@class="row confirm_total"]
    Page Should Contain    Your Comments
    ${check_comment}    Get Text    //div[@class="container mb10"]
    Should Be Equal As Strings    ${comment}    ${check_comment}
    Close Browser

TC13 Check Editing Comments In Delivery Information Page
    [Tags]    Logged
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Login
    Add Product
    Go to Checkout page
    #go to Delivery Information Page
    Click Element    //table[@class="table confirm_shippment_options"]//a[@class="btn btn-default btn-xs"]
    Title Should Be    Delivery Information
    #add comment
    Input Text    id=shipping_comment    ${edit_comment}
    Click Element    //button[@title="Continue"]
    Sleep    2s
    Scroll Element Into View    //div[@class="row confirm_total"]
    Page Should Contain    Your Comments
    ${check_comment}    Get Text    //div[@class="container mb10"]
    Should Be Equal As Strings    ${edit_comment}    ${check_comment}
    Close Browser

TC14 Check Deleting Comments In Delivery Information Page
    [Tags]    Logged
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Login
    Add Product
    Go to Checkout page
    #go to Delivery Information Page
    Click Element    //table[@class="table confirm_shippment_options"]//a[@class="btn btn-default btn-xs"]
    Title Should Be    Delivery Information
    #add comment
    Input Text    id=shipping_comment    ${EMPTY}
    Click Element    //button[@title="Continue"]
    Sleep    2s
    Scroll Element Into View    //div[@class="row confirm_total"]
    Page Should Not Contain    Your Comments
    Close Browser

TC15 Validate Adding Comments Contain Special Characters In Delivery Information Page
    [Tags]    Logged
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Login
    Add Product
    Go to Checkout page
    #go to Delivery Information Page
    Click Element    //table[@class="table confirm_shippment_options"]//a[@class="btn btn-default btn-xs"]
    Title Should Be    Delivery Information
    #add comment
    Input Text    id=shipping_comment    ${special_characters}
    Click Element    //button[@title="Continue"]
    Sleep    2s
    Scroll Element Into View    //div[@class="row confirm_total"]
    Page Should Contain    Your Comments
    ${check_comment}    Get Text    //div[@class="container mb10"]
    Should Be Equal As Strings    ${special_characters}    ${check_comment}
    Close Browser

TC16 Validate Adding Comments Success In Payment Information Page
    [Tags]    Logged
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Login
    Add Product
    Go to Checkout page
    #go to Delivery Information Page
    Click Element    //table[@class="table confirm_payment_options"]//a[@class="btn btn-default btn-xs"]
    Title Should Be    Payment Information
    #add comment
    Input Text    id=payment_comment    ${comment}
    Click Element    id=payment_agree
    Click Element    //button[@title="Continue"]
    Sleep    2s
    Scroll Element Into View    //div[@class="row confirm_total"]
    Page Should Contain    Your Comments
    ${check_comment}    Get Text    //div[@class="container mb10"]
    Should Be Equal As Strings    ${comment}    ${check_comment}
    Close Browser

TC17 Validate Editing Comments In Payment Information Page
    [Tags]    Logged
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Login
    Add Product
    Go to Checkout page
    #go to Payment Information Page
    Click Element    //table[@class="table confirm_payment_options"]//a[@class="btn btn-default btn-xs"]
    Title Should Be    Payment Information
    #add comment
    Input Text    id=payment_comment    ${edit_comment}
    Click Element    id=payment_agree
    Click Element    //button[@title="Continue"]
    Sleep    2s
    Scroll Element Into View    //div[@class="row confirm_total"]
    Page Should Contain    Your Comments
    ${check_comment}    Get Text    //div[@class="container mb10"]
    Should Be Equal As Strings    ${edit_comment}    ${check_comment}
    Close Browser

TC18 Validate Deleting Comments In Payment Information Page
    [Tags]    Logged
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Login
    Add Product
    Go to Checkout page
    #go to Payment Information Page
    Click Element    //table[@class="table confirm_payment_options"]//a[@class="btn btn-default btn-xs"]
    Click Element    id=payment_agree
    Title Should Be    Payment Information
    #add comment
    Input Text    id=payment_comment    ${EMPTY}
    Click Element    //button[@title="Continue"]
    Sleep    2s
    Scroll Element Into View    //div[@class="row confirm_total"]
    Page Should Not Contain    Your Comments
    Close Browser

TC19 Validate Adding Comments Contain Special Characters In Payment Information Page
    [Tags]    Logged
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Login
    Add Product
    Go to Checkout page
    #go to Payment Information Page
    Click Element    //table[@class="table confirm_payment_options"]//a[@class="btn btn-default btn-xs"]
    Title Should Be    Payment Information
    #add comment
    Input Text    id=payment_comment    ${special_characters}
    Click Element    id=payment_agree
    Click Element    //button[@title="Continue"]
    Sleep    2s
    Scroll Element Into View    //div[@class="row confirm_total"]
    Page Should Contain    Your Comments
    ${check_comment}    Get Text    //div[@class="container mb10"]
    Should Be Equal As Strings    ${special_characters}    ${check_comment}
    Close Browser

TC20 Verify Add Comment Without Agreeing to Return Policy
    [Tags]    Logged
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Login
    Add Product
    Go to Checkout page
    #go to Payment Information Page
    Click Element    //table[@class="table confirm_payment_options"]//a[@class="btn btn-default btn-xs"]
    Title Should Be    Payment Information
    #comment
    Unselect Checkbox    id=payment_agree    # Ensure the checkbox is unchecked
    Click Element    //button[@title="Continue"]
    Wait Until Element Is Visible    css=.alert.alert-error.alert-danger
    ${error_message} =    Get Text    css=.alert.alert-error.alert-danger
    Should Contain    ${error_message}    Error: You must agree to the Return Policy!
    Close Browser

TC21 Verify Apply Unvalid Coupon
    [Tags]    Logged
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Login
    Add Product
    Go to Checkout page
    #go to Payment Information Page
    Click Element    //table[@class="table confirm_payment_options"]//a[@class="btn btn-default btn-xs"]
    Title Should Be    Payment Information
    Input Text    id=coupon_coupon    test.coupon
    Click Button    id=apply_coupon_btn
    Wait Until Element Is Visible    css=.alert.alert-error.alert-danger
    ${error_message} =    Get Text    css=.alert.alert-error.alert-danger
    Should Contain    ${error_message}    Error: Coupon is either invalid, expired or reached it's usage limit!
    Close Browser

TC22 Verify checkout process with an empty cart
    [Tags]    Guest Checkout
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Click Element    xpath://li[@data-id="menu_checkout"]/a
    Title Should Be    Shopping Cart
    Element Should Contain    xpath://div[@class="contentpanel"]    Your shopping cart is empty!
    Close Browser

TC23 Validate Empty Fields in Guest Checkout - Step 1 Page
    [Tags]    Guest Checkout
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Add Product
    Click Element    xpath://ul[@id="customer_menu_top"]//a
    Click Element    id=accountFrm_accountguest
    Click Button    //button[@title="Continue"]
    Title Should Be    Guest Checkout - Step 1
    ${fn}=    Get Text    id=guestFrm_firstname
    Should Be Equal As Strings    ${fn}    ${EMPTY}
    ${ln}=    Get Text    id=guestFrm_firstname
    Should Be Equal As Strings    ${ln}    ${EMPTY}
    ${address1}=    Get Text    id=guestFrm_address_1
    Should Be Equal As Strings    ${address1}    ${EMPTY}
    ${city}=    Get Text    id=guestFrm_city
    Should Be Equal As Strings    ${city}    ${EMPTY}
    ${code}=    Get Text    id=guestFrm_postcode
    Should Be Equal As Strings    ${code}    ${EMPTY}
    Click Element    //button[@title="Continue"]
    Page Should Contain Element    //span[@class="help-block"]
    Close Browser

TC24 Verify that an Invalid Email Test in Guest Checkout - Step 1 Page
    [Documentation]    Verify that an invalid email address is rejected
    [Tags]    Guest Checkout
    Open Browser    ${url}    ${browser}
    Add Product
    Click Element    xpath://ul[@id="customer_menu_top"]//a
    Click Element    id=accountFrm_accountguest
    Click Button    //button[@title="Continue"]
    Title Should Be    Guest Checkout - Step 1
    Add Personal Detail and Address of Guest    invalid@.
    Click Element    //button[@title="Continue"]
    #get error
    Element Should Contain    //div[@class="registerbox form-horizontal"]//div[3]/span    E-Mail Address does not appear to be valid!
    Close Browser

TC25 Verify that an valid Email Test in Guest Checkout - Step 1 Page
    [Documentation]    Verify that an invalid email address is rejected
    [Tags]    Guest Checkout
    Open Browser    ${url}    ${browser}
    Add Product
    Click Element    xpath://ul[@id="customer_menu_top"]//a
    Click Element    id=accountFrm_accountguest
    Click Button    //button[@title="Continue"]
    Title Should Be    Guest Checkout - Step 1
    Add Personal Detail and Address of Guest    invalid@.
    Click Element    //button[@title="Continue"]
    #get error
    Element Should Contain    //div[@class="registerbox form-horizontal"]//div[3]/span    E-Mail Address does not appear to be valid!
    Close Browser

TC26 Verify checkout proccess that no separate shipping address in Guest Checkout - Step 1 Page
    [Tags]    Guest Checkout
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Add Product
    Click Element    xpath://ul[@id="customer_menu_top"]//a
    Click Element    id=accountFrm_accountguest
    Click Button    //button[@title="Continue"]
    Title Should Be    Guest Checkout - Step 1
    Add Personal Detail and Address of Guest    guest@gmail.com
    Click Element    //button[@title="Continue"]
    Sleep    2s
    Title Should Be    Checkout Confirmation
    Scroll Element Into View    //div[@class="row confirm_total"]
    Sleep    2s
    ${actual_total_product_value} =    Get the total product value
    ${actual_total_price} =    Get Total Price
    Should Be Equal As Numbers    ${actual_total_product_value}    ${actual_total_price}
    Click Button    id=checkout_btn
    Sleep    2s
    Title Should Be    Your Order Has Been Processed!
    Close Browser

TC27 Verify checkout proccess that have a separate shipping address in Guest Checkout - Step 1 Page
    [Tags]    Guest Checkout
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Add Product
    Click Element    xpath://ul[@id="customer_menu_top"]//a
    Click Element    id=accountFrm_accountguest
    Click Button    //button[@title="Continue"]
    Title Should Be    Guest Checkout - Step 1
    Add Personal Detail and Address of Guest    guest@gmail.com
    Click Element    id=guestFrm_shipping_indicator
    #add shipping address
    Page Should Contain Element    id=shipping_details
    Add New Shipping Address
    #go to checkout confirmation page
    Click Element    //button[@title="Continue"]
    Sleep    2s
    Title Should Be    Checkout Confirmation
    Scroll Element Into View    //div[@class="row confirm_total"]
    Sleep    2s
    ${actual_total_product_value} =    Get the total product value
    ${actual_total_price} =    Get Total Price
    Should Be Equal As Numbers    ${actual_total_product_value}    ${actual_total_price}
    Click Button    id=checkout_btn
    Sleep    2s
    Title Should Be    Your Order Has Been Processed!
    Close Browser

TC28 Check product quantity after edit quantity
    [Tags]    Guest Checkout
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Login
    Add Product
    Go to Checkout page
    Click Element    xpath://a[@class="pull-right mr10 btn btn-default btn-xs"]
    Input Text    id=cart_quantity50    2
    Click Button    id=cart_update
    ${new_quantity}    Get Value    id=cart_quantity50
    Click Element    id=cart_checkout1
    ${quantity_after_update}    Get Text    //table[@class="table confirm_products"]//td[4]
    Should Be Equal As Strings    ${new_quantity}    ${quantity_after_update}
    Close Browser

TC29 Check to update the total price when changing the product quantity
    [Tags]    Guest Checkout
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Login
    Add Product
    Go to Checkout page
    ${old_sum}=    Get Text    //td[@class="checkout_heading"]
    Click Element    xpath://a[@class="pull-right mr10 btn btn-default btn-xs"]
    Input Text    id=cart_quantity50    2
    Click Button    id=cart_update
    Click Element    id=cart_checkout1
    ${new_sum}=    Get Text    //td[@class="checkout_heading"]
    Should Not Be Equal As Strings    ${old_sum}    ${new_sum}
    Close Browser

TC30 Validate Adding Comments Success By Choose Edit Shipping
    [Tags]    Guest Checkout
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Add Product
    Click Element    xpath://ul[@id="customer_menu_top"]//a
    Click Element    id=accountFrm_accountguest
    Click Button    //button[@title="Continue"]
    Add Personal Detail and Address of Guest    guest@gmail.com
    #go to checkout confirmation page
    Click Element    //button[@title="Continue"]
    Sleep    2s
    Title Should Be    Checkout Confirmation
    #go to Guest Checkout-step2 Page
    Click Element    //table[@class="table confirm_shippment_options"]//a[@class="btn btn-default btn-xs"]
    Title Should Be    Guest Checkout - Step 2
    #add comment
    Input Text    id=guest_comment    ${comment}
    Click Element    id=guest_agree
    Click Element    //button[@title="Continue"]
    Sleep    2s
    Page Should Contain    Your Comments
    ${check_comment}    Get Text    //div[@class="container mb10"]
    Should Be Equal As Strings    ${comment}    ${check_comment}
    Close Browser

TC31 Validate Editing Comments In Guest Checkout-Step 2 Page By Choose Edit Shipping
    [Tags]    Guest Checkout
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Add Product
    Click Element    xpath://ul[@id="customer_menu_top"]//a
    Click Element    id=accountFrm_accountguest
    Click Button    //button[@title="Continue"]
    Add Personal Detail and Address of Guest    guest@gmail.com
    #go to checkout confirmation page
    Click Element    //button[@title="Continue"]
    Sleep    2s
    Title Should Be    Checkout Confirmation
    #go to Guest Checkout-step2 Page
    Click Element    //table[@class="table confirm_shippment_options"]//a[@class="btn btn-default btn-xs"]
    Title Should Be    Guest Checkout - Step 2
    #add comment
    Input Text    id=guest_comment    ${edit_comment}
    Click Element    id=guest_agree
    Click Element    //button[@title="Continue"]
    Sleep    2s
    # Scroll Element Into View    //div[@class="row confirm_total"]
    Page Should Contain    Your Comments
    ${check_comment}    Get Text    //div[@class="container mb10"]
    Should Be Equal As Strings    ${edit_comment}    ${check_comment}
    Close Browser

TC32 Validate Deleting Comments In Guest Checkout-Step 2 Page By Choose Edit Shipping
    [Tags]    Guest Checkout
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Add Product
    Click Element    xpath://ul[@id="customer_menu_top"]//a
    Click Element    id=accountFrm_accountguest
    Click Button    //button[@title="Continue"]
    Add Personal Detail and Address of Guest    guest@gmail.com
    #go to checkout confirmation page
    Click Element    //button[@title="Continue"]
    Sleep    2s
    Title Should Be    Checkout Confirmation
    #go to Guest Checkout-step2 Page
    Click Element    //table[@class="table confirm_shippment_options"]//a[@class="btn btn-default btn-xs"]
    Title Should Be    Guest Checkout - Step 2
    #add comment
    Input Text    id=guest_comment    ${EMPTY}
    Click Element    id=guest_agree
    Click Element    //button[@title="Continue"]
    Sleep    2s
    # Scroll Element Into View    //div[@class="row confirm_total"]
    Page Should Not Contain    Your Comments
    Close Browser

TC33 Validate Adding Comments Contain Special Characters In Guest Checkout-Step 2 Page
    [Tags]    Guest Checkout
    Open Browser    ${url}    ${browser}
    Add Product
    Click Element    xpath://ul[@id="customer_menu_top"]//a
    Click Element    id=accountFrm_accountguest
    Click Button    //button[@title="Continue"]
    Add Personal Detail and Address of Guest    guest@gmail.com
    #go to checkout confirmation page
    Click Element    //button[@title="Continue"]
    Sleep    2s
    Title Should Be    Checkout Confirmation
    #go to Guest Checkout-step2 Page
    Click Element    //table[@class="table confirm_shippment_options"]//a[@class="btn btn-default btn-xs"]
    Title Should Be    Guest Checkout - Step 2
    #add comment
    Input Text    id=guest_comment    ${special_characters}
    Click Element    id=guest_agree
    Click Element    //button[@title="Continue"]
    Sleep    2s
    # Scroll Element Into View    //div[@class="row confirm_total"]
    Page Should Contain    Your Comments
    ${check_comment}    Get Text    //div[@class="container mb10"]
    Should Be Equal As Strings    ${special_characters}    ${check_comment}
    Close Browser

TC34 Validate Adding Comments Success In Guest Checkout - Step 2 Page By Choose Edit Payment
    [Tags]    Guest Checkout
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Add Product
    Click Element    xpath://ul[@id="customer_menu_top"]//a
    Click Element    id=accountFrm_accountguest
    Click Button    //button[@title="Continue"]
    Add Personal Detail and Address of Guest    guest@gmail.com
    #go to checkout confirmation page
    Click Element    //button[@title="Continue"]
    Sleep    2s
    Title Should Be    Checkout Confirmation
    #go to Guest Checkout-step2 Page
    Click Element    //table[@class="table confirm_payment_options"]//a[@class="btn btn-default btn-xs"]
    Title Should Be    Guest Checkout - Step 2
    #add comment
    Input Text    id=guest_comment    ${comment}
    Click Element    id=guest_agree
    Click Element    //button[@title="Continue"]
    Sleep    2s
    # Scroll Element Into View    //div[@class="row confirm_total"]
    Page Should Contain    Your Comments
    ${check_comment}    Get Text    //div[@class="container mb10"]
    Should Be Equal As Strings    ${comment}    ${check_comment}
    Close Browser

TC35 Validate Editing Comments In Guest Checkout - Step 2 Page By Choose Edit Payment
    [Tags]    Guest Checkout
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Add Product
    Click Element    xpath://ul[@id="customer_menu_top"]//a
    Click Element    id=accountFrm_accountguest
    Click Button    //button[@title="Continue"]
    Add Personal Detail and Address of Guest    guest@gmail.com
    #go to checkout confirmation page
    Click Element    //button[@title="Continue"]
    Sleep    2s
    Title Should Be    Checkout Confirmation
    #go to Guest Checkout-step2 Page
    Click Element    //table[@class="table confirm_payment_options"]//a[@class="btn btn-default btn-xs"]
    Title Should Be    Guest Checkout - Step 2
    #add comment
    Input Text    id=guest_comment    ${edit_comment}
    Click Element    id=guest_agree
    Click Element    //button[@title="Continue"]
    Sleep    2s
    Scroll Element Into View    //div[@class="row confirm_total"]
    Page Should Contain    Your Comments
    ${check_comment}    Get Text    //div[@class="container mb10"]
    Should Be Equal As Strings    ${edit_comment}    ${check_comment}
    Close Browser

TC36 Validate Deleting Comments In Guest Checkout - Step 2 By Choose Edit Payment
    [Tags]    Guest Checkout
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Add Product
    Click Element    xpath://ul[@id="customer_menu_top"]//a
    Click Element    id=accountFrm_accountguest
    Click Button    //button[@title="Continue"]
    Add Personal Detail and Address of Guest    guest@gmail.com
    #go to checkout confirmation page
    Click Element    //button[@title="Continue"]
    Sleep    2s
    Title Should Be    Checkout Confirmation
    #go to Guest Checkout-step2 Page
    Click Element    //table[@class="table confirm_payment_options"]//a[@class="btn btn-default btn-xs"]
    Title Should Be    Guest Checkout - Step 2
    #add comment
    Input Text    id=guest_comment    ${EMPTY}
    Click Element    id=guest_agree
    Click Element    //button[@title="Continue"]
    Sleep    2s
    Scroll Element Into View    //div[@class="row confirm_total"]
    Page Should Not Contain    Your Comments
    Close Browser

TC37 Validate Adding Comments Contain Special Characters
    [Tags]    Guest Checkout
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Add Product
    Click Element    xpath://ul[@id="customer_menu_top"]//a
    Click Element    id=accountFrm_accountguest
    Click Button    //button[@title="Continue"]
    Add Personal Detail and Address of Guest    guest@gmail.com
    #go to checkout confirmation page
    Click Element    //button[@title="Continue"]
    Sleep    2s
    Title Should Be    Checkout Confirmation
    #go to Guest Checkout-step2 Page
    Click Element    //table[@class="table confirm_payment_options"]//a[@class="btn btn-default btn-xs"]
    Title Should Be    Guest Checkout - Step 2
    #add comment
    Input Text    id=guest_comment    ${special_characters}
    Click Element    id=guest_agree
    Click Element    //button[@title="Continue"]
    Sleep    2s
    Scroll Element Into View    //div[@class="row confirm_total"]
    Page Should Contain    Your Comments
    ${check_comment}    Get Text    //div[@class="container mb10"]
    Should Be Equal As Strings    ${special_characters}    ${check_comment}
    Sleep    2s
    ${actual_total_product_value} =    Get the total product value
    ${actual_total_price} =    Get Total Price
    Should Be Equal As Numbers    ${actual_total_product_value}    ${actual_total_price}
    Click Button    id=checkout_btn
    Sleep    2s
    Title Should Be    Your Order Has Been Processed!
    Close Browser

TC38 Verify Add Comment Without Agreeing to Return Policy In Guest Checkout - Step 2 Page
    [Tags]    Guest Checkout
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Add Product
    Click Element    xpath://ul[@id="customer_menu_top"]//a
    Click Element    id=accountFrm_accountguest
    Click Button    //button[@title="Continue"]
    Add Personal Detail and Address of Guest    guest@gmail.com
    #go to checkout confirmation page
    Click Element    //button[@title="Continue"]
    Sleep    2s
    Title Should Be    Checkout Confirmation
    #go to Guest Checkout-step2 Page
    Click Element    //table[@class="table confirm_shippment_options"]//a[@class="btn btn-default btn-xs"]
    Title Should Be    Guest Checkout - Step 2
    #comment
    Unselect Checkbox    id=guest_agree    # Ensure the checkbox is unchecked
    Click Element    //button[@title="Continue"]
    Wait Until Element Is Visible    css=.alert.alert-error.alert-danger
    ${error_message} =    Get Text    css=.alert.alert-error.alert-danger
    Should Contain    ${error_message}    Error: You must agree to the Return Policy!
    Close Browser

TC39 Verify Apply Unvalid Coupon Guest
    [Tags]    Guest Checkout
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Add Product
    Click Element    xpath://ul[@id="customer_menu_top"]//a
    Click Element    id=accountFrm_accountguest
    Click Button    //button[@title="Continue"]
    Add Personal Detail and Address of Guest    guest@gmail.com
    #go to checkout confirmation page
    Click Element    //button[@title="Continue"]
    Sleep    2s
    Title Should Be    Checkout Confirmation
    #go to Guest Checkout-step2 Page
    Click Element    //table[@class="table confirm_payment_options"]//td[4]//a[2]
    Title Should Be    Guest Checkout - Step 2
    Input Text    id=coupon_coupon    test.coupon
    Click Button    id=apply_coupon_btn
    Wait Until Element Is Visible    css=.alert.alert-error.alert-danger
    ${error_message} =    Get Text    css=.alert.alert-error.alert-danger
    Should Contain    ${error_message}    Error: Coupon is either invalid, expired or reached it's usage limit!

TC40 Verify Guest Check Out Success
    [Tags]    Guest Checkout
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Add Product
    Click Element    xpath://ul[@id="customer_menu_top"]//a
    Click Element    id=accountFrm_accountguest
    Click Button    //button[@title="Continue"]
    Add Personal Detail and Address of Guest    guest@gmail.com
    #go to checkout confirmation page
    Click Element    //button[@title="Continue"]
    Sleep    2s
    Title Should Be    Checkout Confirmation

*** Keywords ***
Login
    Click Element    xpath://ul[@id="customer_menu_top"]//a
    Input Text    ${input_name}    sdsdsd
    Input Password    ${input_pwd}    sdsdsd
    Click Button    ${btn_login}

Add Product
    Click Element    xpath://a[@class="active menu_home"]
    Click Element    //a[@data-id="50"]

Go to Checkout page
    Click Element    xpath://li[@data-id="menu_checkout"]/a
    Title Should Be    Checkout Confirmation

Go To The Check Address Page
    Click Element    xpath://li[@data-id="menu_checkout"]/a
    Click Element    ${check_address_path}
    Click Element    //a[@class="btn btn-default mr10"]
    Title Should Be    Checkout Address

Get the total product value
    ${price_text} =    Get Text    //td[span[@class="bold totalamout"]]
    ${total_price} =    Convert To Number    ${price_text[1:]}
    [Return]    ${total_price}

Get Total Price
    ${total_value} =    Get Text    //div[@class="sidewidt"]//table[2]//tr[3]//td[@class="align_right"][2]
    ${total} =    Convert To Number    ${total_value[1:]}
    [Return]    ${total}

Add New Address/Payment
    [Arguments]    ${firstname}    ${lastname}    ${path}
    Click Element    ${path}
    Click Element    //a[@class="btn btn-default mr10"]
    Title Should Be    Checkout Address
    Input Text    id=Address2Frm_firstname    ${firstname}
    Input Text    id=Address2Frm_lastname    ${lastname}
    Input Text    id=Address2Frm_address_1    Le Van Luong, Quan 7
    Input Text    id=Address2Frm_city    Ho Chi Minh
    Scroll Element Into View    //div[@class="registerbox"]//button
    Select From List by Value    id=Address2Frm_zone_id    3515
    Sleep    2s
    Input Text    id=Address2Frm_postcode    23233
    # Select From List By Value    id=Address2Frm_country_id    230
    # Click Element    //button[@class="btn btn-orange pull-right lock-on-click" and text()="Continue"]

Select Other Address
    Click Element    //table[@class="table confirm_shippment_options"]//a[@class="btn btn-default btn-xs"]
    Click Element    //a[@class="btn btn-default mr10"]
    Title Should Be    Checkout Address
    Click_Random_Input
    Click Element    //div[@class="registerbox form-horizontal"]//button

Select Other Payment
    Click Element    xpath://table[@class="table confirm_payment_options"]//a[@class="btn btn-default btn-xs"]
    Click Element    //a[@class="btn btn-default mr10"]
    Title Should Be    Checkout Address
    Click_Random_Input
    Click Element    //div[@class="registerbox form-horizontal"]//button

Click_Random_Input
    # Get all input elements in the table
    ${input_elements}    Get WebElements    //div[@class="registerbox form-horizontal"]//input[@type="radio"]
    # Count the number of input elements
    ${input_count}    Get Length    ${input_elements}
    # Generate a random index
    ${random_index}    Evaluate    random.randint(0, ${input_count}-1)
    # Get a random input element based on the random index
    ${random_input}    Get WebElement    ${input_elements}[${random_index}]
    # Click on the random input
    Click Element    ${random_input}

Multiply Prices With Quantities
    [Arguments]    ${unit_prices}    ${quantities}
    ${total_prices} =    Create List
    FOR    ${index}    IN RANGE    0    ${unit_prices.__len__()}
        ${unit_price} =    Remove Currency Symbol ${unit_prices}[${index}]
        ${quantity_text}    Get Text    id=cart_quantity50
        ${quantity} =    Convert To Number    ${quantity_text}
        ${total_price} =    Evaluate    ${unit_price} * ${quantity}
        Append To List    ${total_prices}    ${total_price}
    END
    [Return]    ${total_prices}

Convert Prices To Numbers
    [Arguments]    ${prices}
    ${converted_prices} =    Create List
    FOR    ${price}    IN    @{prices}
        ${number} =    Remove Currency Symbol    ${price}
        Append To List    ${converted_prices}    ${number}
    END
    [Return]    ${converted_prices}

Remove Currency Symbol
    [Arguments]    ${price_with_currency}
    ${price_without_currency} =    Set Variable If    '${price_with_currency}'.startswith('$')    ${price_with_currency}[1:]    ${price_with_currency}
    [Return]    ${price_without_currency}

Add Personal Detail and Address of Guest
    [Arguments]    ${email}
    Input Text    id=guestFrm_firstname    Guest1
    Input Text    id=guestFrm_lastname    Test1
    Input Text    id=guestFrm_email    ${email}
    Input Text    id=guestFrm_address_1    Le Van Luong
    Input Text    id=guestFrm_city    SaiGon
    Select From List By Value    id=guestFrm_country_id    230
    Sleep    3s
    Select From List By Value    id=guestFrm_zone_id    3757
    Input Text    id=guestFrm_postcode    4459302

Add New Shipping Address
    Input Text    id=guestFrm_shipping_firstname    Guest2
    Input Text    id=guestFrm_shipping_lastname    Test2
    Input Text    id=guestFrm_shipping_address_1    Tan Binh
    Input Text    id=guestFrm_shipping_city    Dien Bien
    Select From List By Value    id=guestFrm_shipping_country_id    230
    Sleep    2s
    Select From List By Value    id=guestFrm_shipping_zone_id    3777
    Input Text    id=guestFrm_shipping_postcode    2222333
