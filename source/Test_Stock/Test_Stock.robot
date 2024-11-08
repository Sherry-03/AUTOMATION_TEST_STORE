*** Settings ***
Library           SeleniumLibrary
Library           Collections

*** Variables ***
${url}            https://automationteststore.com/
${browser}        chrome
${text}           OUT OF STOCK
${btn_outOfStock}    xpath://span[@class='nostock']
${btn_addToCart}    xpath://span[@class='cart']

*** Test Cases ***
TC1_Verify product out of stock in homepage
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Scroll Element Into View    id=block_frame_featured_1769
    #Create list product out of stock
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}
    # Check product detail contains out of stock or not
    FOR    ${index}    IN RANGE    ${product_names.__len__()}
        Click Link    ${product_links}[${index}]
        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${product_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Not Contain Element    ${btn_addToCart}
        Page Should Contain Element    ${btn_outOfStock}
        Page Should Contain Element    id=description
        ${available}=    Get Text    id=description
        Should Contain    ${available}    Out of Stock
        Go Back
    END
    Close Browser

TC2_Verify product out of stock in APPAREL & ACCESSORIES
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Element Should Be Visible    id=categorymenu
    Click Link    xpath://ul[@class="nav-pills categorymenu"]/li[2]/a
    Element Text Should Be    //h1[@class='heading1']    APPAREL & ACCESSORIES
    #Create list product out of stock
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}
    # Check product detail contains out of stock or not
    FOR    ${index}    IN RANGE    ${product_names.__len__()}
        Click Link    ${product_links}[${index}]
        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${product_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Not Contain Element    ${btn_addToCart}
        Page Should Contain Element    ${btn_outOfStock}
        Page Should Contain Element    id=description
        ${available}=    Get Text    id=description
        Should Contain    ${available}    Out of Stock
        Go Back
    END
    Close Browser

TC3_Verify product out of stock in MAKEUP
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Element Should Be Visible    id=categorymenu
    Click Link    xpath://ul[@class="nav-pills categorymenu"]/li[3]/a
    Element Text Should Be    //h1[@class='heading1']    MAKEUP
    #Create list product out of stock
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}
    # Check product detail contains out of stock or not
    FOR    ${index}    IN RANGE    ${product_names.__len__()}
        Click Link    ${product_links}[${index}]
        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${product_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Not Contain Element    ${btn_addToCart}
        Page Should Contain Element    ${btn_outOfStock}
        Page Should Contain Element    id=description
        ${available}=    Get Text    id=description
        Should Contain    ${available}    Out of Stock
        Go Back
    END
    Close Browser

TC4_Verify product out of stock in SKINCARE
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Element Should Be Visible    id=categorymenu
    Click Link    xpath://ul[@class="nav-pills categorymenu"]/li[4]/a
    Element Text Should Be    //h1[@class='heading1']    SKINCARE
    #Create list product out of stock
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}
    # Check product detail contains out of stock or not
    FOR    ${index}    IN RANGE    ${product_names.__len__()}
        Click Link    ${product_links}[${index}]
        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${product_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Not Contain Element    ${btn_addToCart}
        Page Should Contain Element    ${btn_outOfStock}
        Page Should Contain Element    id=description
        ${available}=    Get Text    id=description
        Should Contain    ${available}    Out of Stock
        Go Back
    END
    Close Browser

TC5_Verify product out of stock in FRAGRANCE
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Element Should Be Visible    id=categorymenu
    Click Link    xpath://ul[@class="nav-pills categorymenu"]/li[5]/a
    Element Text Should Be    //h1[@class='heading1']    FRAGRANCE
    #Create list product out of stock
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}
    # Check product detail contains out of stock or not
    FOR    ${index}    IN RANGE    ${product_names.__len__()}
        Click Link    ${product_links}[${index}]
        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${product_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Not Contain Element    ${btn_addToCart}
        Page Should Contain Element    ${btn_outOfStock}
        Page Should Contain Element    id=description
        ${available}=    Get Text    id=description
        Should Contain    ${available}    Out of Stock
        Go Back
    END
    Close Browser

TC6_Verify product out of stock in MEN
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Element Should Be Visible    id=categorymenu
    Click Link    xpath://ul[@class="nav-pills categorymenu"]/li[6]/a
    Element Text Should Be    //h1[@class='heading1']    MEN
    #Create list product out of stock
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}
    # Check product detail contains out of stock or not
    FOR    ${index}    IN RANGE    ${product_names.__len__()}
        Click Link    ${product_links}[${index}]
        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${product_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Not Contain Element    ${btn_addToCart}
        Page Should Contain Element    ${btn_outOfStock}
        Page Should Contain Element    id=description
        ${available}=    Get Text    id=description
        Should Contain    ${available}    Out of Stock
        Go Back
    END
    Close Browser

TC7_Verify product out of stock in HAIR CARE
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Element Should Be Visible    id=categorymenu
    Click Link    xpath://ul[@class="nav-pills categorymenu"]/li[7]/a
    Element Text Should Be    //h1[@class='heading1']    HAIR CARE
    #Create list product out of stock
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}
    # Check product detail contains out of stock or not
    FOR    ${index}    IN RANGE    ${product_names.__len__()}
        Click Link    ${product_links}[${index}]
        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${product_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Not Contain Element    ${btn_addToCart}
        Page Should Contain Element    ${btn_outOfStock}
        Page Should Contain Element    id=description
        ${available}=    Get Text    id=description
        Should Contain    ${available}    Out of Stock
        Go Back
    END
    Close Browser

TC8_Verify product out of stock in BOOKS
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Element Should Be Visible    id=categorymenu
    Click Link    xpath://ul[@class="nav-pills categorymenu"]/li[8]/a
    Element Text Should Be    //h1[@class='heading1']    BOOKS
    #Create list product out of stock
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}
    # Check product detail contains out of stock or not
    FOR    ${index}    IN RANGE    ${product_names.__len__()}
        Click Link    ${product_links}[${index}]
        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${product_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Not Contain Element    ${btn_addToCart}
        Page Should Contain Element    ${btn_outOfStock}
        Page Should Contain Element    id=description
        ${available}=    Get Text    id=description
        Should Contain    ${available}    Out of Stock
        Go Back
    END
    Close Browser

TC9_Verify product out of stock in SPECIAL OFFERS
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Element Should Be Visible    id=categorymenu
    Click Element    xpath=//a[@class="top menu_specials"]
    Element Text Should Be    //h1[@class='heading1']    SPECIAL OFFERS
    #Create list product out of stock
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}
    # Check product detail contains out of stock or not
    FOR    ${index}    IN RANGE    ${product_names.__len__()}
        Click Link    ${product_links}[${index}]
        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${product_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Not Contain Element    ${btn_addToCart}
        Page Should Contain Element    ${btn_outOfStock}
        Page Should Contain Element    id=description
        ${available}=    Get Text    id=description
        Should Contain    ${available}    Out of Stock
        Go Back
    END
    Close Browser

TC10_Verify product out of stock in Brand BENEFIT
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Scroll Element Into View    id=block_frame_listing_block_1774
    Click Link    xpath://ul[@id="brandcarousal"]/li[1]//div[@class="image"]/a
    Element Text Should Be    //h1[@class='heading1']    BENEFIT
    #Create list product out of stock
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}
    # Check product detail contains out of stock or not
    FOR    ${index}    IN RANGE    ${product_names.__len__()}
        Click Link    ${product_links}[${index}]
        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${product_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Not Contain Element    ${btn_addToCart}
        Page Should Contain Element    ${btn_outOfStock}
        Page Should Contain Element    id=description
        ${available}=    Get Text    id=description
        Should Contain    ${available}    Out of Stock
        Go Back
    END
    Close Browser

TC11_Verify product out of stock in Brand PANTENE
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Scroll Element Into View    id=block_frame_listing_block_1774
    Click Link    xpath://ul[@id="brandcarousal"]/li[2]//div[@class="image"]/a
    Element Text Should Be    //h1[@class='heading1']    PANTENE
    #Create list product out of stock
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}
    # Check product detail contains out of stock or not
    FOR    ${index}    IN RANGE    ${product_names.__len__()}
        Click Link    ${product_links}[${index}]
        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${product_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Not Contain Element    ${btn_addToCart}
        Page Should Contain Element    ${btn_outOfStock}
        Page Should Contain Element    id=description
        ${available}=    Get Text    id=description
        Should Contain    ${available}    Out of Stock
        Go Back
    END
    Close Browser

TC12_Verify product out of stock in Brand M·A·C
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Scroll Element Into View    id=block_frame_listing_block_1774
    Click Link    xpath://ul[@id="brandcarousal"]/li[3]//div[@class="image"]/a
    Element Text Should Be    //h1[@class='heading1']    M·A·C
    #Create list product out of stock
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}
    # Check product detail contains out of stock or not
    FOR    ${index}    IN RANGE    ${product_names.__len__()}
        Click Link    ${product_links}[${index}]
        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${product_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Not Contain Element    ${btn_addToCart}
        Page Should Contain Element    ${btn_outOfStock}
        Page Should Contain Element    id=description
        ${available}=    Get Text    id=description
        Should Contain    ${available}    Out of Stock
        Go Back
    END
    Close Browser

TC13_Verify product out of stock in Brand LANCÔME
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Scroll Element Into View    id=block_frame_listing_block_1774
    Click Link    xpath://ul[@id="brandcarousal"]/li[4]//div[@class="image"]/a
    Element Text Should Be    //h1[@class='heading1']    LANCÔME
    #Create list product out of stock
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}
    # Check product detail contains out of stock or not
    FOR    ${index}    IN RANGE    ${product_names.__len__()}
        Click Link    ${product_links}[${index}]
        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${product_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Not Contain Element    ${btn_addToCart}
        Page Should Contain Element    ${btn_outOfStock}
        Page Should Contain Element    id=description
        ${available}=    Get Text    id=description
        Should Contain    ${available}    Out of Stock
        Go Back
    END
    Close Browser

TC14_Verify product out of stock in Brand GUCCI
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Scroll Element Into View    id=block_frame_listing_block_1774
    Click Link    xpath://ul[@id="brandcarousal"]/li[5]//div[@class="image"]/a
    Element Text Should Be    //h1[@class='heading1']    GUCCI
    #Create list product out of stock
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}
    # Check product detail contains out of stock or not
    FOR    ${index}    IN RANGE    ${product_names.__len__()}
        Click Link    ${product_links}[${index}]
        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${product_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Not Contain Element    ${btn_addToCart}
        Page Should Contain Element    ${btn_outOfStock}
        Page Should Contain Element    id=description
        ${available}=    Get Text    id=description
        Should Contain    ${available}    Out of Stock
        Go Back
    END
    Close Browser

TC15_Verify product out of stock in Brand GIORGIO ARMANI
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Scroll Element Into View    id=block_frame_listing_block_1774
    Click Link    xpath://ul[@id="brandcarousal"]/li[6]//div[@class="image"]/a
    Element Text Should Be    //h1[@class='heading1']    GIORGIO ARMANI
    #Create list product out of stock
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}
    # Check product detail contains out of stock or not
    FOR    ${index}    IN RANGE    ${product_names.__len__()}
        Click Link    ${product_links}[${index}]
        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${product_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Not Contain Element    ${btn_addToCart}
        Page Should Contain Element    ${btn_outOfStock}
        Page Should Contain Element    id=description
        ${available}=    Get Text    id=description
        Should Contain    ${available}    Out of Stock
        Go Back
    END
    Close Browser

TC16_Verify product out of stock in Brand DOVE
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Scroll Element Into View    id=block_frame_listing_block_1774
    Click Link    xpath://ul[@id="brandcarousal"]/li[7]//div[@class="image"]/a
    Element Text Should Be    //h1[@class='heading1']    DOVE
    #Create list product out of stock
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}
    # Check product detail contains out of stock or not
    FOR    ${index}    IN RANGE    ${product_names.__len__()}
        Click Link    ${product_links}[${index}]
        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${product_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Not Contain Element    ${btn_addToCart}
        Page Should Contain Element    ${btn_outOfStock}
        Page Should Contain Element    id=description
        ${available}=    Get Text    id=description
        Should Contain    ${available}    Out of Stock
        Go Back
    END
    Close Browser

TC17_Verify product out of stock in Brand CALVIN KLEIN
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Scroll Element Into View    id=block_frame_listing_block_1774
    Click Link    xpath://ul[@id="brandcarousal"]/li[8]//div[@class="image"]/a
    Element Text Should Be    //h1[@class='heading1']    CALVIN KLEIN
    #Create list product out of stock
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}
    # Check product detail contains out of stock or not
    FOR    ${index}    IN RANGE    ${product_names.__len__()}
        Click Link    ${product_links}[${index}]
        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${product_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Not Contain Element    ${btn_addToCart}
        Page Should Contain Element    ${btn_outOfStock}
        Page Should Contain Element    id=description
        ${available}=    Get Text    id=description
        Should Contain    ${available}    Out of Stock
        Go Back
    END
    Close Browser

TC18_Verify product out of stock in Brand BVLGARI
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Scroll Element Into View    id=block_frame_listing_block_1774
    Click Link    xpath://ul[@id="brandcarousal"]/li[9]//div[@class="image"]/a
    Element Text Should Be    //h1[@class='heading1']    BVLGARI
    #Create list product out of stock
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}
    # Check product detail contains out of stock or not
    FOR    ${index}    IN RANGE    ${product_names.__len__()}
        Click Link    ${product_links}[${index}]
        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${product_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Not Contain Element    ${btn_addToCart}
        Page Should Contain Element    ${btn_outOfStock}
        Page Should Contain Element    id=description
        ${available}=    Get Text    id=description
        Should Contain    ${available}    Out of Stock
        Go Back
    END
    Close Browser

TC19_Verify product out of stock in Brand SEPHORA
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Scroll Element Into View    id=block_frame_listing_block_1774
    Click Link    xpath://ul[@id="brandcarousal"]/li[10]//div[@class="image"]/a
    Element Text Should Be    //h1[@class='heading1']    SEPHORA

    #Create list product out of stock
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}
    
    # Check product detail contains out of stock or not
    FOR    ${index}    IN RANGE    ${product_names.__len__()}
        Click Link    ${product_links}[${index}]
        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${product_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Not Contain Element    ${btn_addToCart}
        Page Should Contain Element    ${btn_outOfStock}
        Page Should Contain Element    id=description
        ${available}=    Get Text    id=description
        Should Contain    ${available}    Out of Stock
        Go Back
    END
    Close Browser

TC20_Verify product out of stock in SHOES
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Element Should Be Visible    id=categorymenu
    Click Link    xpath://ul[@class="nav-pills categorymenu"]/li[2]/a
    Click Link    xpath://ul[@class="thumbnails row"]/li[1]/div/a
    Element Text Should Be    //h1[@class='heading1']    SHOES
    
    #Create list product out of stock
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}

    # Check product detail contains out of stock or not
    FOR    ${index}    IN RANGE    ${product_names.__len__()}
        Click Link    ${product_links}[${index}]
        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${product_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Not Contain Element    ${btn_addToCart}
        Page Should Contain Element    ${btn_outOfStock}
        Page Should Contain Element    id=description
        ${available}=    Get Text    id=description
        Should Contain    ${available}    Out of Stock
        Go Back
    END
    Close Browser

TC21_Verify product out of stock in T-SHIRTS
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Element Should Be Visible    id=categorymenu
    Click Link    xpath://ul[@class="nav-pills categorymenu"]/li[2]/a
    Click Link    xpath://ul[@class="thumbnails row"]/li[2]/div/a
    Element Text Should Be    //h1[@class='heading1']    T-SHIRTS
    
    #Create list product out of stock
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}

    # Check product detail contains out of stock or not
    FOR    ${index}    IN RANGE    ${product_names.__len__()}
        Click Link    ${product_links}[${index}]
        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${product_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Not Contain Element    ${btn_addToCart}
        Page Should Contain Element    ${btn_outOfStock}
        Page Should Contain Element    id=description
        ${available}=    Get Text    id=description
        Should Contain    ${available}    Out of Stock
        Go Back
    END
    Close Browser

TC22_Verify product out of stock in CHEEKS
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Element Should Be Visible    id=categorymenu
    Click Link    xpath://ul[@class="nav-pills categorymenu"]/li[3]/a
    Click Link    xpath://ul[@class="thumbnails row"]/li[1]/div/a
    Element Text Should Be    //h1[@class='heading1']    CHEEKS
    #Create list product out of stock
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}
    # Check product detail contains out of stock or not
    FOR    ${index}    IN RANGE    ${product_names.__len__()}
        Click Link    ${product_links}[${index}]
        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${product_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Not Contain Element    ${btn_addToCart}
        Page Should Contain Element    ${btn_outOfStock}
        Page Should Contain Element    id=description
        ${available}=    Get Text    id=description
        Should Contain    ${available}    Out of Stock
        Go Back
    END
    Close Browser

TC23_Verify product out of stock in EYES
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Element Should Be Visible    id=categorymenu
    Click Link    xpath://ul[@class="nav-pills categorymenu"]/li[3]/a
    Click Link    xpath://ul[@class="thumbnails row"]/li[2]/div/a
    Element Text Should Be    //h1[@class='heading1']    EYES
    #Create list product out of stock
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}
    # Check product detail contains out of stock or not
    FOR    ${index}    IN RANGE    ${product_names.__len__()}
        Click Link    ${product_links}[${index}]
        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${product_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Not Contain Element    ${btn_addToCart}
        Page Should Contain Element    ${btn_outOfStock}
        Page Should Contain Element    id=description
        ${available}=    Get Text    id=description
        Should Contain    ${available}    Out of Stock
        Go Back
    END
    Close Browser

TC24_Verify product out of stock in FACE
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Element Should Be Visible    id=categorymenu
    Click Link    xpath://ul[@class="nav-pills categorymenu"]/li[3]/a
    Click Link    xpath://ul[@class="thumbnails row"]/li[3]/div/a
    Element Text Should Be    //h1[@class='heading1']    FACE
    #Create list product out of stock
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}
    # Check product detail contains out of stock or not
    FOR    ${index}    IN RANGE    ${product_names.__len__()}
        Click Link    ${product_links}[${index}]
        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${product_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Not Contain Element    ${btn_addToCart}
        Page Should Contain Element    ${btn_outOfStock}
        Page Should Contain Element    id=description
        ${available}=    Get Text    id=description
        Should Contain    ${available}    Out of Stock
        Go Back
    END
    Close Browser
TC25_Verify product out of stock in LIPS
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Element Should Be Visible    id=categorymenu
    Click Link    xpath://ul[@class="nav-pills categorymenu"]/li[3]/a
    Click Link    xpath://ul[@class="thumbnails row"]/li[4]/div/a
    Element Text Should Be    //h1[@class='heading1']    LIPS
    #Create list product out of stock
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}
    # Check product detail contains out of stock or not
    FOR    ${index}    IN RANGE    ${product_names.__len__()}
        Click Link    ${product_links}[${index}]
        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${product_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Not Contain Element    ${btn_addToCart}
        Page Should Contain Element    ${btn_outOfStock}
        Page Should Contain Element    id=description
        ${available}=    Get Text    id=description
        Should Contain    ${available}    Out of Stock
        Go Back
    END
    Close Browser
TC26_Verify product out of stock in NAILS
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Element Should Be Visible    id=categorymenu
    Click Link    xpath://ul[@class="nav-pills categorymenu"]/li[3]/a
    Click Link    xpath://ul[@class="thumbnails row"]/li[5]/div/a
    Element Text Should Be    //h1[@class='heading1']    NAILS
    #Create list product out of stock
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}
    # Check product detail contains out of stock or not
    FOR    ${index}    IN RANGE    ${product_names.__len__()}
        Click Link    ${product_links}[${index}]
        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${product_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Not Contain Element    ${btn_addToCart}
        Page Should Contain Element    ${btn_outOfStock}
        Page Should Contain Element    id=description
        ${available}=    Get Text    id=description
        Should Contain    ${available}    Out of Stock
        Go Back
    END
    Close Browser

TC27_Verify product out of stock in VALUE SETS
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Element Should Be Visible    id=categorymenu
    Click Link    xpath://ul[@class="nav-pills categorymenu"]/li[3]/a
    Click Link    xpath://ul[@class="thumbnails row"]/li[6]/div/a
    Element Text Should Be    //h1[@class='heading1']    VALUE SETS
    #Create list product out of stock
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}
    # Check product detail contains out of stock or not
    FOR    ${index}    IN RANGE    ${product_names.__len__()}
        Click Link    ${product_links}[${index}]
        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${product_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Not Contain Element    ${btn_addToCart}
        Page Should Contain Element    ${btn_outOfStock}
        Page Should Contain Element    id=description
        ${available}=    Get Text    id=description
        Should Contain    ${available}    Out of Stock
        Go Back
    END
    Close Browser

TC28_Verify product out of stock in EYES
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Element Should Be Visible    id=categorymenu
    Click Link    xpath://ul[@class="nav-pills categorymenu"]/li[4]/a
    Click Link    xpath://ul[@class="thumbnails row"]/li[1]/div/a
    Element Text Should Be    //h1[@class='heading1']    EYES
    #Create list product out of stock
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}
    # Check product detail contains out of stock or not
    FOR    ${index}    IN RANGE    ${product_names.__len__()}
        Click Link    ${product_links}[${index}]
        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${product_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Not Contain Element    ${btn_addToCart}
        Page Should Contain Element    ${btn_outOfStock}
        Page Should Contain Element    id=description
        ${available}=    Get Text    id=description
        Should Contain    ${available}    Out of Stock
        Go Back
    END
    Close Browser

TC29_Verify product out of stock in FACE
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Element Should Be Visible    id=categorymenu
    Click Link    xpath://ul[@class="nav-pills categorymenu"]/li[4]/a
    Click Link    xpath://ul[@class="thumbnails row"]/li[2]/div/a
    Element Text Should Be    //h1[@class='heading1']    FACE
    #Create list product out of stock
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}
    # Check product detail contains out of stock or not
    FOR    ${index}    IN RANGE    ${product_names.__len__()}
        Click Link    ${product_links}[${index}]
        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${product_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Not Contain Element    ${btn_addToCart}
        Page Should Contain Element    ${btn_outOfStock}
        Page Should Contain Element    id=description
        ${available}=    Get Text    id=description
        Should Contain    ${available}    Out of Stock
        Go Back
    END
    Close Browser

TC30_Verify product out of stock in GIFT IDEAS & SETS
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Element Should Be Visible    id=categorymenu
    Click Link    xpath://ul[@class="nav-pills categorymenu"]/li[4]/a
    Click Link    xpath://ul[@class="thumbnails row"]/li[3]/div/a
    Element Text Should Be    //h1[@class='heading1']    GIFT IDEAS & SETS
    #Create list product out of stock
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}
    # Check product detail contains out of stock or not
    FOR    ${index}    IN RANGE    ${product_names.__len__()}
        Click Link    ${product_links}[${index}]
        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${product_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Not Contain Element    ${btn_addToCart}
        Page Should Contain Element    ${btn_outOfStock}
        Page Should Contain Element    id=description
        ${available}=    Get Text    id=description
        Should Contain    ${available}    Out of Stock
        Go Back
    END
    Close Browser

TC31_Verify product out of stock in HANDS & NAILS
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Element Should Be Visible    id=categorymenu
    Click Link    xpath://ul[@class="nav-pills categorymenu"]/li[4]/a
    Click Link    xpath://ul[@class="thumbnails row"]/li[4]/div/a
    Element Text Should Be    //h1[@class='heading1']    HANDS & NAILS
    #Create list product out of stock
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}
    # Check product detail contains out of stock or not
    FOR    ${index}    IN RANGE    ${product_names.__len__()}
        Click Link    ${product_links}[${index}]
        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${product_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Not Contain Element    ${btn_addToCart}
        Page Should Contain Element    ${btn_outOfStock}
        Page Should Contain Element    id=description
        ${available}=    Get Text    id=description
        Should Contain    ${available}    Out of Stock
        Go Back
    END
    Close Browser

TC32_Verify product out of stock in SUN
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Element Should Be Visible    id=categorymenu
    Click Link    xpath://ul[@class="nav-pills categorymenu"]/li[4]/a
    Click Link    xpath://ul[@class="thumbnails row"]/li[5]/div/a
    Element Text Should Be    //h1[@class='heading1']    SUN
    #Create list product out of stock
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}
    # Check product detail contains out of stock or not
    FOR    ${index}    IN RANGE    ${product_names.__len__()}
        Click Link    ${product_links}[${index}]
        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${product_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Not Contain Element    ${btn_addToCart}
        Page Should Contain Element    ${btn_outOfStock}
        Page Should Contain Element    id=description
        ${available}=    Get Text    id=description
        Should Contain    ${available}    Out of Stock
        Go Back
    END
    Close Browser

TC33_Verify product out of stock in MEN
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Element Should Be Visible    id=categorymenu
    Click Link    xpath://ul[@class="nav-pills categorymenu"]/li[5]/a
    Click Link    xpath://ul[@class="thumbnails row"]/li[1]/div/a
    Element Text Should Be    //h1[@class='heading1']    MEN
    #Create list product out of stock
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}
    # Check product detail contains out of stock or not
    FOR    ${index}    IN RANGE    ${product_names.__len__()}
        Click Link    ${product_links}[${index}]
        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${product_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Not Contain Element    ${btn_addToCart}
        Page Should Contain Element    ${btn_outOfStock}
        Page Should Contain Element    id=description
        ${available}=    Get Text    id=description
        Should Contain    ${available}    Out of Stock
        Go Back
    END
    Close Browser

TC34_Verify product out of stock in WOMEN
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Element Should Be Visible    id=categorymenu
    Click Link    xpath://ul[@class="nav-pills categorymenu"]/li[5]/a
    Click Link    xpath://ul[@class="thumbnails row"]/li[2]/div/a
    Element Text Should Be    //h1[@class='heading1']    WOMEN
    #Create list product out of stock
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}
    # Check product detail contains out of stock or not
    FOR    ${index}    IN RANGE    ${product_names.__len__()}
        Click Link    ${product_links}[${index}]
        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${product_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Not Contain Element    ${btn_addToCart}
        Page Should Contain Element    ${btn_outOfStock}
        Page Should Contain Element    id=description
        ${available}=    Get Text    id=description
        Should Contain    ${available}    Out of Stock
        Go Back
    END
    Close Browser

TC35_Verify product out of stock in BODY & SHOWER
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Element Should Be Visible    id=categorymenu
    Click Link    xpath://ul[@class="nav-pills categorymenu"]/li[6]/a
    Click Link    xpath://ul[@class="thumbnails row"]/li[1]/div/a
    Element Text Should Be    //h1[@class='heading1']    BODY & SHOWER

    #Create list product out of stock
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}
    # Check product detail contains out of stock or not
    FOR    ${index}    IN RANGE    ${product_names.__len__()}
        Click Link    ${product_links}[${index}]
        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${product_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Not Contain Element    ${btn_addToCart}
        Page Should Contain Element    ${btn_outOfStock}
        Page Should Contain Element    id=description
        ${available}=    Get Text    id=description
        Should Contain    ${available}    Out of Stock
        Go Back
    END
    Close Browser

TC36_Verify product out of stock in FRAGRANCE SETS
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Element Should Be Visible    id=categorymenu
    Click Link    xpath://ul[@class="nav-pills categorymenu"]/li[6]/a
    Click Link    xpath://ul[@class="thumbnails row"]/li[2]/div/a
    Element Text Should Be    //h1[@class='heading1']    FRAGRANCE SETS

    #Create list product out of stock
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}
    # Check product detail contains out of stock or not
    FOR    ${index}    IN RANGE    ${product_names.__len__()}
        Click Link    ${product_links}[${index}]
        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${product_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Not Contain Element    ${btn_addToCart}
        Page Should Contain Element    ${btn_outOfStock}
        Page Should Contain Element    id=description
        ${available}=    Get Text    id=description
        Should Contain    ${available}    Out of Stock
        Go Back
    END
    Close Browser

TC37_Verify product out of stock in PRE-SHAVE & SHAVING
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Element Should Be Visible    id=categorymenu
    Click Link    xpath://ul[@class="nav-pills categorymenu"]/li[6]/a
    Click Link    xpath://ul[@class="thumbnails row"]/li[3]/div/a
    Element Text Should Be    //h1[@class='heading1']    PRE-SHAVE & SHAVING

    #Create list product out of stock
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}
    # Check product detail contains out of stock or not
    FOR    ${index}    IN RANGE    ${product_names.__len__()}
        Click Link    ${product_links}[${index}]
        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${product_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Not Contain Element    ${btn_addToCart}
        Page Should Contain Element    ${btn_outOfStock}
        Page Should Contain Element    id=description
        ${available}=    Get Text    id=description
        Should Contain    ${available}    Out of Stock
        Go Back
    END
    Close Browser

TC38_Verify product out of stock in SKINCARE
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Element Should Be Visible    id=categorymenu
    Click Link    xpath://ul[@class="nav-pills categorymenu"]/li[6]/a
    Click Link    xpath://ul[@class="thumbnails row"]/li[4]/div/a
    Element Text Should Be    //h1[@class='heading1']    SKINCARE

    #Create list product out of stock
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}
    # Check product detail contains out of stock or not
    FOR    ${index}    IN RANGE    ${product_names.__len__()}
        Click Link    ${product_links}[${index}]
        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${product_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Not Contain Element    ${btn_addToCart}
        Page Should Contain Element    ${btn_outOfStock}
        Page Should Contain Element    id=description
        ${available}=    Get Text    id=description
        Should Contain    ${available}    Out of Stock
        Go Back
    END
    Close Browser

TC39_Verify product out of stock in CONDITIONER
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Element Should Be Visible    id=categorymenu
    Click Link    xpath://ul[@class="nav-pills categorymenu"]/li[7]/a
    Click Link    xpath://ul[@class="thumbnails row"]/li[1]/div/a
    Element Text Should Be    //h1[@class='heading1']    CONDITIONER

    #Create list product out of stock
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}
    # Check product detail contains out of stock or not
    FOR    ${index}    IN RANGE    ${product_names.__len__()}
        Click Link    ${product_links}[${index}]
        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${product_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Not Contain Element    ${btn_addToCart}
        Page Should Contain Element    ${btn_outOfStock}
        Page Should Contain Element    id=description
        ${available}=    Get Text    id=description
        Should Contain    ${available}    Out of Stock
        Go Back
    END
    Close Browser

TC40_Verify product out of stock in SHAMPOO
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Element Should Be Visible    id=categorymenu
    Click Link    xpath://ul[@class="nav-pills categorymenu"]/li[7]/a
    Click Link    xpath://ul[@class="thumbnails row"]/li[2]/div/a
    Element Text Should Be    //h1[@class='heading1']    SHAMPOO

    #Create list product out of stock
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}
    # Check product detail contains out of stock or not
    FOR    ${index}    IN RANGE    ${product_names.__len__()}
        Click Link    ${product_links}[${index}]
        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${product_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Not Contain Element    ${btn_addToCart}
        Page Should Contain Element    ${btn_outOfStock}
        Page Should Contain Element    id=description
        ${available}=    Get Text    id=description
        Should Contain    ${available}    Out of Stock
        Go Back
    END
    Close Browser

TC41_Verify product out of stock in AUDIO CD
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Element Should Be Visible    id=categorymenu
    Click Link    xpath://ul[@class="nav-pills categorymenu"]/li[8]/a
    Click Link    xpath://ul[@class="thumbnails row"]/li[1]/div/a
    Element Text Should Be    //h1[@class='heading1']    AUDIO CD

    #Create list product out of stock
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}
    # Check product detail contains out of stock or not
    FOR    ${index}    IN RANGE    ${product_names.__len__()}
        Click Link    ${product_links}[${index}]
        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${product_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Not Contain Element    ${btn_addToCart}
        Page Should Contain Element    ${btn_outOfStock}
        Page Should Contain Element    id=description
        ${available}=    Get Text    id=description
        Should Contain    ${available}    Out of Stock
        Go Back
    END
    Close Browser

TC42_Verify product out of stock in PAPERBACK
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Element Should Be Visible    id=categorymenu
    Click Link    xpath://ul[@class="nav-pills categorymenu"]/li[8]/a
    Click Link    xpath://ul[@class="thumbnails row"]/li[2]/div/a
    Element Text Should Be    //h1[@class='heading1']    PAPERBACK

    #Create list product out of stock
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}
    # Check product detail contains out of stock or not
    FOR    ${index}    IN RANGE    ${product_names.__len__()}
        Click Link    ${product_links}[${index}]
        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${product_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Not Contain Element    ${btn_addToCart}
        Page Should Contain Element    ${btn_outOfStock}
        Page Should Contain Element    id=description
        ${available}=    Get Text    id=description
        Should Contain    ${available}    Out of Stock
        Go Back
    END
    Close Browser
*** Keywords ***
Process Price
    [Arguments]    ${price}
    ${processed_price}=    Set Variable    ${price.split("\n")[0]}
    RETURN    ${processed_price}

*** Keywords ***
Create List Product
    [Arguments]    ${product_names}    ${product_prices}    ${product_links}
    @{outOfStock}=    Get WebElements    xpath=//div[@class='pricetag jumbotron']
    @{price_elements}=    Get WebElements    xpath=//div[@class='price']
    @{product_elements}=    Get WebElements    xpath=//a[@class='prdocutname']
    FOR    ${i}    IN RANGE    ${outOfStock.__len__()}
        ${product_name}=    Get Text    ${product_elements}[${i}]
        ${product_link}=    Get Element Attribute    ${product_elements}[${i}]    href
        ${product_price}=    Get Text    ${price_elements}[${i}]
        ${processed_price}=    Process Price    ${product_price}
        ${product_stock}=    Get Text    ${outOfStock}[${i}]
        ${contains_text}=    Run Keyword And Return Status    Should Contain    ${product_stock}    ${text}
        Run Keyword If    ${contains_text}    Append To Lists    ${product_names}    ${product_prices}    ${product_links}    ${product_name}    ${processed_price}    ${product_link}
    END

Append To Lists
    [Arguments]    ${product_names}    ${product_prices}    ${product_links}    ${name}    ${price}    ${link}
    Append To List    ${product_names}    ${name}
    Append To List    ${product_prices}    ${price}
    Append To List    ${product_links}    ${link}
