*** Settings ***
Library           SeleniumLibrary
Library           Collections
Library           OperatingSystem
Library           String

*** Variables ***
${url}            https://automationteststore.com/
${browser}        chrome
${text}           OUT OF STOCK
${btn_outOfStock}    xpath://span[@class='nostock']
${btn_addToCart}    xpath://span[@class='cart']
${number_item}    xpath=//a[@class="dropdown-toggle"]/span[@class="label label-orange font14"]
${total_item}     xpath=//a[@class="dropdown-toggle"]/span[@class="cart_total"]
${quantity_input}    id=cart_quantity11841f16db428e112176d38819667a1fac1

*** Test Cases ***
TC1_Guest add product FEATURED to cart in product detail and verify
    Open homepage and verify cart empty
    # Create list product
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    ${product_btns}    Create List
    Create List Product    ${product_names}    ${product_prices}    ${product_links}    ${product_btns}
    ${cart_total}=    Set Variable     0
    ${cart_count}=    Set Variable     0
    # Add product in FEATURED to cart
    FOR    ${index}    IN RANGE    3
        Go To    ${product_links[${index}]}
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
    Close Browser

TC2_Guest add product LATEST PRODUCTS to cart in homepage and verify
    Open homepage and verify cart empty
    # Create list product
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    ${product_btns}    Create List
    Create List Product    ${product_names}    ${product_prices}    ${product_links}    ${product_btns}
    ${cart_total}=    Set Variable     0
    ${cart_count}=    Set Variable     0
    # Add product in FEATURED to cart
    FOR    ${index}    IN RANGE    3    6
        Click Element    css=a.productcart[data-id="${product_btns[${index}]}"]
        Go To    ${product_links[${index}]}
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
    FOR    ${index}    IN RANGE    3    6
        ${detail_name}=    Get Text    xpath=//table[@class='table table-striped table-bordered']//tr[${row_index}]//td[2]
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${product_names}[${index}]
        ${detail_price}=    Get Text    xpath=//table[@class='table table-striped table-bordered']//tr[${row_index}]//td[4]
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        ${row_index}=    Evaluate    ${row_index} + 1
    END
    Close Browser

TC3_Guest add product VALUE SETS to cart in product detail and verify
    Open homepage and verify cart empty
    Element Should Be Visible    id=categorymenu
    Click Link    xpath://ul[@class="nav-pills categorymenu"]/li[3]/a
    Click Link    xpath://ul[@class="thumbnails row"]/li[6]/div/a
    Element Text Should Be    //h1[@class='heading1']    VALUE SETS
    # Create list product
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    ${product_btns}    Create List
    Create List Product    ${product_names}    ${product_prices}    ${product_links}    ${product_btns}
    ${cart_total}=    Set Variable     0
    ${cart_count}=    Set Variable     0
    # Add product in VALUE SETS to cart
    FOR    ${index}    IN RANGE    ${product_links.__len__()}
        Go To    ${product_links[${index}]}
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
    FOR    ${index}    IN RANGE    ${product_links.__len__()}
        ${detail_name}=    Get Text    xpath=//table[@class='table table-striped table-bordered']//tr[${row_index}]//td[2]
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Contain    ${detail_name_uppercase}    ${product_names}[${index}]
        ${detail_price}=    Get Text    xpath=//table[@class='table table-striped table-bordered']//tr[${row_index}]//td[4]
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        ${row_index}=    Evaluate    ${row_index} + 1
    END
    Close Browser

TC4_Guest add product SPECIALS to cart in homepage and verify
    Open homepage and verify cart empty
    # Create list product
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    ${product_btns}    Create List
    Create List Product    ${product_names}    ${product_prices}    ${product_links}    ${product_btns}
    ${cart_total}=    Set Variable     0
    ${cart_count}=    Set Variable     0
    # Add product in SPECIALS to cart
    FOR    ${index}    IN RANGE    10    12
        Click Element    css=a.productcart[data-id="${product_btns[${index}]}"]
        Go To    ${product_links[${index}]}
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
    FOR    ${index}    IN RANGE    10    12
        ${detail_name}=    Get Text    xpath=//table[@class='table table-striped table-bordered']//tr[${row_index}]//td[2]
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${product_names}[${index}]
        ${detail_price}=    Get Text    xpath=//table[@class='table table-striped table-bordered']//tr[${row_index}]//td[4]
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        ${row_index}=    Evaluate    ${row_index} + 1
    END
    Close Browser

TC5_Guest add product CHEEKS to cart in product detail and verify
    Open homepage and verify cart empty
    Element Should Be Visible    id=categorymenu
    Click Link    xpath://ul[@class="nav-pills categorymenu"]/li[3]/a
    Click Link    xpath://ul[@class="thumbnails row"]/li[1]/div/a
    Element Text Should Be    //h1[@class='heading1']    CHEEKS
    # Create list product
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    ${product_btns}    Create List
    Create List Product    ${product_names}    ${product_prices}    ${product_links}    ${product_btns}
    ${cart_total}=    Set Variable     0
    ${cart_count}=    Set Variable     0
    # Add product in CHEEKS to cart
    FOR    ${index}    IN RANGE    ${product_links.__len__()}
        Go To    ${product_links[${index}]}
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
    FOR    ${index}    IN RANGE    ${product_links.__len__()}
        ${detail_name}=    Get Text    xpath=//table[@class='table table-striped table-bordered']//tr[${row_index}]//td[2]
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Contain    ${detail_name_uppercase}    ${product_names}[${index}]
        ${detail_price}=    Get Text    xpath=//table[@class='table table-striped table-bordered']//tr[${row_index}]//td[4]
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        ${row_index}=    Evaluate    ${row_index} + 1
    END
    Close Browser

TC6_Guest add product LATEST PRODUCTS to cart in product detail and verify
    Open homepage and verify cart empty
    # Create list product
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    ${product_btns}    Create List
    Create List Product    ${product_names}    ${product_prices}    ${product_links}    ${product_btns}
    ${cart_total}=    Set Variable     0
    ${cart_count}=    Set Variable     0
    # Add product in LATEST PRODUCTS to cart
    FOR    ${index}    IN RANGE    3    6
        Go To    ${product_links[${index}]}
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
    FOR    ${index}    IN RANGE    3    6
        ${detail_name}=    Get Text    xpath=//table[@class='table table-striped table-bordered']//tr[${row_index}]//td[2]
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Contain    ${detail_name_uppercase}    ${product_names}[${index}]
        ${detail_price}=    Get Text    xpath=//table[@class='table table-striped table-bordered']//tr[${row_index}]//td[4]
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        ${row_index}=    Evaluate    ${row_index} + 1
    END
    Close Browser

TC7_Guest add product BESTSELLERS to cart in product detail and verify
    Open homepage and verify cart empty
    # Create list product
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    ${product_btns}    Create List
    Create List Product    ${product_names}    ${product_prices}    ${product_links}    ${product_btns}
    ${cart_total}=    Set Variable     0
    ${cart_count}=    Set Variable     0
    # Add product in BESTSELLERS to cart
    FOR    ${index}    IN RANGE    6    10
        Go To    ${product_links[${index}]}
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
    FOR    ${index}    IN RANGE    6    10
        ${detail_name}=    Get Text    xpath=//table[@class='table table-striped table-bordered']//tr[${row_index}]//td[2]
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Contain    ${detail_name_uppercase}    ${product_names}[${index}]
        ${detail_price}=    Get Text    xpath=//table[@class='table table-striped table-bordered']//tr[${row_index}]//td[4]
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        ${row_index}=    Evaluate    ${row_index} + 1
    END
    Close Browser

