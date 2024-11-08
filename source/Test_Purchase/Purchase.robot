*** Settings ***
Library           SeleniumLibrary
Library           Collections
Library    OperatingSystem
Library    String
Library    XML

*** Variables ***
${url}            https://automationteststore.com/
${browser}        chrome
${text}           OUT OF STOCK
${input_name}    id=loginFrm_loginname
${input_pwd}    id=loginFrm_password
${btn_login}         xpath://button[@title="Login"]
${btn_outOfStock}    xpath://span[@class='nostock']
${btn_addToCart}    xpath://span[@class='cart']
${number_item}    xpath=//a[@class="dropdown-toggle"]/span[@class="label label-orange font14"]
${total_item}    xpath=//a[@class="dropdown-toggle"]/span[@class="cart_total"]
${quantity_input}    id=cart_quantity11841f16db428e112176d38819667a1fac1


${url}            https://automationteststore.com/
${browser}        chrome
${url_create}     https://automationteststore.com/index.php?rt=account/create
${url_login}      https://automationteststore.com/index.php?rt=account/login
${url_success}    https://automationteststore.com/index.php?rt=account/success
${url_account}    https://automationteststore.com/index.php?rt=account/account
${SCROLL_SCRIPT}    window.document.evaluate('//*[@id="accountFrm"]/fieldset/button', document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView(true)
${selected_zone_id}    ${EMPTY}

*** Test Cases ***

TC1_Guest buy products to cart in homepage 
    [Tags]    Guest 
    Open homepage and verify cart empty
    # Create list product 
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    ${product_btns}    Create List
    Create List Product    ${product_names}    ${product_prices}    ${product_links}    ${product_btns} 
    ${cart_total}=    Set Variable   0
    ${cart_count}=    Set Variable   0

    # Add 3 product in FEATURED to cart
    FOR    ${index}    IN RANGE    3    5       
        Click Element    css=a.productcart[data-id="${product_btns[${index}]}"]
        Go To     ${product_links[${index}]}
        ${quantity}=    Get Value    id=product_quantity
        ${quantity_int}=    Convert To Integer    ${quantity}
        ${cart_count}=    Evaluate    ${cart_count} + ${quantity_int}
        Wait Until Element Is Visible    xpath=//span[@class="total-price"]
        ${price}=    Get Text    xpath=//span[@class="total-price"]
        ${price}=    Evaluate    "${price}".split('$')[-1]   
        ${price_int}=    Convert To Number    ${price}
        ${cart_total}=    Evaluate    ${cart_total} + ${price_int}
        Go Back
        Check cart item in cart dropdown    ${cart_count}    $${cart_total}
    END
    # Verify product added in cart

    Click Element    xpath=//div[@class="block_7"]//a[@class="dropdown-toggle"]
    ${row_index}=    Set Variable    2
    FOR    ${index}    IN RANGE    3    5  
        ${detail_name}=    Get Text    xpath=//table[@class='table table-striped table-bordered']//tr[${row_index}]//td[2]
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${product_names}[${index}]
        ${detail_price}=    Get Text    xpath=//table[@class='table table-striped table-bordered']//tr[${row_index}]//td[4]
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        ${row_index}=    Evaluate    ${row_index} + 1
    END
    Scroll Element Into View    //div[@class="container-fluid cart_total"]
    Sleep    2s
    ${sub-total}=    Get Text    //*[@id="totals_table"]/tbody/tr[1]/td[2]/span
    Should Be Equal As Strings    ${sub-total}    $${cart_total}0

    Close Browser
    
TC2_Verify Guest buy products and estimate shipping 
    [Tags]    Guest     
    Open homepage and verify cart empty

    # Create list product 
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    ${product_btns}    Create List
    Create List Product    ${product_names}    ${product_prices}    ${product_links}    ${product_btns} 
    ${cart_total}=    Set Variable   0
    ${cart_count}=    Set Variable   0

    # Add 3 product in FEATURED to cart
    FOR    ${index}    IN RANGE    3    5    
        Click Element    css=a.productcart[data-id="${product_btns[${index}]}"]
        Go To     ${product_links[${index}]}
        ${quantity}=    Get Value    id=product_quantity
        ${quantity_int}=    Convert To Integer    ${quantity}
        ${cart_count}=    Evaluate    ${cart_count} + ${quantity_int}
        Wait Until Element Is Visible    xpath=//span[@class="total-price"]
        ${price}=    Get Text    xpath=//span[@class="total-price"]
        ${price}=    Evaluate    "${price}".split('$')[-1]   
        ${price_int}=    Convert To Number    ${price}
        ${cart_total}=    Evaluate    ${cart_total} + ${price_int}
        Go Back
        Check cart item in cart dropdown    ${cart_count}    $${cart_total}
    END
    # Verify product added in cart

    Click Element    xpath=//div[@class="block_7"]//a[@class="dropdown-toggle"]
    ${row_index}=    Set Variable    2
    FOR    ${index}    IN RANGE    3    5   
        ${detail_name}=    Get Text    xpath=//table[@class='table table-striped table-bordered']//tr[${row_index}]//td[2]
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${product_names}[${index}]
        ${detail_price}=    Get Text    xpath=//table[@class='table table-striped table-bordered']//tr[${row_index}]//td[4]
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        ${row_index}=    Evaluate    ${row_index} + 1
    END

    Select Random Option   estimate_country
    Sleep    2s
    Select Random Option    estimate_country_zones
    Input Text    id=estimate_postcode    2243
    Click Element    //button[@title="Estimate"]
    Sleep    4s
    Element Text Should Be    //*[@id="totals_table"]/tbody/tr[2]/td[2]/span       $2.00
    Close Browser

TC3_Verify Guest buy products and checkout
    [Tags]    Guest 
    Open homepage and verify cart empty

    # Create list product 
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    ${product_btns}    Create List
    Create List Product    ${product_names}    ${product_prices}    ${product_links}    ${product_btns} 
    ${cart_total}=    Set Variable   0
    ${cart_count}=    Set Variable   0

    # Add 3 product in FEATURED to cart
    FOR    ${index}    IN RANGE    3    5    
        Click Element    css=a.productcart[data-id="${product_btns[${index}]}"]
        Go To     ${product_links[${index}]}
        ${quantity}=    Get Value    id=product_quantity
        ${quantity_int}=    Convert To Integer    ${quantity}
        ${cart_count}=    Evaluate    ${cart_count} + ${quantity_int}
        Wait Until Element Is Visible    xpath=//span[@class="total-price"]
        ${price}=    Get Text    xpath=//span[@class="total-price"]
        ${price}=    Evaluate    "${price}".split('$')[-1]   
        ${price_int}=    Convert To Number    ${price}
        ${cart_total}=    Evaluate    ${cart_total} + ${price_int}
        Go Back
        Check cart item in cart dropdown    ${cart_count}    $${cart_total}
    END
    # Verify product added in cart

    Click Element    xpath=//div[@class="block_7"]//a[@class="dropdown-toggle"]
    ${row_index}=    Set Variable    2
    FOR    ${index}    IN RANGE    3    5  
        ${detail_name}=    Get Text    xpath=//table[@class='table table-striped table-bordered']//tr[${row_index}]//td[2]
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${product_names}[${index}]
        ${detail_price}=    Get Text    xpath=//table[@class='table table-striped table-bordered']//tr[${row_index}]//td[4]
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        ${row_index}=    Evaluate    ${row_index} + 1
    END

    Select Random Option   estimate_country
    Sleep    2s
    Select Random Option    estimate_country_zones
    Input Text    id=estimate_postcode    2243
    Click Element    //button[@title="Estimate"]
    Sleep    4s
    Element Text Should Be    //*[@id="totals_table"]/tbody/tr[2]/td[2]/span       $2.00
    
    Click Element    id=cart_checkout2

    Click Element    id=accountFrm_accountguest    
    Click Button    //button[@title="Continue"]

    Add Personal Detail and Address of Guest     guest@gmail.com
    
    #go to checkout confirmation page
    Click Element     //button[@title="Continue"]
    Sleep    2s
    Title Should Be    Checkout Confirmation 
    Scroll Element Into View    //*[@id="maincontainer"]/div/div[1]/div/div[2]/div
    ${total_block}    Get Text    //*[@id="maincontainer"]/div/div[1]/div/div[2]/div/div[1]/table/tbody/tr[3]/td[2]/span

     Click Button    id=checkout_btn
    Sleep    2s
    Title Should Be    Your Order Has Been Processed!
    Check Cart Empty 
    Close Browser

TC4 Verify purchasing process with return cart to remove product in cart 
    [Tags]    Guest 
    Open homepage and verify cart empty
    # Create list product 
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    ${product_btns}    Create List
    Create List Product    ${product_names}    ${product_prices}    ${product_links}    ${product_btns} 
    ${cart_total}=    Set Variable   0
    ${cart_count}=    Set Variable   0

    # Add 3 product in FEATURED to cart
    FOR    ${index}    IN RANGE    3    5    
        Click Element    css=a.productcart[data-id="${product_btns[${index}]}"]
        Go To     ${product_links[${index}]}
        ${quantity}=    Get Value    id=product_quantity
        ${quantity_int}=    Convert To Integer    ${quantity}
        ${cart_count}=    Evaluate    ${cart_count} + ${quantity_int}
        Wait Until Element Is Visible    xpath=//span[@class="total-price"]
        ${price}=    Get Text    xpath=//span[@class="total-price"]
        ${price}=    Evaluate    "${price}".split('$')[-1]   
        ${price_int}=    Convert To Number    ${price}
        ${cart_total}=    Evaluate    ${cart_total} + ${price_int}
        Go Back
        Check cart item in cart dropdown    ${cart_count}    $${cart_total}
    END
    # Verify product added in cart

    Click Element    xpath=//div[@class="block_7"]//a[@class="dropdown-toggle"]
    ${row_index}=    Set Variable    2
    FOR    ${index}    IN RANGE    3    5    
        ${detail_name}=    Get Text    xpath=//table[@class='table table-striped table-bordered']//tr[${row_index}]//td[2]
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${product_names}[${index}]
        ${detail_price}=    Get Text    xpath=//table[@class='table table-striped table-bordered']//tr[${row_index}]//td[4]
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        ${row_index}=    Evaluate    ${row_index} + 1
    END

    
    Click Element    id=cart_checkout1

    Click Element    id=accountFrm_accountguest    
    Click Button    //button[@title="Continue"]

    Add Personal Detail and Address of Guest     guest@gmail.com
    
    #go to checkout confirmation page
    Click Element     //button[@title="Continue"]
    Sleep    2s
    Title Should Be    Checkout Confirmation 
    Click Element    xpath://a[@class="pull-right mr10 btn btn-default btn-xs"]
    #remove 1 product 
     FOR    ${index}    IN RANGE    1
         ${cart_count}    Get Text    ${number_item}
        ${cart_count}    Convert To Integer    ${cart_count}
        Click Element    xpath=//table[@class='table table-striped table-bordered']//tr[2]//td[7]
        Page Should Not Contain    ${product_names}[${index}]
        ${cart_count}    Evaluate    ${cart_count} - 1
        Check number on cart icon    ${cart_count}
    END  

    Click Element    id=cart_checkout1
    
    Click Element    id=accountFrm_accountguest    
    Click Button    //button[@title="Continue"]
    Add Personal Detail and Address of Guest     guest@gmail.com
    
    Click Element    //button[@title="Continue"]
    Sleep    2s
    Title Should Be    Checkout Confirmation
    Scroll Element Into View    //*[@id="maincontainer"]/div/div[1]/div/div[2]/div
    Click Button    id=checkout_btn
    Sleep    2s
    Title Should Be    Your Order Has Been Processed!

    Check Cart Empty 
    Close Browser


TC5 Verify purchasing process with return cart to update quantity in cart 
    [Tags]    Guest
    Open homepage and verify cart empty
    # Create list product 
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    ${product_btns}    Create List
    Create List Product    ${product_names}    ${product_prices}    ${product_links}    ${product_btns} 
    ${cart_total}=    Set Variable   0
    ${cart_count}=    Set Variable   0

    # Add 3 product in FEATURED to cart
    FOR    ${index}    IN RANGE    3    5    
        Click Element    css=a.productcart[data-id="${product_btns[${index}]}"]
        Go To     ${product_links[${index}]}
        ${quantity}=    Get Value    id=product_quantity
        ${quantity_int}=    Convert To Integer    ${quantity}
        ${cart_count}=    Evaluate    ${cart_count} + ${quantity_int}
        Wait Until Element Is Visible    xpath=//span[@class="total-price"]
        ${price}=    Get Text    xpath=//span[@class="total-price"]
        ${price}=    Evaluate    "${price}".split('$')[-1]   
        ${price_int}=    Convert To Number    ${price}
        ${cart_total}=    Evaluate    ${cart_total} + ${price_int}
        Go Back
        Check cart item in cart dropdown    ${cart_count}    $${cart_total}
    END
    #go to cart
    Click Element    xpath=//div[@class="block_7"]//a[@class="dropdown-toggle"]
    Click Element    id=cart_checkout1
    #go to login page
    Click Element    id=accountFrm_accountguest    
    Click Button    //button[@title="Continue"]

    Add Personal Detail and Address of Guest     guest@gmail.com
    
    #go to checkout confirmation page
    Click Element     //button[@title="Continue"]
    Sleep    2s
    Title Should Be    Checkout Confirmation 
    Click Element    xpath://a[@class="pull-right mr10 btn btn-default btn-xs"]
    # Edit quantity > 1 in cart
    ${row_index}=    Set Variable    2
    FOR    ${index}    IN RANGE    2
        Input Text    xpath=/html/body/div/div[2]/div/div/div/form/div/div[1]/table/tbody/tr[${row_index}]/td[5]/div/input   2
        ${row_index}=    Evaluate    ${row_index} + 1
    END  

    Click Button    id=cart_update
    
    Scroll Element Into View        //div[@class="container-fluid cart_total"]
    Sleep    3s
    ${total_in_cart}=    Get Text    //span[@class="bold totalamout"]
    Click Element    id=cart_checkout2
    
    Click Element    id=accountFrm_accountguest    
    Click Button    //button[@title="Continue"]
    Add Personal Detail and Address of Guest     guest@gmail.com
    
    Click Element     //button[@title="Continue"]
    Sleep    2s

    ${total_block}    Get Text    //span[@class="bold totalamout"]
    Log    ${total_block}
    Should Be Equal As Strings    ${total_block}    ${total_in_cart}
    
    Click Button    id=checkout_btn
    Sleep    2s
    Title Should Be    Your Order Has Been Processed!

    Check Cart Empty 
    Close Browser
TC6 Verify the purchasing process that adds products of multiple categories
     [Tags]    Guest 
    Open homepage and verify cart empty
    Element Should Be Visible    id=categorymenu

     #SHOES
     Click Link    xpath://ul[@class="nav-pills categorymenu"]/li[2]/a
    Click Link    xpath://ul[@class="thumbnails row"]/li[1]/div/a
    Element Text Should Be    //h1[@class='heading1']    SHOES
    # Create list product 
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    ${product_btns}    Create List
    Create List Product    ${product_names}    ${product_prices}    ${product_links}    ${product_btns} 
    ${cart_total}=    Set Variable   0
    ${cart_count}=    Set Variable   0
    FOR    ${index}    IN RANGE    1
        Go To     ${product_links[${index}]}
        ${quantity}=    Get Value    id=product_quantity
        ${quantity_int}=    Convert To Integer    ${quantity}
        ${cart_count}=    Evaluate    ${cart_count} + ${quantity_int}
        ${contains_input}=    Run Keyword And Return Status   Page Should Contain Element    xpath://div[@class="quantitybox"]//input[@type='radio']
        Run Keyword If    ${contains_input}    Select Random Radio Input
        Click Element    xpath=//ul[@class="productpagecart"]//a[@class="cart"]
        Go Back
        Go Back
    END
    Sleep    5s
    #BUY LIPS
    Click Link    xpath://ul[@class="nav-pills categorymenu"]/li[3]/a
    Click Link    xpath://ul[@class="thumbnails row"]/li[4]/div/a
    Element Text Should Be    //h1[@class='heading1']    LIPS
     # Create list product 
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    ${product_btns2}    Create List
    Create List Product    ${product_names}    ${product_prices}    ${product_links}    ${product_btns2} 
    FOR    ${index}    IN RANGE    ${product_btns2.__len__()}
        Go To     ${product_links[${index}]}
        ${quantity}=    Get Value    id=product_quantity
        ${quantity_int}=    Convert To Integer    ${quantity}
        ${cart_count}=    Evaluate    ${cart_count} + ${quantity_int}
        ${contains_input}=    Run Keyword And Return Status   Page Should Contain Element    xpath://div[@class="quantitybox"]//input[@type='radio']
        Run Keyword If    ${contains_input}    Select Random Radio Input
        Click Element    xpath=//ul[@class="productpagecart"]//a[@class="cart"]
        
        Go Back
        Go Back
    END
    Check number on cart icon   ${cart_count}
     Click Element    xpath=//div[@class="block_7"]//a[@class="dropdown-toggle"]

    Click Element    id=cart_checkout1

    Click Element    id=accountFrm_accountguest    
    Click Button    //button[@title="Continue"]

    Add Personal Detail and Address of Guest     guest@gmail.com
    
    #go to checkout confirmation page
    Click Element     //button[@title="Continue"]
    Sleep    2s
    Title Should Be    Checkout Confirmation 

    Click Button    id=checkout_btn
    Sleep    2s
    Title Should Be    Your Order Has Been Processed!
    Check Cart Empty 

    Close Browser
TC7 Check guest buy more MEN-Skincare products of the same type and checkout success
    [Tags]    Guest 
    Open homepage and verify cart empty
    Element Should Be Visible    id=categorymenu
    Click Link    xpath://ul[@class="nav-pills categorymenu"]/li[5]/a
    Click Link    xpath://ul[@class="thumbnails row"]/li[1]/div/a
    Element Text Should Be    //h1[@class='heading1']    MEN
    
     # Create list product 
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    ${product_btns}    Create List
    Create List Product    ${product_names}    ${product_prices}    ${product_links}    ${product_btns} 
    ${cart_total}=    Set Variable   0
    ${cart_count}=    Set Variable   0

    # Add product in FEATURED to cart
    FOR    ${index}    IN RANGE    1    3
        Go To     ${product_links[${index}]}
        ${quantity}=    Get Value    id=product_quantity
        ${quantity_int}=    Convert To Integer    ${quantity}
        ${cart_count}=    Evaluate    ${cart_count} + ${quantity_int}
        Wait Until Element Is Visible    xpath=//span[@class="total-price"]
        ${price}=    Get Text    xpath=//span[@class="total-price"]
        ${price}=    Evaluate    "${price}".split('$')[-1]   
        ${price_int}=    Convert To Number    ${price}
        ${cart_total}=    Evaluate    ${cart_total} + ${price_int}
        ${contains_input}=    Run Keyword And Return Status   Page Should Contain Element    xpath://div[@class="quantitybox"]//input[@type='radio']
        Run Keyword If    ${contains_input}    Select Random Radio Input
        Click Element    xpath=//ul[@class="productpagecart"]//a[@class="cart"]
        Check cart item in cart dropdown    ${cart_count}    $${cart_total}
        Go Back
        Go Back
    END

    # Verify product added in cart
    Click Element    xpath=//div[@class="block_7"]//a[@class="dropdown-toggle"]
    ${row_index}=    Set Variable    2
    FOR    ${index}    IN RANGE    1    3
            ${detail_name}=    Get Text    xpath=//table[@class='table table-striped table-bordered']//tr[${row_index}]//td[2]
            ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
            Should Contain    ${detail_name_uppercase}    ${product_names}[${index}]
            ${detail_price}=    Get Text    xpath=//table[@class='table table-striped table-bordered']//tr[${row_index}]//td[4]
            Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
            ${row_index}=    Evaluate    ${row_index} + 1
    END

    ##add product same type
    Click Link    xpath://ul[@class="nav-pills categorymenu"]/li[5]/a
    Click Link    xpath://ul[@class="thumbnails row"]/li[1]/div/a
    Element Text Should Be    //h1[@class='heading1']    MEN


      # Add product in FEATURED to cart
    FOR    ${index}    IN RANGE    3    5
        Go To     ${product_links[${index}]}
        ${quantity}=    Get Value    id=product_quantity
        ${quantity_int}=    Convert To Integer    ${quantity}
        ${cart_count}=    Evaluate    ${cart_count} + ${quantity_int}
        Wait Until Element Is Visible    xpath=//span[@class="total-price"]
        ${price}=    Get Text    xpath=//span[@class="total-price"]
        ${price}=    Evaluate    "${price}".split('$')[-1]   
        ${price_int}=    Convert To Number    ${price}
        ${cart_total}=    Evaluate    ${cart_total} + ${price_int}
        ${contains_input}=    Run Keyword And Return Status   Page Should Contain Element    xpath://div[@class="quantitybox"]//input[@type='radio']
        Run Keyword If    ${contains_input}    Select Random Radio Input
        Click Element    xpath=//ul[@class="productpagecart"]//a[@class="cart"]
        Check cart item in cart dropdown    ${cart_count}    $${cart_total}
        Go Back
        Go Back
    END

    
    # Verify product added in cart
    Click Element    xpath=//div[@class="block_7"]//a[@class="dropdown-toggle"]
    ${row_index}=    Set Variable    2
    FOR    ${index}    IN RANGE   1    5
            ${detail_name}=    Get Text    xpath=//table[@class='table table-striped table-bordered']//tr[${row_index}]//td[2]
            ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
            Should Contain    ${detail_name_uppercase}    ${product_names}[${index}]
            ${detail_price}=    Get Text    xpath=//table[@class='table table-striped table-bordered']//tr[${row_index}]//td[4]
            Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
            ${row_index}=    Evaluate    ${row_index} + 1
    END

    Scroll Element Into View        //div[@class="container-fluid cart_total"]
    Sleep    3s

    Click Element    id=cart_checkout2

    Click Element    id=accountFrm_accountguest    
    Click Button    //button[@title="Continue"]

    Add Personal Detail and Address of Guest     guest@gmail.com
    
    #go to checkout confirmation page
    Click Element     //button[@title="Continue"]
    Sleep    2s
    Title Should Be    Checkout Confirmation 

     Click Button    id=checkout_btn
    Sleep    2s
    Title Should Be    Your Order Has Been Processed!
    Check Cart Empty 

    Close Browser
TC8 Check guest add more products of the different type and checkout success
    [Tags]    Guest 
    Open homepage and verify cart empty
    Element Should Be Visible    id=categorymenu
    Click Link    xpath://ul[@class="nav-pills categorymenu"]/li[5]/a
    Click Link    xpath://ul[@class="thumbnails row"]/li[1]/div/a
    Element Text Should Be    //h1[@class='heading1']    MEN
    
     # Create list product 
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    ${product_btns}    Create List
    Create List Product    ${product_names}    ${product_prices}    ${product_links}    ${product_btns} 
    ${cart_total}=    Set Variable   0
    ${cart_count}=    Set Variable   0

    # Add product in FEATURED to cart
    FOR    ${index}    IN RANGE    1    3
        Go To     ${product_links[${index}]}
        ${quantity}=    Get Value    id=product_quantity
        ${quantity_int}=    Convert To Integer    ${quantity}
        ${cart_count}=    Evaluate    ${cart_count} + ${quantity_int}
        Wait Until Element Is Visible    xpath=//span[@class="total-price"]
        ${price}=    Get Text    xpath=//span[@class="total-price"]
        ${price}=    Evaluate    "${price}".split('$')[-1]   
        ${price_int}=    Convert To Number    ${price}
        ${cart_total}=    Evaluate    ${cart_total} + ${price_int}
        ${contains_input}=    Run Keyword And Return Status   Page Should Contain Element    xpath://div[@class="quantitybox"]//input[@type='radio']
        Run Keyword If    ${contains_input}    Select Random Radio Input
        Click Element    xpath=//ul[@class="productpagecart"]//a[@class="cart"]
        Check cart item in cart dropdown    ${cart_count}    $${cart_total}
        Go Back
        Go Back
    END

    # Verify product added in cart
    Click Element    xpath=//div[@class="block_7"]//a[@class="dropdown-toggle"]
    ${row_index}=    Set Variable    2
    FOR    ${index}    IN RANGE    1    3
            ${detail_name}=    Get Text    xpath=//table[@class='table table-striped table-bordered']//tr[${row_index}]//td[2]
            ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
            Should Contain    ${detail_name_uppercase}    ${product_names}[${index}]
            ${detail_price}=    Get Text    xpath=//table[@class='table table-striped table-bordered']//tr[${row_index}]//td[4]
            Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
            ${row_index}=    Evaluate    ${row_index} + 1
    END

    ##add product other type
    Click Link    xpath://ul[@class="nav-pills categorymenu"]/li[7]/a
    Click Link    xpath://ul[@class="thumbnails row"]/li[1]/div/a
    Element Text Should Be    //h1[@class='heading1']    CONDITIONER


      # Add product in FEATURED to cart
    FOR    ${index}    IN RANGE    3    5
        Go To     ${product_links[${index}]}
        ${quantity}=    Get Value    id=product_quantity
        ${quantity_int}=    Convert To Integer    ${quantity}
        ${cart_count}=    Evaluate    ${cart_count} + ${quantity_int}
        Wait Until Element Is Visible    xpath=//span[@class="total-price"]
        ${price}=    Get Text    xpath=//span[@class="total-price"]
        ${price}=    Evaluate    "${price}".split('$')[-1]   
        ${price_int}=    Convert To Number    ${price}
        ${cart_total}=    Evaluate    ${cart_total} + ${price_int}
        ${contains_input}=    Run Keyword And Return Status   Page Should Contain Element    xpath://div[@class="quantitybox"]//input[@type='radio']
        Run Keyword If    ${contains_input}    Select Random Radio Input
        Click Element    xpath=//ul[@class="productpagecart"]//a[@class="cart"]
        Check cart item in cart dropdown    ${cart_count}    $${cart_total}
        Go Back
        Go Back
   END
    # Verify product added in cart
    Click Element    xpath=//div[@class="block_7"]//a[@class="dropdown-toggle"]
    ${row_index}=    Set Variable    2
    FOR    ${index}    IN RANGE   1    5
            ${detail_name}=    Get Text    xpath=//table[@class='table table-striped table-bordered']//tr[${row_index}]//td[2]
            ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
            Should Contain    ${detail_name_uppercase}    ${product_names}[${index}]
            ${detail_price}=    Get Text    xpath=//table[@class='table table-striped table-bordered']//tr[${row_index}]//td[4]
            Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
            ${row_index}=    Evaluate    ${row_index} + 1
    END
    Scroll Element Into View        //div[@class="container-fluid cart_total"]
    Sleep    3s

    Click Element    id=cart_checkout2

    Click Element    id=accountFrm_accountguest    
    Click Button    //button[@title="Continue"]

    Add Personal Detail and Address of Guest     guest@gmail.com
    
    #go to checkout confirmation page
    Click Element     //button[@title="Continue"]
    Sleep    2s
    Title Should Be    Checkout Confirmation 

     Click Button    id=checkout_btn
    Sleep    2s
    Title Should Be    Your Order Has Been Processed!
    Check Cart Empty 
   Close Browser
TC9 Check apply invalid coupon in cart 
    [Tags]    Guest 
    Open homepage and verify cart empty
    Element Should Be Visible    id=categorymenu
    Add product
    # Verify product added in cart
    Click Element    xpath=//div[@class="block_7"]//a[@class="dropdown-toggle"]
    Input Text    id=coupon_coupon    gjfkgfdgf
    Click Button    id=apply_coupon_btn
    Wait Until Element Contains    xpath://div[@class="alert alert-error alert-danger"]    Error: Coupon is either invalid, expired or reached it's usage limit!
    Close Browser
TC10 User buy 3 product to cart in homepage 
    [Tags]     Logged
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Login 
    Clear Cart 
    Click Element    //a[@class="active menu_home"]     
   # Create list product 
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    ${product_btns}    Create List
    Create List Product    ${product_names}    ${product_prices}    ${product_links}    ${product_btns} 
    ${cart_total}=    Set Variable   0
    ${cart_count}=    Set Variable   0

    # Add product in FEATURED to cart
    FOR    ${index}    IN RANGE    3
        Go To     ${product_links[${index}]}
        ${quantity}=    Get Value    id=product_quantity
        ${quantity_int}=    Convert To Integer    ${quantity}
        ${cart_count}=    Evaluate    ${cart_count} + ${quantity_int}
        Wait Until Element Is Visible    xpath=//span[@class="total-price"]
        ${price}=    Get Text    xpath=//span[@class="total-price"]
        ${price}=    Evaluate    "${price}".split('$')[-1]   
        ${price_int}=    Convert To Number    ${price}
        ${cart_total}=    Evaluate    ${cart_total} + ${price_int}
        Click Element    xpath=//ul[@class="productpagecart"]//a[@class="cart"]
        Check cart item in cart dropdown    ${cart_count}    $${cart_total}
        Go Back
        Go Back
    END

    # Verify product added in cart
    Click Element    xpath=//div[@class="block_7"]//a[@class="dropdown-toggle"]
    ${row_index}=    Set Variable    2
    FOR    ${index}    IN RANGE    3
        ${detail_name}=    Get Text    xpath=//table[@class='table table-striped table-bordered']//tr[${row_index}]//td[2]
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Contain    ${detail_name_uppercase}    ${product_names}[${index}]
        ${detail_price}=    Get Text    xpath=//table[@class='table table-striped table-bordered']//tr[${row_index}]//td[4]
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        ${row_index}=    Evaluate    ${row_index} + 1
    END
    Scroll Element Into View    //div[@class="container-fluid cart_total"]
    Sleep    2s
    ${sub-total}=    Get Text    //table[@id="totals_table"]//tr[1]//td[2]
     Should Be Equal As Strings    ${sub-total}    $${cart_total}0

    Close Browser
TC11 Verify purchasing process with return cart to update product in cart 
    [Tags]    Logged
    Open homepage and verify cart empty
    Maximize Browser Window
    Login 
    Clear Cart 
    Click Element    //a[@class="active menu_home"]    
    # Create list product 
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    ${product_btns}    Create List
    Create List Product    ${product_names}    ${product_prices}    ${product_links}    ${product_btns} 
    ${cart_total}=    Set Variable   0
    ${cart_count}=    Set Variable   0

    # Add 3 product in FEATURED to cart
    FOR    ${index}    IN RANGE    3    5   
        Click Element    css=a.productcart[data-id="${product_btns[${index}]}"]
        Go To     ${product_links[${index}]}
        ${quantity}=    Get Value    id=product_quantity
        ${quantity_int}=    Convert To Integer    ${quantity}
        ${cart_count}=    Evaluate    ${cart_count} + ${quantity_int}
        Wait Until Element Is Visible    xpath=//span[@class="total-price"]
        ${price}=    Get Text    xpath=//span[@class="total-price"]
        ${price}=    Evaluate    "${price}".split('$')[-1]   
        ${price_int}=    Convert To Number    ${price}
        ${cart_total}=    Evaluate    ${cart_total} + ${price_int}
        Go Back
        Check cart item in cart dropdown    ${cart_count}    $${cart_total}
    END
    #go to cart
    Click Element    xpath=//div[@class="block_7"]//a[@class="dropdown-toggle"]
    Click Element    id=cart_checkout1

    
    #go to checkout confirmation page
    Sleep    2s
    Title Should Be    Checkout Confirmation 
    Click Element    xpath://a[@class="pull-right mr10 btn btn-default btn-xs"]
    # Edit quantity > 1 in cart
    ${row_index}=    Set Variable    2
    FOR    ${index}    IN RANGE    2
        Input Text    xpath=/html/body/div/div[2]/div/div/div/form/div/div[1]/table/tbody/tr[${row_index}]/td[5]/div/input   2
        ${row_index}=    Evaluate    ${row_index} + 1
    END  

    Click Button    id=cart_update
    
    Scroll Element Into View        //div[@class="container-fluid cart_total"]
    Click Element    id=cart_checkout2
    Sleep    2s
    Click Button    id=checkout_btn
    Sleep    2s
    Title Should Be    Your Order Has Been Processed!
    Check Cart Empty 
    Close Browser

TC12 Verify cart saving after logging out
     [Tags]     Logged
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Login 
    Clear Cart 
    Click Element    //a[@class="active menu_home"]    
    Add product
    ${quantity_before}=    Get Cart Quantity

        #logout
    Mouse Over    id=customer_menu_top
    Click Element     //*[@id="customer_menu_top"]/li/ul/li[10]/a
    Title Should Be    Account Logout

    Click Element    //a[@title="Continue"]
    Login 
     ${quantity_after}=    Get Cart Quantity
    Should Be Equal As Strings    ${quantity_before}    ${quantity_after}
    # Verify product added in cart
   
    Close Browser
TC13 Verify purchasing process with return cart to remove product in cart 
    [Tags]    Logged
    Open homepage and verify cart empty
    Maximize Browser Window
    Login 
    Clear Cart 
    Click Element    //a[@class="active menu_home"]    
   
    # Create list product 
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    ${product_btns}    Create List
    Create List Product    ${product_names}    ${product_prices}    ${product_links}    ${product_btns} 
    ${cart_total}=    Set Variable   0
    ${cart_count}=    Set Variable   0 

    # Add 3 product in FEATURED to cart
    FOR    ${index}    IN RANGE    3    5    
        Click Element    css=a.productcart[data-id="${product_btns[${index}]}"]
        Go To     ${product_links[${index}]}
        ${quantity}=    Get Value    id=product_quantity
        ${quantity_int}=    Convert To Integer    ${quantity}
        ${cart_count}=    Evaluate    ${cart_count} + ${quantity_int}
        Wait Until Element Is Visible    xpath=//span[@class="total-price"]
        ${price}=    Get Text    xpath=//span[@class="total-price"]
        ${price}=    Evaluate    "${price}".split('$')[-1]   
        ${price_int}=    Convert To Number    ${price}
        ${cart_total}=    Evaluate    ${cart_total} + ${price_int}
        Go Back
        Check cart item in cart dropdown    ${cart_count}    $${cart_total}
    END
    # Verify product added in cart
    Check number on cart icon    ${cart_count}

    Click Element    xpath=//div[@class="block_7"]//a[@class="dropdown-toggle"]
    ${row_index}=    Set Variable    2
    FOR    ${index}    IN RANGE    3    5    
        ${detail_name}=    Get Text    xpath=//table[@class='table table-striped table-bordered']//tr[${row_index}]//td[2]
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${product_names}[${index}]
        ${detail_price}=    Get Text    xpath=//table[@class='table table-striped table-bordered']//tr[${row_index}]//td[4]
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        ${row_index}=    Evaluate    ${row_index} + 1
    END

    
    Click Element    id=cart_checkout1
    #go to checkout confirmation page
  
    Sleep    2s
    Title Should Be    Checkout Confirmation 
    Click Element    xpath://a[@class="pull-right mr10 btn btn-default btn-xs"]
    #remove 1 product 
     FOR    ${index}    IN RANGE    1
         ${cart_count}    Get Text    ${number_item}
        ${cart_count}    Convert To Integer    ${cart_count}
        Click Element    xpath=//table[@class='table table-striped table-bordered']//tr[2]//td[7]
        Page Should Not Contain    ${product_names}[${index}]
        ${cart_count}    Evaluate    ${cart_count} - 1
        Check number on cart icon    ${cart_count}
    END  
   
    Click Element    id=cart_checkout1
    Sleep    2s
    Click Button    id=checkout_btn
    Sleep    3s
    Title Should Be    Your Order Has Been Processed!
    Check Cart Empty 
    Close Browser
TC14 Verify the purchasing process that adds products of multiple categories
    [Tags]    Logged
    Open homepage and verify cart empty
    Maximize Browser Window
    Login 
    Clear Cart 
    Click Element    //a[@class="active menu_home"]   
     #SHOES
     Click Link    xpath://ul[@class="nav-pills categorymenu"]/li[2]/a
    Click Link    xpath://ul[@class="thumbnails row"]/li[1]/div/a
    Element Text Should Be    //h1[@class='heading1']    SHOES
    # Create list product 
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    ${product_btns}    Create List
    Create List Product    ${product_names}    ${product_prices}    ${product_links}    ${product_btns} 
    ${cart_total}=    Set Variable   0
    ${cart_count}=    Set Variable   0
    FOR    ${index}    IN RANGE    1
        Go To     ${product_links[${index}]}
        ${quantity}=    Get Value    id=product_quantity
        ${quantity_int}=    Convert To Integer    ${quantity}
        ${cart_count}=    Evaluate    ${cart_count} + ${quantity_int}
        ${contains_input}=    Run Keyword And Return Status   Page Should Contain Element    xpath://div[@class="quantitybox"]//input[@type='radio']
        Run Keyword If    ${contains_input}    Select Random Radio Input
        Click Element    xpath=//ul[@class="productpagecart"]//a[@class="cart"]
        Go Back
        Go Back
    END
    Sleep    5s
    #BUY LIPS
    Click Link    xpath://ul[@class="nav-pills categorymenu"]/li[3]/a
    Click Link    xpath://ul[@class="thumbnails row"]/li[4]/div/a
    Element Text Should Be    //h1[@class='heading1']    LIPS
     # Create list product 
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    ${product_btns2}    Create List
    Create List Product    ${product_names}    ${product_prices}    ${product_links}    ${product_btns2} 
    FOR    ${index}    IN RANGE    ${product_btns2.__len__()}
        Go To     ${product_links[${index}]}
        ${quantity}=    Get Value    id=product_quantity
        ${quantity_int}=    Convert To Integer    ${quantity}
        ${cart_count}=    Evaluate    ${cart_count} + ${quantity_int}
        ${contains_input}=    Run Keyword And Return Status   Page Should Contain Element    xpath://div[@class="quantitybox"]//input[@type='radio']
        Run Keyword If    ${contains_input}    Select Random Radio Input
        Click Element    xpath=//ul[@class="productpagecart"]//a[@class="cart"]
        
        Go Back
        Go Back
    END
    Check number on cart icon   ${cart_count}
     Click Element    xpath=//div[@class="block_7"]//a[@class="dropdown-toggle"]

    Click Element    id=cart_checkout1
    Title Should Be    Checkout Confirmation
    Click Button    id=checkout_btn
    Sleep    2s
    Title Should Be    Your Order Has Been Processed!
    Check Cart Empty 

    Close Browser
TC15 Check guest buy more MEN-Skincare products of the same type and checkout success
    [Tags]    Logged
    Open homepage and verify cart empty
    Maximize Browser Window
    Login 
    Clear Cart 
    Click Element    //a[@class="active menu_home"]    
    Element Should Be Visible    id=categorymenu
    Click Link    xpath://ul[@class="nav-pills categorymenu"]/li[5]/a
    Click Link    xpath://ul[@class="thumbnails row"]/li[1]/div/a
    Element Text Should Be    //h1[@class='heading1']    MEN
    
     # Create list product 
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    ${product_btns}    Create List
    Create List Product    ${product_names}    ${product_prices}    ${product_links}    ${product_btns} 
    ${cart_total}=    Set Variable   0
    ${cart_count}=    Set Variable   0

    # Add product in FEATURED to cart
    FOR    ${index}    IN RANGE    1    3
        Go To     ${product_links[${index}]}
        ${quantity}=    Get Value    id=product_quantity
        ${quantity_int}=    Convert To Integer    ${quantity}
        ${cart_count}=    Evaluate    ${cart_count} + ${quantity_int}
        Wait Until Element Is Visible    xpath=//span[@class="total-price"]
        ${price}=    Get Text    xpath=//span[@class="total-price"]
        ${price}=    Evaluate    "${price}".split('$')[-1]   
        ${price_int}=    Convert To Number    ${price}
        ${cart_total}=    Evaluate    ${cart_total} + ${price_int}
        ${contains_input}=    Run Keyword And Return Status   Page Should Contain Element    xpath://div[@class="quantitybox"]//input[@type='radio']
        Run Keyword If    ${contains_input}    Select Random Radio Input
        Click Element    xpath=//ul[@class="productpagecart"]//a[@class="cart"]
        Check cart item in cart dropdown    ${cart_count}    $${cart_total}
        Go Back
        Go Back
    END

    # Verify product added in cart
    Click Element    xpath=//div[@class="block_7"]//a[@class="dropdown-toggle"]
    ${row_index}=    Set Variable    2
    FOR    ${index}    IN RANGE    1    3
            ${detail_name}=    Get Text    xpath=//table[@class='table table-striped table-bordered']//tr[${row_index}]//td[2]
            ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
            Should Contain    ${detail_name_uppercase}    ${product_names}[${index}]
            ${detail_price}=    Get Text    xpath=//table[@class='table table-striped table-bordered']//tr[${row_index}]//td[4]
            Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
            ${row_index}=    Evaluate    ${row_index} + 1
    END

    ##add product same type
    Click Link    xpath://ul[@class="nav-pills categorymenu"]/li[5]/a
    Click Link    xpath://ul[@class="thumbnails row"]/li[1]/div/a
    Element Text Should Be    //h1[@class='heading1']    MEN


      # Add product in FEATURED to cart
    FOR    ${index}    IN RANGE    3    5
        Go To     ${product_links[${index}]}
        ${quantity}=    Get Value    id=product_quantity
        ${quantity_int}=    Convert To Integer    ${quantity}
        ${cart_count}=    Evaluate    ${cart_count} + ${quantity_int}
        Wait Until Element Is Visible    xpath=//span[@class="total-price"]
        ${price}=    Get Text    xpath=//span[@class="total-price"]
        ${price}=    Evaluate    "${price}".split('$')[-1]   
        ${price_int}=    Convert To Number    ${price}
        ${cart_total}=    Evaluate    ${cart_total} + ${price_int}
        ${contains_input}=    Run Keyword And Return Status   Page Should Contain Element    xpath://div[@class="quantitybox"]//input[@type='radio']
        Run Keyword If    ${contains_input}    Select Random Radio Input
        Click Element    xpath=//ul[@class="productpagecart"]//a[@class="cart"]
        Check cart item in cart dropdown    ${cart_count}    $${cart_total}
        Go Back
        Go Back
    END

    
    # Verify product added in cart
    Click Element    xpath=//div[@class="block_7"]//a[@class="dropdown-toggle"]
    ${row_index}=    Set Variable    2
    FOR    ${index}    IN RANGE   1    5
            ${detail_name}=    Get Text    xpath=//table[@class='table table-striped table-bordered']//tr[${row_index}]//td[2]
            ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
            Should Contain    ${detail_name_uppercase}    ${product_names}[${index}]
            ${detail_price}=    Get Text    xpath=//table[@class='table table-striped table-bordered']//tr[${row_index}]//td[4]
            Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
            ${row_index}=    Evaluate    ${row_index} + 1
    END

    Scroll Element Into View        //div[@class="container-fluid cart_total"]
    Sleep    3s

    Click Element    id=cart_checkout2

    Sleep    2s
    Title Should Be    Checkout Confirmation 

     Click Button    id=checkout_btn
    Sleep    2s
    Title Should Be    Your Order Has Been Processed!

    Check Cart Empty 
    Close Browser
TC16 Check guest buy more products of the different type and checkout success
    [Tags]    Logged
    Open homepage and verify cart empty
    Maximize Browser Window
    Login 
    Clear Cart 
    Click Element    //a[@class="active menu_home"]    
    Element Should Be Visible    id=categorymenu
    Click Link    xpath://ul[@class="nav-pills categorymenu"]/li[5]/a
    Click Link    xpath://ul[@class="thumbnails row"]/li[1]/div/a
    Element Text Should Be    //h1[@class='heading1']    MEN
    
     # Create list product 
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    ${product_btns}    Create List
    Create List Product    ${product_names}    ${product_prices}    ${product_links}    ${product_btns} 
    ${cart_total}=    Set Variable   0
    ${cart_count}=    Set Variable   0

    # Add product in FEATURED to cart
    FOR    ${index}    IN RANGE    1    3
        Go To     ${product_links[${index}]}
        ${quantity}=    Get Value    id=product_quantity
        ${quantity_int}=    Convert To Integer    ${quantity}
        ${cart_count}=    Evaluate    ${cart_count} + ${quantity_int}
        Wait Until Element Is Visible    xpath=//span[@class="total-price"]
        ${price}=    Get Text    xpath=//span[@class="total-price"]
        ${price}=    Evaluate    "${price}".split('$')[-1]   
        ${price_int}=    Convert To Number    ${price}
        ${cart_total}=    Evaluate    ${cart_total} + ${price_int}
        ${contains_input}=    Run Keyword And Return Status   Page Should Contain Element    xpath://div[@class="quantitybox"]//input[@type='radio']
        Run Keyword If    ${contains_input}    Select Random Radio Input
        Click Element    xpath=//ul[@class="productpagecart"]//a[@class="cart"]
        Check cart item in cart dropdown    ${cart_count}    $${cart_total}
        Go Back
        Go Back
    END

    # Verify product added in cart
    Click Element    xpath=//div[@class="block_7"]//a[@class="dropdown-toggle"]
    ${row_index}=    Set Variable    2
    FOR    ${index}    IN RANGE    1    3
            ${detail_name}=    Get Text    xpath=//table[@class='table table-striped table-bordered']//tr[${row_index}]//td[2]
            ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
            Should Contain    ${detail_name_uppercase}    ${product_names}[${index}]
            ${detail_price}=    Get Text    xpath=//table[@class='table table-striped table-bordered']//tr[${row_index}]//td[4]
            Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
            ${row_index}=    Evaluate    ${row_index} + 1
    END

    ##add product other type
    Click Link    xpath://ul[@class="nav-pills categorymenu"]/li[7]/a
    Click Link    xpath://ul[@class="thumbnails row"]/li[1]/div/a
    Element Text Should Be    //h1[@class='heading1']    CONDITIONER


      # Add product in FEATURED to cart
    FOR    ${index}    IN RANGE    3    5
        Go To     ${product_links[${index}]}
        ${quantity}=    Get Value    id=product_quantity
        ${quantity_int}=    Convert To Integer    ${quantity}
        ${cart_count}=    Evaluate    ${cart_count} + ${quantity_int}
        Wait Until Element Is Visible    xpath=//span[@class="total-price"]
        ${price}=    Get Text    xpath=//span[@class="total-price"]
        ${price}=    Evaluate    "${price}".split('$')[-1]   
        ${price_int}=    Convert To Number    ${price}
        ${cart_total}=    Evaluate    ${cart_total} + ${price_int}
        ${contains_input}=    Run Keyword And Return Status   Page Should Contain Element    xpath://div[@class="quantitybox"]//input[@type='radio']
        Run Keyword If    ${contains_input}    Select Random Radio Input
        Click Element    xpath=//ul[@class="productpagecart"]//a[@class="cart"]
        Check cart item in cart dropdown    ${cart_count}    $${cart_total}
        Go Back
        Go Back
   END
    # Verify product added in cart
    Click Element    xpath=//div[@class="block_7"]//a[@class="dropdown-toggle"]
    ${row_index}=    Set Variable    2
    FOR    ${index}    IN RANGE   1    5
            ${detail_name}=    Get Text    xpath=//table[@class='table table-striped table-bordered']//tr[${row_index}]//td[2]
            ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
            Should Contain    ${detail_name_uppercase}    ${product_names}[${index}]
            ${detail_price}=    Get Text    xpath=//table[@class='table table-striped table-bordered']//tr[${row_index}]//td[4]
            Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
            ${row_index}=    Evaluate    ${row_index} + 1
    END
    Scroll Element Into View        //div[@class="container-fluid cart_total"]
    Sleep    3s

    Click Element    id=cart_checkout2
    Sleep    2s
    Title Should Be    Checkout Confirmation 

     Click Button    id=checkout_btn
    Sleep    2s
    Title Should Be    Your Order Has Been Processed!
    Check Cart Empty 
   Close Browser
TC17 Check apply invalid coupon in cart 
    [Tags]   Logged 
    Open homepage and verify cart empty
    Maximize Browser Window
    Login 
    Clear Cart 
    Click Element    //a[@class="active menu_home"]    
    Element Should Be Visible    id=categorymenu
    Add product
    # Verify product added in cart
    Click Element    xpath=//div[@class="block_7"]//a[@class="dropdown-toggle"]
    Input Text    id=coupon_coupon    gjfkgfdgf
    Click Button    id=apply_coupon_btn
    Wait Until Element Contains    xpath://div[@class="alert alert-error alert-danger"]    Error: Coupon is either invalid, expired or reached it's usage limit!
    Close Browser

*** Keywords ***
Login    
    [Arguments]   
    Click Element    xpath://ul[@id="customer_menu_top"]//a
    Input Text    ${input_name}    trinh123
    Input Password    ${input_pwd}    123123
    Click Button    ${btn_login}
    
Add Personal Detail and Address of Guest 
    [Arguments]    ${email}
    Input Text    id=guestFrm_firstname    Guest1
    Input Text    id=guestFrm_lastname        Test1
    Input Text    id=guestFrm_email     ${email}
    Input Text    id=guestFrm_address_1    Le Van Luong
    Input Text    id=guestFrm_city    SaiGon
    Select From List By Value    id=guestFrm_country_id    230
    Sleep    3s
    Select From List By Value   id=guestFrm_zone_id    3765
    Input Text    id=guestFrm_postcode    4459302
Clear Cart 
    Click Element    //li[@data-id="menu_cart"]

   ${rows}=    Get WebElements    xpath=//table[@class='table table-striped table-bordered']//tr[position()>1]
    ${row_count}=    Get Length    ${rows}
    ${index}=    Set Variable    1
    ${product_removed}=    Run Keyword And Return Status    Element Should Be Visible    //table[@class='table table-striped table-bordered']//tr[position()>1]//td[7]
    WHILE    ${product_removed}
        Click Element    //table[@class='table table-striped table-bordered']//tr[position()>1]//td[7]
       
        ${product_removed}=    Run Keyword And Return Status    Element Should Be Visible    //table[@class='table table-striped table-bordered']//tr[position()>1]//td[7]
    END

    Sleep    2s
    Click Element    //a[@title="Continue"]
Process Price
    [Arguments]    ${price}
    ${processed_price}=    Set Variable    ${price.split("\n")[0]}
    RETURN    ${processed_price}

Create List Product
    [Arguments]    ${product_names}    ${product_prices}    ${product_links}    ${product_btns}
    @{cart_btn}=    Get WebElements    xpath=//div[@class='pricetag jumbotron']
    @{outOfStock}=    Get WebElements    xpath=//div[@class='pricetag jumbotron']
    @{price_elements}=    Get WebElements    xpath=//div[@class='price']
    @{product_elements}=    Get WebElements    xpath=//a[@class='prdocutname']
    FOR    ${i}    IN RANGE    ${outOfStock.__len__()}
        ${product_name}=    Get Text    ${product_elements}[${i}]
        ${product_link}=    Get Element Attribute    ${product_elements}[${i}]    href
        ${product_price}=    Get Text    ${price_elements}[${i}]
        ${processed_price}=    Process Price    ${product_price}
        ${start_string}=    Set Variable    &product_id=
        ${end_string}=    Set Variable    &
        ${product_btn}=    Evaluate    "${product_link}".split("${start_string}")[1].split("${end_string}")[0]
        ${product_stock}=    Get Text    ${outOfStock}[${i}]
        ${contains_text}=    Run Keyword And Return Status    Should Not Contain    ${product_stock}    ${text}
        Run Keyword If    ${contains_text}    Append To Lists    ${product_names}    ${product_prices}    ${product_links}    ${product_btns}    ${product_name}    ${processed_price}    ${product_link}    ${product_btn}
    END

Append To Lists
    [Arguments]    ${product_names}    ${product_prices}    ${product_links}    ${product_btns}    ${name}    ${price}    ${link}    ${btn}
    Append To List    ${product_names}    ${name}
    Append To List    ${product_prices}    ${price}
    Append To List    ${product_links}    ${link}
    Append To List    ${product_btns}    ${btn}

Check number on cart icon
    [Arguments]    ${number}
    ${cart_badge}    Get Text    ${number_item}
    ${cart_badge_num}    Convert To Number    ${cart_badge}
    Should Be Equal As Numbers    ${cart_badge_num}    ${number}
Check cart item in cart dropdown
    [Arguments]    ${item}    ${price}    
    ${item_count}=    Get Text    ${number_item}

    ${cart_total}=    Get Text    ${total_item}
    Should Be Equal As Strings    ${item_count}    ${item}
    Should Contain     ${cart_total}    ${price}

Open homepage and verify cart empty
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Scroll Element Into View    id=block_frame_featured_1769
    Check cart item in cart dropdown    0    $0.00
    Click Element    xpath=//div[@class="block_7"]//a[@class="dropdown-toggle"]
    ${cart_empty}=    Get Text    xpath=//div[@class="contentpanel"]
    Should Contain    ${cart_empty}    Your shopping cart is empty!	
    Click Element    xpath=//a[@title="Continue"]
    
Select Random Radio Input
    ${radio_inputs}=    Get WebElements    xpath://input[@type='radio']
    ${selectable_inputs}=    Create List
    FOR    ${input}    IN    @{radio_inputs}
        ${is_disabled}=    Run Keyword And Return Status    Element Should Be Disabled    ${input}
        Run Keyword If    not ${is_disabled}    Append To List    ${selectable_inputs}    ${input}
    END
    ${random_index}=    Evaluate    random.randint(0, 2)    random
    ${selected_input}=    Get From List    ${selectable_inputs}    ${random_index}
    Click Element    ${selected_input}

Check product in cart
    [Arguments]    ${product_names}    ${product_prices}    ${product_links}    ${product_btns}    ${price_old}    ${quantity_old}
    ${row_index}    Set Variable    2
    FOR    ${index}    IN RANGE    ${product_btns.__len__()}
        ${detail_name}=    Get Text    xpath=//table[@class='table table-striped table-bordered']//tr[${row_index}]//td[2]
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Contain    ${detail_name_uppercase}    ${product_names}[${index}]
        ${total_price}=    Get Text    xpath=//table[@class='table table-striped table-bordered']//tr[${row_index}]//td[6]
        ${total_price}=    Evaluate    "${total_price}".split('$')[-1]   
        ${total_price}=    Convert To Number    ${total_price}
        Append To List    ${price_old}    ${total_price}
        ${quantity}=    Get Value    xpath=/html/body/div/div[2]/div/div/div/form/div/div[1]/table/tbody/tr[${row_index}]/td[5]/div/input
        Append To List    ${quantity_old}    ${quantity}
        ${row_index}=    Evaluate    ${row_index} + 1
    END

Round Number
    [Arguments]    ${number}    ${decimals}
    ${rounded_number}=    Evaluate    round(${number}, ${decimals})    math
    RETURN    ${rounded_number}

Format Number
    [Arguments]    ${number}
    ${formatted_number}=    Replace String    ${number}    .    ,
    RETURN    ${formatted_number}

Select Random Option
    [Arguments]    ${locator}
    ${options}    Get WebElements    xpath=//select[@id="${locator}"]/option
    ${random_index}    Evaluate    random.randint(0, ${options.__len__()} - 1)
    Click Element    xpath=//select[@id="${locator}"]/option[${random_index + 1}]

Check Cart Empty 
    Click Element    //*[@id="main_menu_top"]/li[3]/a
    Page Should Contain    Your shopping cart is empty!
Get Cart Quantity

    ${quantity}=    Get Text     ${number_item} 
    [Return]    ${quantity}
Add product 

 # Create list product 
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    ${product_btns}    Create List
    Create List Product    ${product_names}    ${product_prices}    ${product_links}    ${product_btns} 
    ${cart_total}=    Set Variable   0
    ${cart_count}=    Set Variable   0

    # Add 3 product in FEATURED to cart
    FOR    ${index}    IN RANGE    3    5   
        Click Element    css=a.productcart[data-id="${product_btns[${index}]}"]
        Go To     ${product_links[${index}]}
        ${quantity}=    Get Value    id=product_quantity
        ${quantity_int}=    Convert To Integer    ${quantity}
        ${cart_count}=    Evaluate    ${cart_count} + ${quantity_int}
        Wait Until Element Is Visible    xpath=//span[@class="total-price"]
        ${price}=    Get Text    xpath=//span[@class="total-price"]
        ${price}=    Evaluate    "${price}".split('$')[-1]   
        ${price_int}=    Convert To Number    ${price}
        ${cart_total}=    Evaluate    ${cart_total} + ${price_int}
        Go Back
        Check cart item in cart dropdown    ${cart_count}    $${cart_total}
    END
    # Verify product added in cart

    Click Element    xpath=//div[@class="block_7"]//a[@class="dropdown-toggle"]
    ${row_index}=    Set Variable    2
    FOR    ${index}    IN RANGE    3    5    
        ${detail_name}=    Get Text    xpath=//table[@class='table table-striped table-bordered']//tr[${row_index}]//td[2]
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${product_names}[${index}]
        ${detail_price}=    Get Text    xpath=//table[@class='table table-striped table-bordered']//tr[${row_index}]//td[4]
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        ${row_index}=    Evaluate    ${row_index} + 1
    END
