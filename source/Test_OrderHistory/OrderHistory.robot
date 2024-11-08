*** Settings ***
Library            SeleniumLibrary
Library            OperatingSystem
Library            RequestsLibrary
Library        Collections
Library           BuiltIn
Library    XML
*** Variables ***
${url}           https://automationteststore.com/
${browser}        chrome
${input_name}    id=loginFrm_loginname
${input_pwd}    id=loginFrm_password
${btn_login}         xpath://button[@title="Login"]
${address-id}              id=address_1_a_2212722127
${check_address_path}        //table[@class="table confirm_shippment_options"]//a[@class="btn btn-default btn-xs"]
${new-first-name}        User2
${new-last-name}         Test2
${postal-code}        2246
${comment}    This is my comment!
${edit_comment}        Goi dien truoc khi giao hang nha
${special_characters}     !@.dda$$%
${UNIT_PRICE_XPATH}    //table[@class="table table-striped table-bordered"]//td[@class="align_right"]
${QUANTITY_XPATH}    //table[@class="table table-striped table-bordered"]//td[@class="align_center"]

*** Test Cases ***
TC1 Check no order history yet

    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Login      
    Mouse Over    //*[@id="customer_menu_top"]/li/a
    Click Element   //*[@id="customer_menu_top"]/li/ul/li[6]/a

    Title Should Be    My Order History

    Page Should Contain    You have not made any previous orders!	
    Close Browser
TC2 Verify select order details after payment
 
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Login      
    Add Product     
    Click Element    xpath://li[@data-id="menu_checkout"]/a
    Scroll Element Into View    //div[@class="row confirm_total"]
    Sleep    2s

    ${actual_total_product_value} =    Get the total product value
    ${actual_total_price} =    Get Total Price
    Should Be Equal As Strings    ${actual_total_product_value}    ${actual_total_price}

    Click Button    id=checkout_btn
    Sleep    2s
    Title Should Be    Your Order Has Been Processed!


    Click Element    //*[@id="maincontainer"]/div/div/div/div/section/p[3]/a
    ${total_in_detail}=    Get Text    //*[@id="maincontainer"]/div/div[1]/div/div/div[2]/div[2]/table/tbody/tr[3]/td[2]
    Should Be Equal As Strings    ${total_in_detail}    ${actual_total_price}
    Close Browser	
TC3 Check view detailed a history order 
    [Tags]    Logged
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Login      
    Mouse Over    //*[@id="customer_menu_top"]/li/a
    Click Element   //*[@id="customer_menu_top"]/li/ul/li[6]/a

    Title Should Be    My Order History
    Click Button    id=button_edit
    Element Text Should Be    //span[@class="maintext"]     ORDER DETAILS
    Page Should Contain Element    //*[@id="maincontainer"]/div/div[1]/div/div
    Close Browser
TC4 Check Order Comment In Order Detail 
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Login  
    Add Product
    Go to Checkout page
    #go to Delivery Information Page
    Click Element      //table[@class="table confirm_shippment_options"]//a[@class="btn btn-default btn-xs"]
    Title Should Be    Delivery Information

    #add comment 
    Input Text    id=shipping_comment    ${comment} 
    Click Element    //button[@title="Continue"]
    Sleep    2s
    
    Scroll Element Into View    //div[@class="row confirm_total"]
    Page Should Contain    Your Comments
    ${check_comment}    Get Text    //div[@class="container mb10"]
     Click Button    id=checkout_btn
    Sleep    2s
    Mouse Over    //*[@id="customer_menu_top"]/li/a
    Click Element   //*[@id="customer_menu_top"]/li/ul/li[6]/a
     Click Button    id=button_edit
     ${comment_detail_ord}=    Get Text    //*[@id="maincontainer"]/div/div[1]/div/div/div[3]/div
     Should Be Equal As Strings    ${comment_detail_ord}    ${check_comment}

    

TC5 Check pagination if there is only one page in the history

    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Login      
    Add Product     
    Click Element    xpath://li[@data-id="menu_checkout"]/a
    Scroll Element Into View    //div[@class="row confirm_total"]
    Sleep    2s

    Click Button    id=checkout_btn
    Sleep    4s
    Title Should Be    Your Order Has Been Processed!

     Mouse Over    //*[@id="customer_menu_top"]/li/a
    Click Element   //*[@id="customer_menu_top"]/li/ul/li[6]/a

    Title Should Be    My Order History

    ${first_button}=    Get Element Attribute    xpath=//ul[@class="pagination"]/li[1]    class
    Should Contain    ${first_button}    disabled
    Close Browser
# TC6 Check Per Page "10" Options
#     [Documentation]    Verify that the "per page" options work correctly

#     Open Browser    ${url}    ${browser}
#     Maximize Browser Window
#     Login      
#     Add Product
#     Mouse Over    //*[@id="customer_menu_top"]/li/a
#     Click Element   //*[@id="customer_menu_top"]/li/ul/li[6]/a
#     # Assume the per page dropdown element has xpath as below, modify it according to your HTML structure
#     Click Element    xpath=//select[@id="limit"]
#     # Check per page option 10
#     Click Element    xpath=//select[@id="limit"]/option[@value="10"]
#     Wait Until Element Is Visible    xpath=//table
#     ${table_elements}=    Get WebElements    xpath=//table
#     ${table_count}=    Get Length    ${table_elements}

#     Should Be True    ${table_count} <= 10    # Assuming you expect no more than 10 rows per page
#     Close Browser
    