TC8_Guest add product SPECIALS to cart in product detail and verify
    Open homepage and verify cart empty
    # Create list product
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    ${product_btns}    Create List
    Create List Product    ${product_names}    ${product_prices}    ${product_links}    ${product_btns}
    ${cart_total}=    Set Variable     0
    ${cart_count}=    Set Variable     0
    # Add product in SPECIALS to cart
    FOR    ${index}    IN RANGE    10    12
        Go To    ${product_links[${index}]}
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
    FOR    ${index}    IN RANGE    10    12
        ${detail_name}=    Get Text    xpath=//table[@class='table table-striped table-bordered']//tr[${row_index}]//td[2]
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Contain    ${detail_name_uppercase}    ${product_names}[${index}]
        ${detail_price}=    Get Text    xpath=//table[@class='table table-striped table-bordered']//tr[${row_index}]//td[4]
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        ${row_index}=    Evaluate    ${row_index} + 1
    END
    Close Browser

TC9_Guest add product SHOES to cart and edit quantity < 1
    Open homepage and verify cart empty
    Element Should Be Visible    id=categorymenu
    Click Link    xpath://ul[@class="nav-pills categorymenu"]/li[2]/a
    Click Link    xpath://ul[@class="thumbnails row"]/li[1]/div/a
    Element Text Should Be    //h1[@class='heading1']    SHOES
    # Create list product
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    ${product_btns}    Create List
    Create List Product    ${product_names}    ${product_prices}    ${product_links}    ${product_btns}
    ${cart_total}=    Set Variable     0
    ${cart_count}=    Set Variable     0
    # Add product in SHOES to cart
    FOR    ${index}    IN RANGE    ${product_btns.__len__()}
        Go To    ${product_links[${index}]}
        ${quantity}=    Get Value    id=product_quantity
        ${quantity_int}=    Convert To Integer    ${quantity}
        ${cart_count}=    Evaluate    ${cart_count} + ${quantity_int}
        Wait Until Element Is Visible    xpath=//span[@class="total-price"]
        ${price}=    Get Text    xpath=//span[@class="total-price"]
        ${price}=    Evaluate    "${price}".split('$')[-1]
        ${price_int}=    Convert To Number    ${price}
        ${cart_total}=    Evaluate    ${cart_total} + ${price_int}
        ${contains_input}=    Run Keyword And Return Status     Page Should Contain Element    xpath://div[@class="quantitybox"]//input[@type='radio']
        Run Keyword If    ${contains_input}    Select Random Radio Input
        Click Element    xpath=//ul[@class="productpagecart"]//a[@class="cart"]
        Check cart item in cart dropdown    ${cart_count}    $${cart_total}
        Go Back
        Go Back
    END
    # Verify product added in cart
    Click Element    xpath=//div[@class="block_7"]//a[@class="dropdown-toggle"]
    ${row_index}=    Set Variable    2
    FOR    ${index}    IN RANGE    ${product_btns.__len__()}
        ${detail_name}=    Get Text    xpath=//table[@class='table table-striped table-bordered']//tr[${row_index}]//td[2]
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Contain    ${detail_name_uppercase}    ${product_names}[${index}]
        ${detail_price}=    Get Text    xpath=//table[@class='table table-striped table-bordered']//tr[${row_index}]//td[4]
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        ${row_index}=    Evaluate    ${row_index} + 1
    END
    # Edit quantity < 1 in cart
    ${row_index}=    Set Variable    2
    FOR    ${index}    IN RANGE    ${product_btns.__len__()}
        Input Text    xpath=/html/body/div/div[2]/div/div/div/form/div/div[1]/table/tbody/tr[${row_index}]/td[5]/div/input     -4
        ${row_index}=    Evaluate    ${row_index} + 1
    END
    Click Button    id=cart_update
    ${cart_empty}=    Get Text    xpath=//div[@class="contentpanel"]
    Should Contain    ${cart_empty}    Your shopping cart is empty!
    Close Browser

TC10_Guest add product T-SHIRTS to cart and edit quantity = 0
    Open homepage and verify cart empty
    Element Should Be Visible    id=categorymenu
    Click Link    xpath://ul[@class="nav-pills categorymenu"]/li[2]/a
    Click Link    xpath://ul[@class="thumbnails row"]/li[2]/div/a
    Element Text Should Be    //h1[@class='heading1']    T-SHIRTS
    # Create list product
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    ${product_btns}    Create List
    Create List Product    ${product_names}    ${product_prices}    ${product_links}    ${product_btns}
    ${cart_total}=    Set Variable     0
    ${cart_count}=    Set Variable     0
    # Add product in T-SHIRTS to cart
    FOR    ${index}    IN RANGE    ${product_btns.__len__()}
        Go To    ${product_links[${index}]}
        ${quantity}=    Get Value    id=product_quantity
        ${quantity_int}=    Convert To Integer    ${quantity}
        ${cart_count}=    Evaluate    ${cart_count} + ${quantity_int}
        Wait Until Element Is Visible    xpath=//span[@class="total-price"]
        ${price}=    Get Text    xpath=//span[@class="total-price"]
        ${price}=    Evaluate    "${price}".split('$')[-1]
        ${price_int}=    Convert To Number    ${price}
        ${cart_total}=    Evaluate    ${cart_total} + ${price_int}
        ${contains_input}=    Run Keyword And Return Status     Page Should Contain Element    xpath://div[@class="quantitybox"]//input[@type='radio']
        Run Keyword If    ${contains_input}    Select Random Radio Input
        Click Element    xpath=//ul[@class="productpagecart"]//a[@class="cart"]
        Check cart item in cart dropdown    ${cart_count}    $${cart_total}
        Go Back
        Go Back
    END
    # Verify product added in cart
    Click Element    xpath=//div[@class="block_7"]//a[@class="dropdown-toggle"]
    ${row_index}=    Set Variable    2
    FOR    ${index}    IN RANGE    ${product_btns.__len__()}
        ${detail_name}=    Get Text    xpath=//table[@class='table table-striped table-bordered']//tr[${row_index}]//td[2]
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Contain    ${detail_name_uppercase}    ${product_names}[${index}]
        ${detail_price}=    Get Text    xpath=//table[@class='table table-striped table-bordered']//tr[${row_index}]//td[4]
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        ${row_index}=    Evaluate    ${row_index} + 1
    END
    # Edit quantity = 0 in cart
    ${row_index}=    Set Variable    2
    FOR    ${index}    IN RANGE    ${product_btns.__len__()}
        Input Text    xpath=/html/body/div/div[2]/div/div/div/form/div/div[1]/table/tbody/tr[${row_index}]/td[5]/div/input     0
        ${row_index}=    Evaluate    ${row_index} + 1
    END
    Click Button    id=cart_update
    ${cart_empty}=    Get Text    xpath=//div[@class="contentpanel"]
    Should Contain    ${cart_empty}    Your shopping cart is empty!
    Close Browser

TC11_Guest add product LIPS to cart and edit quantity > 1
    Open homepage and verify cart empty
    Element Should Be Visible    id=categorymenu
    Click Link    xpath://ul[@class="nav-pills categorymenu"]/li[3]/a
    Click Link    xpath://ul[@class="thumbnails row"]/li[4]/div/a
    Element Text Should Be    //h1[@class='heading1']    LIPS
    # Create list product
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    ${product_btns}    Create List
    Create List Product    ${product_names}    ${product_prices}    ${product_links}    ${product_btns}
    ${cart_total}=    Set Variable     0
    ${cart_count}=    Set Variable     0
    # Add product in LIPS to cart
    FOR    ${index}    IN RANGE    ${product_btns.__len__()}
        Go To    ${product_links[${index}]}
        ${quantity}=    Get Value    id=product_quantity
        ${quantity_int}=    Convert To Integer    ${quantity}
        ${cart_count}=    Evaluate    ${cart_count} + ${quantity_int}
        Wait Until Element Is Visible    xpath=//span[@class="total-price"]
        ${price}=    Get Text    xpath=//span[@class="total-price"]
        ${price}=    Evaluate    "${price}".split('$')[-1]
        ${price_int}=    Convert To Number    ${price}
        ${cart_total}=    Evaluate    ${cart_total} + ${price_int}
        ${contains_input}=    Run Keyword And Return Status     Page Should Contain Element    xpath://div[@class="quantitybox"]//input[@type='radio']
        Run Keyword If    ${contains_input}    Select Random Radio Input
        Click Element    xpath=//ul[@class="productpagecart"]//a[@class="cart"]
        Check cart item in cart dropdown    ${cart_count}    $${cart_total}
        Go Back
        Go Back
    END
    # Verify product added in cart
    ${quantity_old}    Create List
    ${price_old}    Create List
    Click Element    xpath=//div[@class="block_7"]//a[@class="dropdown-toggle"]
    Check product in cart    ${product_names}    ${product_prices}    ${product_links}    ${product_btns}    ${price_old}    ${quantity_old}
    # Edit quantity > 1 in cart
    ${row_index}=    Set Variable    2
    FOR    ${index}    IN RANGE    ${product_btns.__len__()}
        Input Text    xpath=/html/body/div/div[2]/div/div/div/form/div/div[1]/table/tbody/tr[${row_index}]/td[5]/div/input     12
        ${row_index}=    Evaluate    ${row_index} + 1
    END
    Click Button    id=cart_update
    ${row_index}=    Set Variable    2
    FOR    ${index}    IN RANGE    ${product_btns.__len__()}
        ${quantity_new}=    Get Value    xpath=/html/body/div/div[2]/div/div/div/form/div/div[1]/table/tbody/tr[${row_index}]/td[5]/div/input
        Should Be Equal As Numbers    ${quantity_new}     12
        ${price_new}=    Get Text    xpath=//table[@class='table table-striped table-bordered']//tr[${row_index}]//td[6]
        ${price_new}=    Evaluate    "${price_new}".split('$')[-1]
        ${price_new}=    Convert To Number    ${price_new}
        ${price_total}=    Evaluate    ${price_old[${index}]} * 12
        Should Be Equal As Numbers    ${price_total}    ${price_new}
        ${row_index}=    Evaluate    ${row_index} + 1
    END
    Close Browser

TC12_Guest add product FACE to cart and edit quantity invalid: hehehehehehhe
    Open homepage and verify cart empty
    Element Should Be Visible    id=categorymenu
    Click Link    xpath://ul[@class="nav-pills categorymenu"]/li[4]/a
    Click Link    xpath://ul[@class="thumbnails row"]/li[2]/div/a
    Element Text Should Be    //h1[@class='heading1']    FACE
    # Create list product
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    ${product_btns}    Create List
    Create List Product    ${product_names}    ${product_prices}    ${product_links}    ${product_btns}
    ${cart_total}=    Set Variable     0
    ${cart_count}=    Set Variable     0
    # Add product in FACE to cart
    FOR    ${index}    IN RANGE    ${product_btns.__len__()}
        Go To    ${product_links[${index}]}
        ${quantity}=    Get Value    id=product_quantity
        ${quantity_int}=    Convert To Integer    ${quantity}
        ${cart_count}=    Evaluate    ${cart_count} + ${quantity_int}
        Wait Until Element Is Visible    xpath=//span[@class="total-price"]
        ${price}=    Get Text    xpath=//span[@class="total-price"]
        ${price}=    Evaluate    "${price}".split('$')[-1]
        ${price_int}=    Convert To Number    ${price}
        ${cart_total}=    Evaluate    ${cart_total} + ${price_int}
        ${contains_input}=    Run Keyword And Return Status     Page Should Contain Element    xpath://div[@class="quantitybox"]//input[@type='radio']
        Run Keyword If    ${contains_input}    Select Random Radio Input
        Click Element    xpath=//ul[@class="productpagecart"]//a[@class="cart"]
        Check cart item in cart dropdown    ${cart_count}    $${cart_total}
        Go Back
        Go Back
    END
    # Verify product added in cart
    ${quantity_old}    Create List
    ${price_old}    Create List
    Click Element    xpath=//div[@class="block_7"]//a[@class="dropdown-toggle"]
    Check product in cart    ${product_names}    ${product_prices}    ${product_links}    ${product_btns}    ${price_old}    ${quantity_old}
    # Edit quantity invalid hehehehehehhe
    ${row_index}=    Set Variable    2
    FOR    ${index}    IN RANGE    ${product_btns.__len__()}
        Input Text    xpath=/html/body/div/div[2]/div/div/div/form/div/div[1]/table/tbody/tr[${row_index}]/td[5]/div/input     hehehehehehhe
        ${row_index}=    Evaluate    ${row_index} + 1
    END
    Click Button    id=cart_update
    ${cart_empty}=    Get Text    xpath=//div[@class="contentpanel"]
    Should Contain    ${cart_empty}    Your shopping cart is empty!
    Close Browser