# TC7 Check page history order 
#     [Tags]    Logged
#     Open Browser    ${url}    ${browser}
#     Maximize Browser Window
#     Login      
#     Mouse Over    //*[@id="customer_menu_top"]/li/a
#     Click Element   //*[@id="customer_menu_top"]/li/ul/li[6]/a

#     Title Should Be    My Order History
#     Page Should Contain Element    //*[@id="maincontainer"]/div/div[1]/div/div
#     Close Browser



# TC8 Validate Adding Comments Success By Choose Edit Shipping 
#     [Tags]    Guest 
#     Open Browser    ${url}    ${browser}
#     Maximize Browser Window
#     Add Product
#     Click Element    xpath://ul[@id="customer_menu_top"]//a
#     Click Element    id=accountFrm_accountguest    
#     Click Button    //button[@title="Continue"]

#     Add Personal Detail and Address of Guest     guest@gmail.com
    
#     #go to checkout confirmation page
#     Click Element     //button[@title="Continue"]
#     Sleep    2s
#     Title Should Be    Checkout Confirmation 
#     #go to Guest Checkout-step2 Page
#     Click Element      //table[@class="table confirm_shippment_options"]//a[@class="btn btn-default btn-xs"]
#     Title Should Be    Guest Checkout - Step 2

#     #add comment 
#     Input Text    id=guest_comment    ${comment} 
#     Click Element    id=guest_agree
#     Click Element    //button[@title="Continue"]
#     Sleep    2s
#     Scroll Element Into View    //div[@class="container mb10"]
#     Page Should Contain Element    //div[@class="container mb10"]
#     ${check_comment}    Get Text    //div[@class="container mb10"]
#     Should Be Equal As Strings    ${comment}    ${check_comment}
#     Close Browser

# TC9 Check the function to search order detail
#     [Tags]    Guest
#     Open Browser    ${url}    ${browser}
#     Maximize Browser Window
#     Click Element    //*[@id="main_menu_top"]/li[2]/ul/li[2]/a
#     Page Should Contain Element    id=maincontainer
#     Input Text    id=CheckOrderFrm_order_id    36045 
#     Input Text    id=CheckOrderFrm_email    ngdinhaitrinh@gmail.com 
#     Click Button    //button[@title="Continue"] 
#     Sleep    2s 
#     Title Should Be    Order Details 
#     Page Should Contain Element    id=maincontainer
#     Close Browser

# TC10 Check the function to view order detail and enter invalid order id
#     [Tags]    Guest
#     Open Browser    ${url}    ${browser}
#     Maximize Browser Window
#     Click Element    //*[@id="main_menu_top"]/li[2]/ul/li[2]/a
#     Page Should Contain Element    id=maincontainer
#     Input Text    id=CheckOrderFrm_order_id    35a45d 
#     Input Text    id=CheckOrderFrm_email    ngdinhaitrinh@gmail.com 
#     Click Button    //button[@title="Continue"] 
#     Sleep    2s 
#     Element Text Should Be    //*[@id="maincontainer"]/div/div/div/div    The order you have requested could not be found!	
#     Title Should Be    Order Details 
#     Page Should Contain Element    id=maincontainer
#     Close Browser
# TC11 Checked the functionality to view order details and enter emails that did not exist
#     [Tags]    Guest
#     Open Browser    ${url}    ${browser}
#     Maximize Browser Window
#     Click Element    //*[@id="main_menu_top"]/li[2]/ul/li[2]/a
#     Page Should Contain Element    id=maincontainer
#     Input Text    id=CheckOrderFrm_order_id    36045 
#     Input Text    id=CheckOrderFrm_email    ngdinhaitrin111111h@gmail.com 
#     Click Button    //button[@title="Continue"] 
#     Sleep    2s 
#     Element Text Should Be    //*[@id="maincontainer"]/div/div/div/div    The order you have requested could not be found!	
#     Title Should Be    Order Details 
#     Page Should Contain Element    id=maincontainer
#     Close Browser


#Kết quả mong đợi: Ghi chú được thêm vào đơn hàng và hiển thị trong thông tin đơn hàng.

*** Keywords ***
Login    
    [Arguments]   
    Click Element    xpath://ul[@id="customer_menu_top"]//a
    Input Text    ${input_name}    hjhjhj1
    Input Password    ${input_pwd}    hjhjhj1
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

    [Return]    ${price_text}

Get Total Price
    ${total_value} =    Get Text    //div[@class="sidewidt"]//table[2]//tr[3]//td[@class="align_right"][2]
    [Return]    ${total_value}



Add Personal Detail and Address of Guest 
    [Arguments]    ${email}
    Input Text    id=guestFrm_firstname    Guest1
    Input Text    id=guestFrm_lastname        Test1
    Input Text    id=guestFrm_email     ${email}
    Input Text    id=guestFrm_address_1    Le Van Luong
    Input Text    id=guestFrm_city    SaiGon
    Select From List By Value    id=guestFrm_country_id    230
    Sleep    3s
    Select From List By Value   id=guestFrm_zone_id    3768
    Input Text    id=guestFrm_postcode    4459302
    

Add New Shipping Address
    Input Text    id=guestFrm_shipping_firstname    Guest2
    Input Text    id=guestFrm_shipping_lastname        Test2
    Input Text    id=guestFrm_shipping_address_1    Tan Binh
    Input Text    id=guestFrm_shipping_city    Dien Bien
    Select From List By Value    id=guestFrm_shipping_country_id    230
    Sleep    2s
    Select From List By Value   id=guestFrm_shipping_zone_id    3777
    Input Text    id=guestFrm_shipping_postcode    2222333
    