TC13_Guest add product MEN to cart and edit quantity 100000000 
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
    ${cart_total}=    Set Variable     0
    ${cart_count}=    Set Variable     0
    # Add product in MEN to cart
    FOR    ${index}    IN RANGE    ${product_btns.__len__()}
        Go To    ${product_links[${index}]}
        ${quantity}=    Get Value    id=product_quantity
        ${quantity_int}=    Convert To Integer    ${quantity}
        ${cart_count}=    Evaluate    ${cart_count} + ${quantity_int}
        Wait Until Element Is Visible    xpath=//span[@class="total-price"]
        ${price}=    Get Text    xpath=//span[@class="total-price"]
        ${price}=    Evaluate    "${price}".split('$')[-1]
        ${price_int}=    Convert To Number    ${price}
        ${cart_total}=    Evaluate    ${cart_total} + ${price_int}
        ${contains_input}=    Run Keyword And Return Status     Page Should Contain Element    xpath://div[@class="quantitybox"]//input[@type='radio']
        Run Keyword If    ${contains_input}    Select Random Radio Input
        Click Element    xpath=//ul[@class="productpagecart"]//a[@class="cart"]
        Check cart item in cart dropdown    ${cart_count}    $${cart_total}
        Go Back
        Go Back
    END
    # Verify product added in cart
    ${quantity_old}    Create List
    ${price_old}    Create List
    Click Element    xpath=//div[@class="block_7"]//a[@class="dropdown-toggle"]
    Check product in cart    ${product_names}    ${product_prices}    ${product_links}    ${product_btns}    ${price_old}    ${quantity_old}
    Log To Console    ${price_old}
    # Edit quantity 100000000 in cart
    ${row_index}=    Set Variable    2
    FOR    ${index}    IN RANGE    ${product_btns.__len__()}
        Input Text    xpath=/html/body/div/div[2]/div/div/div/form/div/div[1]/table/tbody/tr[${row_index}]/td[5]/div/input     100000000
        ${row_index}=    Evaluate    ${row_index} + 1
    END
    Click Button    id=cart_update
    ${warning_text}=    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/div
    Should Be Equal As Strings    ${warning_text}    Products marked with *** are not available in the desired quantity or out of stock!
    ${row_index}=    Set Variable    2
    FOR    ${index}    IN RANGE    ${product_btns.__len__()}
        ${quantity_new}=    Get Value    xpath=/html/body/div/div[2]/div/div/div/form/div/div[1]/table/tbody/tr[${row_index}]/td[5]/div/input
        Should Be Equal As Numbers    ${quantity_new}     100000000
        ${price_new}=    Get Text    xpath=//table[@class='table table-striped table-bordered']//tr[${row_index}]//td[6]
        ${price_new}=    Evaluate    "${price_new}".split('$')[-1]
        ${price_new}=    Set Variable    ${price_new.replace(",", "")}
        ${price_new}=    Convert To Number    ${price_new}
        ${price_total}=    Evaluate    ${price_old[${index}]} * 100000000
        Should Be Equal As Numbers    ${price_total}    ${price_new}
        ${row_index}=    Evaluate    ${row_index} + 1
    END
    Close Browser

TC14_Guest add product FRAGRANCE SETS to cart and edit quantity invalid @!#$$%+=
    Open homepage and verify cart empty
    Element Should Be Visible    id=categorymenu
    Click Link    xpath://ul[@class="nav-pills categorymenu"]/li[6]/a
    Click Link    xpath://ul[@class="thumbnails row"]/li[2]/div/a
    Element Text Should Be    //h1[@class='heading1']    FRAGRANCE SETS
    # Create list product
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    ${product_btns}    Create List
    Create List Product    ${product_names}    ${product_prices}    ${product_links}    ${product_btns}
    ${cart_total}=    Set Variable     0
    ${cart_count}=    Set Variable     0
    Log To Console    ${product_prices}
    # Add product in FRAGRANCE SETS to cart
    FOR    ${index}    IN RANGE    ${product_btns.__len__()}
        Go To    ${product_links[${index}]}
        ${quantity}=    Get Value    id=product_quantity
        ${quantity_int}=    Convert To Integer    ${quantity}
        ${cart_count}=    Evaluate    ${cart_count} + ${quantity_int}
        Wait Until Element Is Visible    xpath=//span[@class="total-price"]
        ${price}=    Get Text    xpath=//span[@class="total-price"]
        ${price}=    Evaluate    "${price}".split('$')[-1]
        ${price_int}=    Convert To Number    ${price}
        ${cart_total}=    Evaluate    ${cart_total} + ${price_int}
        ${contains_input}=    Run Keyword And Return Status     Page Should Contain Element    xpath://div[@class="quantitybox"]//input[@type='radio']
        Run Keyword If    ${contains_input}    Select Random Radio Input
        Click Element    xpath=//ul[@class="productpagecart"]//a[@class="cart"]
        Check cart item in cart dropdown    ${cart_count}    $${cart_total}
        Go Back
        Go Back
    END
    # Verify product added in cart
    ${quantity_old}    Create List
    ${price_old}    Create List
    Click Element    xpath=//div[@class="block_7"]//a[@class="dropdown-toggle"]
    Check product in cart    ${product_names}    ${product_prices}    ${product_links}    ${product_btns}    ${price_old}    ${quantity_old}
    # Edit quantity invalid @!#$$%+=
    ${row_index}=    Set Variable    2
    FOR    ${index}    IN RANGE    ${product_btns.__len__()}
        Input Text    xpath=/html/body/div/div[2]/div/div/div/form/div/div[1]/table/tbody/tr[${row_index}]/td[5]/div/input     @!#$$%+=
        ${row_index}=    Evaluate    ${row_index} + 1
    END
    Click Button    id=cart_update
    ${cart_empty}=    Get Text    xpath=//div[@class="contentpanel"]
    Should Contain    ${cart_empty}    Your shopping cart is empty!
    Close Browser

TC15_Guest add product CONDITIONER to cart and remove 1 product
    Open homepage and verify cart empty
    Element Should Be Visible    id=categorymenu
    Click Link    xpath://ul[@class="nav-pills categorymenu"]/li[7]/a
    Click Link    xpath://ul[@class="thumbnails row"]/li[1]/div/a
    Element Text Should Be    //h1[@class='heading1']    CONDITIONER
    # Create list product
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    ${product_btns}    Create List
    Create List Product    ${product_names}    ${product_prices}    ${product_links}    ${product_btns}
    ${cart_total}=    Set Variable     0
    ${cart_count}=    Set Variable     0
    Log To Console    ${product_prices}
    # Add product in CONDITIONER to cart
    FOR    ${index}    IN RANGE    ${product_btns.__len__()}
        Go To    ${product_links[${index}]}
        ${quantity}=    Get Value    id=product_quantity
        ${quantity_int}=    Convert To Integer    ${quantity}
        ${cart_count}=    Evaluate    ${cart_count} + ${quantity_int}
        Wait Until Element Is Visible    xpath=//span[@class="total-price"]
        ${price}=    Get Text    xpath=//span[@class="total-price"]
        ${price}=    Evaluate    "${price}".split('$')[-1]
        ${price_int}=    Convert To Number    ${price}
        ${cart_total}=    Evaluate    ${cart_total} + ${price_int}
        ${cart_total}=    Round Number    ${cart_total}    2
        ${contains_input}=    Run Keyword And Return Status     Page Should Contain Element    xpath://div[@class="quantitybox"]//input[@type='radio']
        Run Keyword If    ${contains_input}    Select Random Radio Input
        Click Element    xpath=//ul[@class="productpagecart"]//a[@class="cart"]
        Check cart item in cart dropdown    ${cart_count}    $${cart_total}
        Go Back
        Go Back
    END
    # Verify product added in cart
    ${quantity_old}    Create List
    ${price_old}    Create List
    Click Element    xpath=//div[@class="block_7"]//a[@class="dropdown-toggle"]
    Check product in cart    ${product_names}    ${product_prices}    ${product_links}    ${product_btns}    ${price_old}    ${quantity_old}
    # Remove 1 product
    FOR    ${index}    IN RANGE    1
        Click Element    xpath=//table[@class='table table-striped table-bordered']//tr[2]//td[7]
        Page Should Not Contain    ${product_names}[${index}]
    END
    Close Browser

TC16_Guest add product HAIR CARE to cart and remove 3 product
    Open homepage and verify cart empty
    Element Should Be Visible    id=categorymenu
    Click Link    xpath://ul[@class="nav-pills categorymenu"]/li[7]/a
    Element Text Should Be    //h1[@class='heading1']    HAIR CARE
    # Create list product
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    ${product_btns}    Create List
    Create List Product    ${product_names}    ${product_prices}    ${product_links}    ${product_btns}
    ${cart_total}=    Set Variable     0
    ${cart_count}=    Set Variable     0
    Log To Console    ${product_prices}
    # Add product in HAIR CARE to cart
    FOR    ${index}    IN RANGE    ${product_btns.__len__()}
        Go To    ${product_links[${index}]}
        ${quantity}=    Get Value    id=product_quantity
        ${quantity_int}=    Convert To Integer    ${quantity}
        ${cart_count}=    Evaluate    ${cart_count} + ${quantity_int}
        Wait Until Element Is Visible    xpath=//span[@class="total-price"]
        ${price}=    Get Text    xpath=//span[@class="total-price"]
        ${price}=    Evaluate    "${price}".split('$')[-1]
        ${price_int}=    Convert To Number    ${price}
        ${cart_total}=    Evaluate    ${cart_total} + ${price_int}
        ${cart_total}=    Round Number    ${cart_total}    2
        ${contains_input}=    Run Keyword And Return Status     Page Should Contain Element    xpath://div[@class="quantitybox"]//input[@type='radio']
        Run Keyword If    ${contains_input}    Select Random Radio Input
        Click Element    xpath=//ul[@class="productpagecart"]//a[@class="cart"]
        Check cart item in cart dropdown    ${cart_count}    $${cart_total}
        Go Back
        Go Back
    END
    # Verify product added in cart
    ${quantity_old}    Create List
    ${price_old}    Create List
    Click Element    xpath=//div[@class="block_7"]//a[@class="dropdown-toggle"]
    Check product in cart    ${product_names}    ${product_prices}    ${product_links}    ${product_btns}    ${price_old}    ${quantity_old}
    # Remove 3 product
    ${row_index}=    Set Variable    2
    FOR    ${index}    IN RANGE    3
        Click Element    xpath=//table[@class='table table-striped table-bordered']//tr[2]//td[7]
        Page Should Not Contain    ${product_names}[${index}]
    END
    Close Browser

TC17_Guest add product SPECIALS OFFERS to cart and remove all product
    Open homepage and verify cart empty
    Maximize Browser Window
    Element Should Be Visible    id=categorymenu
    Click Element    xpath=//a[@class="top menu_specials"]
    Element Text Should Be    //h1[@class='heading1']    SPECIAL OFFERS
    # Create list product
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    ${product_btns}    Create List
    Create List Product    ${product_names}    ${product_prices}    ${product_links}    ${product_btns}
    ${cart_total}=    Set Variable     0
    ${cart_count}=    Set Variable     0
    Log To Console    ${product_prices}
    # Add product in SPECIALS OFFERS to cart
    FOR    ${index}    IN RANGE    ${product_btns.__len__()}
        Go To    ${product_links[${index}]}
        ${quantity}=    Get Value    id=product_quantity
        ${quantity_int}=    Convert To Integer    ${quantity}
        ${cart_count}=    Evaluate    ${cart_count} + ${quantity_int}
        Wait Until Element Is Visible    xpath=//span[@class="total-price"]
        ${price}=    Get Text    xpath=//span[@class="total-price"]
        ${price}=    Evaluate    "${price}".split('$')[-1]
        ${price_int}=    Convert To Number    ${price}
        ${cart_total}=    Evaluate    ${cart_total} + ${price_int}
        ${cart_total}=    Round Number    ${cart_total}    2
        ${contains_input}=    Run Keyword And Return Status     Page Should Contain Element    xpath://div[@class="quantitybox"]//input[@type='radio']
        Run Keyword If    ${contains_input}    Select Random Radio Input
        Click Element    xpath=//ul[@class="productpagecart"]//a[@class="cart"]
        Check cart item in cart dropdown    ${cart_count}    $${cart_total}
        Go Back
        Go Back
    END
    # Verify product added in cart
    ${quantity_old}    Create List
    ${price_old}    Create List
    Click Element    xpath=//div[@class="block_7"]//a[@class="dropdown-toggle"]
    Check product in cart    ${product_names}    ${product_prices}    ${product_links}    ${product_btns}    ${price_old}    ${quantity_old}
    # Remove all product
    FOR    ${index}    IN RANGE    ${product_btns.__len__()}
        Click Element    xpath=//table[@class='table table-striped table-bordered']//tr[2]//td[7]
        Page Should Not Contain    ${product_names}[${index}]
    END
    ${cart_empty}=    Get Text    xpath=//div[@class="contentpanel"]
    Should Contain    ${cart_empty}    Your shopping cart is empty!
    Close Browser

TC18_Login and add product BENEFIT to cart, edit quantity 100 and remove all product
    Open homepage login and verify cart empty
    Scroll Element Into View    id=block_frame_listing_block_1774
    Click Link    xpath://ul[@id="brandcarousal"]/li[1]//div[@class="image"]/a
    Element Text Should Be    //h1[@class='heading1']    BENEFIT
    # Create list product
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    ${product_btns}    Create List
    Create List Product    ${product_names}    ${product_prices}    ${product_links}    ${product_btns}
    ${cart_total}=    Set Variable     0
    ${cart_count}=    Set Variable     0
    # Add product in BENEFIT to cart
    FOR    ${index}    IN RANGE    ${product_btns.__len__()}
        Go To    ${product_links[${index}]}
        ${quantity}=    Get Value    id=product_quantity
        ${quantity_int}=    Convert To Integer    ${quantity}
        ${cart_count}=    Evaluate    ${cart_count} + ${quantity_int}
        Wait Until Element Is Visible    xpath=//span[@class="total-price"]
        ${price}=    Get Text    xpath=//span[@class="total-price"]
        ${price}=    Evaluate    "${price}".split('$')[-1]
        ${price_int}=    Convert To Number    ${price}
        ${cart_total}=    Evaluate    ${cart_total} + ${price_int}
        ${contains_input}=    Run Keyword And Return Status     Page Should Contain Element    xpath://div[@class="quantitybox"]//input[@type='radio']
        Run Keyword If    ${contains_input}    Select Random Radio Input
        Click Element    xpath=//ul[@class="productpagecart"]//a[@class="cart"]
        Check cart item in cart dropdown    ${cart_count}    $${cart_total}
        Go Back
        Go Back
    END
    # Verify product added in cart
    ${quantity_old}    Create List
    ${price_old}    Create List
    Click Element    xpath=//div[@class="block_7"]//a[@class="dropdown-toggle"]
    Check product in cart    ${product_names}    ${product_prices}    ${product_links}    ${product_btns}    ${price_old}    ${quantity_old}
    # Edit quantity > 100 in cart
    ${row_index}=    Set Variable    2
    FOR    ${index}    IN RANGE    ${product_btns.__len__()}
        Input Text    xpath=/html/body/div/div[2]/div/div/div/form/div/div[1]/table/tbody/tr[${row_index}]/td[5]/div/input     100
        ${row_index}=    Evaluate    ${row_index} + 1
    END
    Click Button    id=cart_update
    ${row_index}=    Set Variable    2
    FOR    ${index}    IN RANGE    ${product_btns.__len__()}
        ${quantity_new}=    Get Value    xpath=/html/body/div/div[2]/div/div/div/form/div/div[1]/table/tbody/tr[${row_index}]/td[5]/div/input
        Should Be Equal As Numbers    ${quantity_new}     100
        ${price_new}=    Get Text    xpath=//table[@class='table table-striped table-bordered']//tr[${row_index}]//td[6]
        ${price_new}=    Evaluate    "${price_new}".split('$')[-1]
        ${price_new}=    Set Variable    ${price_new.replace(",", "")}
        ${price_new}=    Convert To Number    ${price_new}
        ${price_total}=    Evaluate    ${price_old[${index}]} * ${quantity_new}
        Should Be Equal As Numbers    ${price_total}    ${price_new}
        ${row_index}=    Evaluate    ${row_index} + 1
    END
    # Remove all product
    FOR    ${index}    IN RANGE    ${product_btns.__len__()}
        Click Element    xpath=//table[@class='table table-striped table-bordered']//tr[2]//td[7]
        Page Should Not Contain    ${product_names}[${index}]
    END
    ${cart_empty}=    Get Text    xpath=//div[@class="contentpanel"]
    Should Contain    ${cart_empty}    Your shopping cart is empty!
    Close Browser

TC19_Login and add product PANTENE to cart and edit quantity = 0
    Open homepage login and verify cart empty
    Scroll Element Into View    id=block_frame_listing_block_1774
    Click Link    xpath://ul[@id="brandcarousal"]/li[2]//div[@class="image"]/a
    Element Text Should Be    //h1[@class='heading1']    PANTENE
    # Create list product
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    ${product_btns}    Create List
    Create List Product    ${product_names}    ${product_prices}    ${product_links}    ${product_btns}
    ${cart_total}=    Set Variable     0
    ${cart_count}=    Set Variable     0
    # Add product in PANTENE to cart
    FOR    ${index}    IN RANGE    ${product_btns.__len__()}
        Go To    ${product_links[${index}]}
        ${quantity}=    Get Value    id=product_quantity
        ${quantity_int}=    Convert To Integer    ${quantity}
        ${cart_count}=    Evaluate    ${cart_count} + ${quantity_int}
        Wait Until Element Is Visible    xpath=//span[@class="total-price"]
        ${price}=    Get Text    xpath=//span[@class="total-price"]
        ${price}=    Evaluate    "${price}".split('$')[-1]
        ${price_int}=    Convert To Number    ${price}
        ${cart_total}=    Evaluate    ${cart_total} + ${price_int}
        ${cart_total}=    Round Number    ${cart_total}    2
        ${contains_input}=    Run Keyword And Return Status     Page Should Contain Element    xpath://div[@class="quantitybox"]//input[@type='radio']
        Run Keyword If    ${contains_input}    Select Random Radio Input
        Click Element    xpath=//ul[@class="productpagecart"]//a[@class="cart"]
        Check cart item in cart dropdown    ${cart_count}    $${cart_total}
        Go Back
        Go Back
    END
    # Verify product added in cart
    ${quantity_old}    Create List
    ${price_old}    Create List
    Click Element    xpath=//div[@class="block_7"]//a[@class="dropdown-toggle"]
    Check product in cart    ${product_names}    ${product_prices}    ${product_links}    ${product_btns}    ${price_old}    ${quantity_old}
    # Edit quantity = 0 in cart
    ${row_index}=    Set Variable    2
    FOR    ${index}    IN RANGE    ${product_btns.__len__()}
        Input Text    xpath=/html/body/div/div[2]/div/div/div/form/div/div[1]/table/tbody/tr[${row_index}]/td[5]/div/input     0
        ${row_index}=    Evaluate    ${row_index} + 1
    END
    Click Button    id=cart_update
    ${cart_empty}=    Get Text    xpath=//div[@class="contentpanel"]
    Should Contain    ${cart_empty}    Your shopping cart is empty!
    Close Browser

TC20_Login and add product M·A·C to cart and edit quantity < 1
    Open homepage login and verify cart empty
    Scroll Element Into View    id=block_frame_listing_block_1774
    Click Link    xpath://ul[@id="brandcarousal"]/li[3]//div[@class="image"]/a
    Element Text Should Be    //h1[@class='heading1']    M·A·C
    # Create list product
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    ${product_btns}    Create List
    Create List Product    ${product_names}    ${product_prices}    ${product_links}    ${product_btns}
    ${cart_total}=    Set Variable     0
    ${cart_count}=    Set Variable     0
    # Add product in M·A·C to cart
    FOR    ${index}    IN RANGE    ${product_btns.__len__()}
        Go To    ${product_links[${index}]}
        ${quantity}=    Get Value    id=product_quantity
        ${quantity_int}=    Convert To Integer    ${quantity}
        ${cart_count}=    Evaluate    ${cart_count} + ${quantity_int}
        Wait Until Element Is Visible    xpath=//span[@class="total-price"]
        ${price}=    Get Text    xpath=//span[@class="total-price"]
        ${price}=    Evaluate    "${price}".split('$')[-1]
        ${price_int}=    Convert To Number    ${price}
        ${cart_total}=    Evaluate    ${cart_total} + ${price_int}
        ${cart_total}=    Round Number    ${cart_total}    2
        ${contains_input}=    Run Keyword And Return Status     Page Should Contain Element    xpath://div[@class="quantitybox"]//input[@type='radio']
        Run Keyword If    ${contains_input}    Select Random Radio Input
        Click Element    xpath=//ul[@class="productpagecart"]//a[@class="cart"]
        Check cart item in cart dropdown    ${cart_count}    $${cart_total}
        Go Back
        Go Back
    END
    # Verify product added in cart
    ${quantity_old}    Create List
    ${price_old}    Create List
    Click Element    xpath=//div[@class="block_7"]//a[@class="dropdown-toggle"]
    Check product in cart    ${product_names}    ${product_prices}    ${product_links}    ${product_btns}    ${price_old}    ${quantity_old}
    # Edit quantity = 0 in cart
    ${row_index}=    Set Variable    2
    FOR    ${index}    IN RANGE    ${product_btns.__len__()}
        Input Text    xpath=/html/body/div/div[2]/div/div/div/form/div/div[1]/table/tbody/tr[${row_index}]/td[5]/div/input     -20
        ${row_index}=    Evaluate    ${row_index} + 1
    END
    Click Button    id=cart_update
    ${cart_empty}=    Get Text    xpath=//div[@class="contentpanel"]
    Should Contain    ${cart_empty}    Your shopping cart is empty!
    Close Browser

TC21_Login and add product GUCCI to cart and edit quantity invalid dkjlfsaishdhdhaisshsjhpoasjfojapofsjpojasjfpoajosjofsjpopojjo
    Open homepage login and verify cart empty
    Scroll Element Into View    id=block_frame_listing_block_1774
    Click Link    xpath://ul[@id="brandcarousal"]/li[5]//div[@class="image"]/a
    Element Text Should Be    //h1[@class='heading1']    GUCCI
    # Create list product
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    ${product_btns}    Create List
    Create List Product    ${product_names}    ${product_prices}    ${product_links}    ${product_btns}
    ${cart_total}=    Set Variable     0
    ${cart_count}=    Set Variable     0
    # Add product in GUCCI to cart
    FOR    ${index}    IN RANGE    ${product_btns.__len__()}
        Go To    ${product_links[${index}]}
        ${quantity}=    Get Value    id=product_quantity
        ${quantity_int}=    Convert To Integer    ${quantity}
        ${cart_count}=    Evaluate    ${cart_count} + ${quantity_int}
        Wait Until Element Is Visible    xpath=//span[@class="total-price"]
        ${price}=    Get Text    xpath=//span[@class="total-price"]
        ${price}=    Evaluate    "${price}".split('$')[-1]
        ${price_int}=    Convert To Number    ${price}
        ${cart_total}=    Evaluate    ${cart_total} + ${price_int}
        ${cart_total}=    Round Number    ${cart_total}    2
        ${contains_input}=    Run Keyword And Return Status     Page Should Contain Element    xpath://div[@class="quantitybox"]//input[@type='radio']
        Run Keyword If    ${contains_input}    Select Random Radio Input
        Click Element    xpath=//ul[@class="productpagecart"]//a[@class="cart"]
        Check cart item in cart dropdown    ${cart_count}    $${cart_total}
        Go Back
        Go Back
    END
    # Verify product added in cart
    ${quantity_old}    Create List
    ${price_old}    Create List
    Click Element    xpath=//div[@class="block_7"]//a[@class="dropdown-toggle"]
    Check product in cart    ${product_names}    ${product_prices}    ${product_links}    ${product_btns}    ${price_old}    ${quantity_old}
    # Edit quantity = 0 in cart
    ${row_index}=    Set Variable    2
    FOR    ${index}    IN RANGE    ${product_btns.__len__()}
        Input Text    xpath=/html/body/div/div[2]/div/div/div/form/div/div[1]/table/tbody/tr[${row_index}]/td[5]/div/input     dkjlfsaishdhdhaisshsjhpoasjfojapofsjpojasjfpoajosjofsjpopojjo
        ${row_index}=    Evaluate    ${row_index} + 1
    END
    Click Button    id=cart_update
    ${cart_empty}=    Get Text    xpath=//div[@class="contentpanel"]
    Should Contain    ${cart_empty}    Your shopping cart is empty!
    Close Browser

TC22_Login and add product GIORGIO ARMANI to cart and edit quantity invalid !@#$%^&(&()_+=)
    Open homepage login and verify cart empty
    Scroll Element Into View    id=block_frame_listing_block_1774
    Click Link    xpath://ul[@id="brandcarousal"]/li[6]//div[@class="image"]/a
    Element Text Should Be    //h1[@class='heading1']    GIORGIO ARMANI
    # Create list product
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    ${product_btns}    Create List
    Create List Product    ${product_names}    ${product_prices}    ${product_links}    ${product_btns}
    ${cart_total}=    Set Variable     0
    ${cart_count}=    Set Variable     0
    # Add product in GIORGIO ARMANI to cart
    FOR    ${index}    IN RANGE    ${product_btns.__len__()}
        Go To    ${product_links[${index}]}
        ${quantity}=    Get Value    id=product_quantity
        ${quantity_int}=    Convert To Integer    ${quantity}
        ${cart_count}=    Evaluate    ${cart_count} + ${quantity_int}
        Wait Until Element Is Visible    xpath=//span[@class="total-price"]
        ${price}=    Get Text    xpath=//span[@class="total-price"]
        ${price}=    Evaluate    "${price}".split('$')[-1]
        ${price_int}=    Convert To Number    ${price}
        ${cart_total}=    Evaluate    ${cart_total} + ${price_int}
        ${cart_total}=    Round Number    ${cart_total}    2
        ${contains_input}=    Run Keyword And Return Status     Page Should Contain Element    xpath://div[@class="quantitybox"]//input[@type='radio']
        Run Keyword If    ${contains_input}    Select Random Radio Input
        Click Element    xpath=//ul[@class="productpagecart"]//a[@class="cart"]
        Check cart item in cart dropdown    ${cart_count}    $${cart_total}
        Go Back
        Go Back
    END
    # Verify product added in cart
    ${quantity_old}    Create List
    ${price_old}    Create List
    Click Element    xpath=//div[@class="block_7"]//a[@class="dropdown-toggle"]
    Check product in cart    ${product_names}    ${product_prices}    ${product_links}    ${product_btns}    ${price_old}    ${quantity_old}
    # Edit quantity = 0 in cart
    ${row_index}=    Set Variable    2
    FOR    ${index}    IN RANGE    ${product_btns.__len__()}
        Input Text    xpath=/html/body/div/div[2]/div/div/div/form/div/div[1]/table/tbody/tr[${row_index}]/td[5]/div/input     !@#$%^&(&()_+=)
        ${row_index}=    Evaluate    ${row_index} + 1
    END
    Click Button    id=cart_update
    ${cart_empty}=    Get Text    xpath=//div[@class="contentpanel"]
    Should Contain    ${cart_empty}    Your shopping cart is empty!
    Close Browser

TC23_Login and add product DOVE to cart and edit quantity 500059595999
    Open homepage login and verify cart empty
    Scroll Element Into View    id=block_frame_listing_block_1774
    Click Link    xpath://ul[@id="brandcarousal"]/li[7]//div[@class="image"]/a
    Element Text Should Be    //h1[@class='heading1']    DOVE
    # Create list product
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    ${product_btns}    Create List
    Create List Product    ${product_names}    ${product_prices}    ${product_links}    ${product_btns}
    ${cart_total}=    Set Variable     0
    ${cart_count}=    Set Variable     0
    # Add product in DOVE to cart
    FOR    ${index}    IN RANGE    ${product_btns.__len__()}
        Go To    ${product_links[${index}]}
        ${quantity}=    Get Value    id=product_quantity
        ${quantity_int}=    Convert To Integer    ${quantity}
        ${cart_count}=    Evaluate    ${cart_count} + ${quantity_int}
        Wait Until Element Is Visible    xpath=//span[@class="total-price"]
        ${price}=    Get Text    xpath=//span[@class="total-price"]
        ${price}=    Evaluate    "${price}".split('$')[-1]
        ${price_int}=    Convert To Number    ${price}
        ${cart_total}=    Evaluate    ${cart_total} + ${price_int}
        ${cart_total}=    Round Number    ${cart_total}    2
        ${contains_input}=    Run Keyword And Return Status     Page Should Contain Element    xpath://div[@class="quantitybox"]//input[@type='radio']
        Run Keyword If    ${contains_input}    Select Random Radio Input
        Click Element    xpath=//ul[@class="productpagecart"]//a[@class="cart"]
        Check cart item in cart dropdown    ${cart_count}    $${cart_total}
        Go Back
        Go Back
    END
    # Verify product added in cart
    ${quantity_old}    Create List
    ${price_old}    Create List
    Click Element    xpath=//div[@class="block_7"]//a[@class="dropdown-toggle"]
    Check product in cart    ${product_names}    ${product_prices}    ${product_links}    ${product_btns}    ${price_old}    ${quantity_old}
    # Edit quantity = 500059595999 in cart
    ${row_index}=    Set Variable    2
    FOR    ${index}    IN RANGE    ${product_btns.__len__()}
        Input Text    xpath=/html/body/div/div[2]/div/div/div/form/div/div[1]/table/tbody/tr[${row_index}]/td[5]/div/input     500059595999
        ${row_index}=    Evaluate    ${row_index} + 1
    END
    Click Button    id=cart_update
    ${warning_text}=    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/div
    Should Be Equal As Strings    ${warning_text}    Products marked with *** are not available in the desired quantity or out of stock!
    ${row_index}=    Set Variable    2
    FOR    ${index}    IN RANGE    ${product_btns.__len__()}
        ${quantity_new}=    Get Value    xpath=/html/body/div/div[2]/div/div/div/form/div/div[1]/table/tbody/tr[${row_index}]/td[5]/div/input
        Should Be Equal As Numbers    ${quantity_new}     500059595999
        ${price_new}=    Get Text    xpath=//table[@class='table table-striped table-bordered']//tr[${row_index}]//td[6]
        ${price_new}=    Evaluate    "${price_new}".split('$')[-1]
        ${price_new}=    Set Variable    ${price_new.replace(",", "")}
        ${price_new}=    Convert To Number    ${price_new}
        ${price_total}=    Evaluate    ${price_old[${index}]} * 500059595999
        ${price_total}=    Round Number    ${price_total}    2
        Should Be Equal As Numbers    ${price_total}    ${price_new}
        ${row_index}=    Evaluate    ${row_index} + 1
    END
    # Remove all product
    FOR    ${index}    IN RANGE    ${product_btns.__len__()}
        Click Element    xpath=//table[@class='table table-striped table-bordered']//tr[2]//td[7]
        Page Should Not Contain    ${product_names}[${index}]
    END
    ${cart_empty}=    Get Text    xpath=//div[@class="contentpanel"]
    Should Contain    ${cart_empty}    Your shopping cart is empty!
    Close Browser

TC24_Login and add product CALVIN KLEIN to cart, logout and relogin, verify product and edit quantity = 100
    Open homepage login and verify cart empty
    Scroll Element Into View    id=block_frame_listing_block_1774
    Click Link    xpath://ul[@id="brandcarousal"]/li[8]//div[@class="image"]/a
    Element Text Should Be    //h1[@class='heading1']    CALVIN KLEIN
    # Create list product
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    ${product_btns}    Create List
    Create List Product    ${product_names}    ${product_prices}    ${product_links}    ${product_btns}
    ${cart_total}=    Set Variable     0
    ${cart_count}=    Set Variable     0
    # Add product in CALVIN KLEIN to cart
    FOR    ${index}    IN RANGE    ${product_btns.__len__()}
        Go To    ${product_links[${index}]}
        ${quantity}=    Get Value    id=product_quantity
        ${quantity_int}=    Convert To Integer    ${quantity}
        ${cart_count}=    Evaluate    ${cart_count} + ${quantity_int}
        Wait Until Element Is Visible    xpath=//span[@class="total-price"]
        ${price}=    Get Text    xpath=//span[@class="total-price"]
        ${price}=    Evaluate    "${price}".split('$')[-1]
        ${price_int}=    Convert To Number    ${price}
        ${cart_total}=    Evaluate    ${cart_total} + ${price_int}
        ${contains_input}=    Run Keyword And Return Status     Page Should Contain Element    xpath://div[@class="quantitybox"]//input[@type='radio']
        Run Keyword If    ${contains_input}    Select Random Radio Input
        Click Element    xpath=//ul[@class="productpagecart"]//a[@class="cart"]
        Check cart item in cart dropdown    ${cart_count}    $${cart_total}
        Go Back
        Go Back
    END
    #Logout and relogin
    Click Element    xpath=//*[@id="customer_menu_top"]/li/a
    Click Element    xpath=//*[@id="maincontainer"]/div/div[1]/div/ul/li[9]/a
    Click Element    xpath=//ul[@id="customer_menu_top"]
    Input Text    id=loginFrm_loginname    kngaan017
    Input Password    id=loginFrm_password    123456
    Click Button    xpath=//*[@id="loginFrm"]/fieldset/button
    # Verify product added in cart
    ${quantity_old}    Create List
    ${price_old}    Create List
    Click Element    xpath=//div[@class="block_7"]//a[@class="dropdown-toggle"]
    Check product in cart    ${product_names}    ${product_prices}    ${product_links}    ${product_btns}    ${price_old}    ${quantity_old}
    # Edit quantity > 100 in cart
    ${row_index}=    Set Variable    2
    FOR    ${index}    IN RANGE    ${product_btns.__len__()}
        Input Text    xpath=/html/body/div/div[2]/div/div/div/form/div/div[1]/table/tbody/tr[${row_index}]/td[5]/div/input     100
        ${row_index}=    Evaluate    ${row_index} + 1
    END
    Click Button    id=cart_update
    ${row_index}=    Set Variable    2
    FOR    ${index}    IN RANGE    ${product_btns.__len__()}
        ${quantity_new}=    Get Value    xpath=/html/body/div/div[2]/div/div/div/form/div/div[1]/table/tbody/tr[${row_index}]/td[5]/div/input
        Should Be Equal As Numbers    ${quantity_new}     100
        ${price_new}=    Get Text    xpath=//table[@class='table table-striped table-bordered']//tr[${row_index}]//td[6]
        ${price_new}=    Evaluate    "${price_new}".split('$')[-1]
        ${price_new}=    Set Variable    ${price_new.replace(",", "")}
        ${price_new}=    Convert To Number    ${price_new}
        ${price_total}=    Evaluate    ${price_old[${index}]} * ${quantity_new}
        Should Be Equal As Numbers    ${price_total}    ${price_new}
        ${row_index}=    Evaluate    ${row_index} + 1
    END
    # Remove all product
    FOR    ${index}    IN RANGE    ${product_btns.__len__()}
        Click Element    xpath=//table[@class='table table-striped table-bordered']//tr[2]//td[7]
        Page Should Not Contain    ${product_names}[${index}]
    END
    ${cart_empty}=    Get Text    xpath=//div[@class="contentpanel"]
    Should Contain    ${cart_empty}    Your shopping cart is empty!
    Close Browser

*** Keywords ***
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

Check cart item in cart dropdown
    [Arguments]    ${item}    ${price}
    ${item_count}=    Get Text    ${number_item}
    ${cart_total}=    Get Text    ${total_item}
    Should Be Equal As Strings    ${item_count}    ${item}
    Should Contain    ${cart_total}    ${price}

Open homepage and verify cart empty
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Scroll Element Into View    id=block_frame_featured_1769
    Check cart item in cart dropdown    0    $0.00
    Click Element    xpath=//div[@class="block_7"]//a[@class="dropdown-toggle"]
    ${cart_empty}=    Get Text    xpath=//div[@class="contentpanel"]
    Should Contain    ${cart_empty}    Your shopping cart is empty!
    Click Element    xpath=//a[@title="Continue"]

Open homepage login and verify cart empty
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Click Element    xpath=//ul[@id="customer_menu_top"]
    Input Text    id=loginFrm_loginname    kngaan017
    Input Password    id=loginFrm_password    123456
    Click Button    xpath=//*[@id="loginFrm"]/fieldset/button
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
        ${total_price}=    Get Text    xpath=//table[@class='table table-striped table-bordered']//tr[${row_index}]//td[4]
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
