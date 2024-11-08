*** Settings ***
Library           SeleniumLibrary
Library           Collections
Library    String
Library    BuiltIn

*** Variables ***
${url}            https://automationteststore.com/
${browser}        chrome
${exchange_euro}    0.9385
${exchange_pound}    0.7934
${exchange_euro_pound}    0.8459

*** Test Cases ***
TC1_Verify change US DOLLAR to EURO in homepage
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Check currency current    $    

    #Create list product
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}

    #Currency exchange: US DOLLAR -> EURO
    Mouse Over    xpath=/html/body/div/header/div[2]/div/div[2]/ul/li/a/span/span
    Click Element    xpath=/html/body/div/header/div[2]/div/div[2]/ul/li/ul/li[1]/a
    Check currency current    €
    
    #Create list price EURO
    ${convert_names}    Create List
    ${convert_prices}    Create List
    ${convert_links}    Create List
    Create list product    ${convert_names}    ${convert_prices}    ${convert_links}

    #Check price
    FOR    ${index}    IN RANGE    ${convert_prices.__len__()}
        ${price}=    Evaluate    "${product_prices}[${index}]".split('$')[-1]   
        ${price}=    Convert To Number    ${price}
        ${price}=         Evaluate    ${price} * ${exchange_euro}
        ${price}=    Round Number    ${price}    2
        ${convert_price}=    Evaluate    "${convert_prices}[${index}]".strip('€')
        ${convert_price}=    Convert To Number    ${convert_price}
        Should Be Equal As Numbers    ${convert_price}    ${price}
        Go Back
    END

    #Check price in product detail
    FOR    ${index}    IN RANGE    ${convert_names.__len__()}
        Go To    ${product_links}[${index}]
        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${convert_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${convert_prices[${index}].strip()}
        Page Should Contain Element    id=description
        Go Back
    END

    Close Browser

TC2_Verify change US DOLLAR to POUND STERLING in APPAREL & ACCESSORIES
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Element Should Be Visible    id=categorymenu
    Click Link    xpath://ul[@class="nav-pills categorymenu"]/li[2]/a
    Element Text Should Be    //h1[@class='heading1']    APPAREL & ACCESSORIES
    Check currency current    $    

    #Create list product
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}

    #Currency exchange: US DOLLAR -> POUND STERLING 
    Mouse Over    xpath=/html/body/div/header/div[2]/div/div[2]/ul/li/a/span/span
    Click Element    xpath=/html/body/div/header/div[2]/div/div[2]/ul/li/ul/li[2]/a
    Check currency current    £
    
    #Create list price EURO
    ${convert_names}    Create List
    ${convert_prices}    Create List
    ${convert_links}    Create List
    Create list product    ${convert_names}    ${convert_prices}    ${convert_links}

    #Check price
    FOR    ${index}    IN RANGE    ${convert_prices.__len__()}
        ${price}=    Evaluate    "${product_prices}[${index}]".split('$')[-1]   
        ${price}=    Convert To Number    ${price}
        ${price}=         Evaluate    ${price} * ${exchange_pound}
        ${price}=    Round Number    ${price}    2
        ${convert_price}=    Evaluate    "${convert_prices}[${index}]".split('£')[-1] 
        ${convert_price}=    Convert To Number    ${convert_price}
        Check Approximately Equal    ${convert_price}    ${price}    0.2
        Go Back
    END

    #Check price in product detail
    FOR    ${index}    IN RANGE    ${convert_prices.__len__()}
        Go To    ${product_links}[${index}]
        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${convert_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${convert_prices[${index}].strip()}
        Page Should Contain Element    id=description
        Go Back
    END

    Close Browser
TC3_Verify change EURO to POUND STERLING in MAKEUP
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Element Should Be Visible    id=categorymenu
    Click Link    xpath://ul[@class="nav-pills categorymenu"]/li[3]/a
    Element Text Should Be    //h1[@class='heading1']    MAKEUP
    Check currency current    $    

    #Currency exchange: US DOLLAR -> EURO
    Mouse Over    xpath=/html/body/div/header/div[2]/div/div[2]/ul/li/a/span/span
    Click Element    xpath=/html/body/div/header/div[2]/div/div[2]/ul/li/ul/li[1]/a
    Check currency current    €

    #Create list price EURO
    ${convert_names}    Create List
    ${convert_prices}    Create List
    ${convert_links}    Create List
    Create list product    ${convert_names}    ${convert_prices}    ${convert_links}

    #Currency exchange: EURO -> POUND STERLING 
    Mouse Over    xpath=/html/body/div/header/div[2]/div/div[2]/ul/li/a/span/span
    Click Element    xpath=/html/body/div/header/div[2]/div/div[2]/ul/li/ul/li[2]/a
    Check currency current    £

    #Create list price POUND STERLING 
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}

    #Check price
    FOR    ${index}    IN RANGE    ${convert_prices.__len__()}
        ${price}=    Evaluate    "${convert_prices}[${index}]".strip('€') 
        ${price}=    Convert To Number    ${price}
        ${price}=         Evaluate    ${price} * ${exchange_euro_pound}
        ${price}=    Round Number    ${price}    2
        ${convert_price}=    Evaluate    "${product_prices}[${index}]".split('£')[-1]   
        ${convert_price}=    Convert To Number    ${convert_price}
        Check Approximately Equal    ${convert_price}    ${price}    0.2
        Go Back
    END

    #Check price in product detail
    FOR    ${index}    IN RANGE    ${convert_prices.__len__()}
        Go To    ${product_links}[${index}]
        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${convert_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${convert_prices[${index}].strip()}
        Page Should Contain Element    id=description
        Go Back
    END

    Close Browser

TC4_Verify change US DOLLAR to EURO in SKINCARE
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Element Should Be Visible    id=categorymenu
    Click Link    xpath://ul[@class="nav-pills categorymenu"]/li[4]/a
    Element Text Should Be    //h1[@class='heading1']    SKINCARE
    Check currency current    $    

    #Create list product
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}

    #Currency exchange: US DOLLAR -> EURO
    Mouse Over    xpath=/html/body/div/header/div[2]/div/div[2]/ul/li/a/span/span
    Click Element    xpath=/html/body/div/header/div[2]/div/div[2]/ul/li/ul/li[1]/a
    Check currency current    €
    
    #Create list price EURO
    ${convert_names}    Create List
    ${convert_prices}    Create List
    ${convert_links}    Create List
    Create list product    ${convert_names}    ${convert_prices}    ${convert_links}

    #Check price
    FOR    ${index}    IN RANGE    ${convert_prices.__len__()}
        ${price}=    Evaluate    "${product_prices}[${index}]".split('$')[-1]   
        ${price}=    Convert To Number    ${price}
        ${price}=         Evaluate    ${price} * ${exchange_euro}
        ${price}=    Round Number    ${price}    2
        ${convert_price}=    Evaluate    "${convert_prices}[${index}]".strip('€')
        ${convert_price}=    Convert To Number    ${convert_price}
        Should Be Equal As Numbers    ${convert_price}    ${price}
        Go Back
    END

    #Check price in product detail
    FOR    ${index}    IN RANGE    ${convert_prices.__len__()}
        Go To    ${product_links}[${index}]
        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${convert_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${convert_prices[${index}].strip()}
        Page Should Contain Element    id=description
        Go Back
    END

    Close Browser

TC5_Verify change US DOLLAR to POUND STERLING in FRAGRANCE
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Element Should Be Visible    id=categorymenu
    Click Link    xpath://ul[@class="nav-pills categorymenu"]/li[5]/a
    Element Text Should Be    //h1[@class='heading1']    FRAGRANCE
    Check currency current    $    

    #Create list product
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}

    #Currency exchange: US DOLLAR -> POUND STERLING 
    Mouse Over    xpath=/html/body/div/header/div[2]/div/div[2]/ul/li/a/span/span
    Click Element    xpath=/html/body/div/header/div[2]/div/div[2]/ul/li/ul/li[2]/a
    Check currency current    £
    
    #Create list price EURO
    ${convert_names}    Create List
    ${convert_prices}    Create List
    ${convert_links}    Create List
    Create list product    ${convert_names}    ${convert_prices}    ${convert_links}

    #Check price
    FOR    ${index}    IN RANGE    ${convert_prices.__len__()}
        ${price}=    Evaluate    "${product_prices}[${index}]".split('$')[-1]   
        ${price}=    Convert To Number    ${price}
        ${price}=         Evaluate    ${price} * ${exchange_pound}
        ${price}=    Round Number    ${price}    2
        ${convert_price}=    Evaluate    "${convert_prices}[${index}]".split('£')[-1]    
        ${convert_price}=    Convert To Number    ${convert_price}
        Check Approximately Equal    ${convert_price}    ${price}    0.2
        Go Back
    END

    #Check price in product detail
    FOR    ${index}    IN RANGE    ${convert_prices.__len__()}
        Go To    ${product_links}[${index}]
        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${convert_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${convert_prices[${index}].strip()}
        Page Should Contain Element    id=description
        Go Back
    END

    Close Browser

TC6_Verify change EURO to POUND STERLING in MEN
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Element Should Be Visible    id=categorymenu
    Click Link    xpath://ul[@class="nav-pills categorymenu"]/li[6]/a
    Element Text Should Be    //h1[@class='heading1']    MEN
    Check currency current    $    

    #Currency exchange: US DOLLAR -> EURO
    Mouse Over    xpath=/html/body/div/header/div[2]/div/div[2]/ul/li/a/span/span
    Click Element    xpath=/html/body/div/header/div[2]/div/div[2]/ul/li/ul/li[1]/a
    Check currency current    €

    #Create list price EURO
    ${convert_names}    Create List
    ${convert_prices}    Create List
    ${convert_links}    Create List
    Create list product    ${convert_names}    ${convert_prices}    ${convert_links}

    #Currency exchange: EURO -> POUND STERLING 
    Mouse Over    xpath=/html/body/div/header/div[2]/div/div[2]/ul/li/a/span/span
    Click Element    xpath=/html/body/div/header/div[2]/div/div[2]/ul/li/ul/li[2]/a
    Check currency current    £

    #Create list price POUND STERLING 
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}

    #Check price
    FOR    ${index}    IN RANGE    ${convert_prices.__len__()}
        ${price}=    Evaluate    "${convert_prices}[${index}]".strip('€') 
        ${price}=    Convert To Number    ${price}
        ${price}=         Evaluate    ${price} * ${exchange_euro_pound}
        ${price}=    Round Number    ${price}    2
        ${convert_price}=    Evaluate    "${product_prices}[${index}]".split('£')[-1]   
        ${convert_price}=    Convert To Number    ${convert_price}
        Check Approximately Equal    ${convert_price}    ${price}    0.2
        Go Back
    END

    #Check price in product detail
    FOR    ${index}    IN RANGE    ${convert_prices.__len__()}
        Go To    ${product_links}[${index}]
        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${convert_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${convert_prices[${index}].strip()}
        Page Should Contain Element    id=description
        Go Back
    END

    Close Browser

TC7_Verify change US DOLLAR to EURO in HAIR CARE
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Element Should Be Visible    id=categorymenu
    Click Link    xpath://ul[@class="nav-pills categorymenu"]/li[7]/a
    Element Text Should Be    //h1[@class='heading1']    HAIR CARE
    Check currency current    $    

    #Create list product
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}

    #Currency exchange: US DOLLAR -> EURO
    Mouse Over    xpath=/html/body/div/header/div[2]/div/div[2]/ul/li/a/span/span
    Click Element    xpath=/html/body/div/header/div[2]/div/div[2]/ul/li/ul/li[1]/a
    Check currency current    €
    
    #Create list price EURO
    ${convert_names}    Create List
    ${convert_prices}    Create List
    ${convert_links}    Create List
    Create list product    ${convert_names}    ${convert_prices}    ${convert_links}

    #Check price
    FOR    ${index}    IN RANGE    ${convert_prices.__len__()}
        ${price}=    Evaluate    "${product_prices}[${index}]".split('$')[-1]   
        ${price}=    Convert To Number    ${price}
        ${price}=         Evaluate    ${price} * ${exchange_euro}
        ${price}=    Round Number    ${price}    2
        ${convert_price}=    Evaluate    "${convert_prices}[${index}]".strip('€')
        ${convert_price}=    Convert To Number    ${convert_price}
        Should Be Equal As Numbers    ${convert_price}    ${price}
        Go Back
    END

    #Check price in product detail
    FOR    ${index}    IN RANGE    ${convert_prices.__len__()}
        Go To    ${product_links}[${index}]
        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${convert_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${convert_prices[${index}].strip()}
        Page Should Contain Element    id=description
        Go Back
    END

    Close Browser

TC8_Verify change US DOLLAR to POUND STERLING in BOOKS
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Element Should Be Visible    id=categorymenu
    Click Link    xpath://ul[@class="nav-pills categorymenu"]/li[8]/a
    Element Text Should Be    //h1[@class='heading1']    BOOKS
    Check currency current    $    

    #Create list product
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}

    #Currency exchange: US DOLLAR -> POUND STERLING 
    Mouse Over    xpath=/html/body/div/header/div[2]/div/div[2]/ul/li/a/span/span
    Click Element    xpath=/html/body/div/header/div[2]/div/div[2]/ul/li/ul/li[2]/a
    Check currency current    £
    
    #Create list price EURO
    ${convert_names}    Create List
    ${convert_prices}    Create List
    ${convert_links}    Create List
    Create list product    ${convert_names}    ${convert_prices}    ${convert_links}

    #Check price
    FOR    ${index}    IN RANGE    ${convert_prices.__len__()}
        ${price}=    Evaluate    "${product_prices}[${index}]".split('$')[-1]   
        ${price}=    Convert To Number    ${price}
        ${price}=         Evaluate    ${price} * ${exchange_pound}
        ${price}=    Round Number    ${price}    2
        ${convert_price}=    Evaluate    "${convert_prices}[${index}]".split('£')[-1]    
        ${convert_price}=    Convert To Number    ${convert_price}
        Check Approximately Equal    ${convert_price}    ${price}    0.2
        Go Back
    END

    #Check price in product detail
    FOR    ${index}    IN RANGE    ${convert_prices.__len__()}
        Go To    ${product_links}[${index}]
        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${convert_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${convert_prices[${index}].strip()}
        Page Should Contain Element    id=description
        Go Back
    END

    Close Browser

TC9_Verify change EURO to POUND STERLING in SPECIAL OFFERS
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Element Should Be Visible    id=categorymenu
    Click Element    xpath=//a[@class="top menu_specials"]
    Element Text Should Be    //h1[@class='heading1']    SPECIAL OFFERS

    Check currency current    $    

    #Currency exchange: US DOLLAR -> EURO
    Mouse Over    xpath=/html/body/div/header/div[2]/div/div[2]/ul/li/a/span/span
    Click Element    xpath=/html/body/div/header/div[2]/div/div[2]/ul/li/ul/li[1]/a
    Check currency current    €

    #Create list price EURO
    ${convert_names}    Create List
    ${convert_prices}    Create List
    ${convert_links}    Create List
    Create list product    ${convert_names}    ${convert_prices}    ${convert_links}

    #Currency exchange: EURO -> POUND STERLING 
    Mouse Over    xpath=/html/body/div/header/div[2]/div/div[2]/ul/li/a/span/span
    Click Element    xpath=/html/body/div/header/div[2]/div/div[2]/ul/li/ul/li[2]/a
    Check currency current    £

    #Create list price POUND STERLING 
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}

    #Check price
    FOR    ${index}    IN RANGE    ${convert_prices.__len__()}
        ${price}=    Evaluate    "${convert_prices}[${index}]".strip('€') 
        ${price}=    Convert To Number    ${price}
        ${price}=         Evaluate    ${price} * ${exchange_euro_pound}
        ${price}=    Round Number    ${price}    2
        ${convert_price}=    Evaluate    "${product_prices}[${index}]".split('£')[-1]   
        ${convert_price}=    Convert To Number    ${convert_price}
        Check Approximately Equal    ${convert_price}    ${price}    0.2
        Go Back
    END

    #Check price in product detail
    FOR    ${index}    IN RANGE    ${convert_prices.__len__()}
        Go To    ${product_links}[${index}]
        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${convert_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${convert_prices[${index}].strip()}
        Page Should Contain Element    id=description
        Go Back
    END

    Close Browser

TC10_Verify change US DOLLAR to EURO in BENEFIT
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Scroll Element Into View    id=block_frame_listing_block_1774
    Click Link    xpath://ul[@id="brandcarousal"]/li[1]//div[@class="image"]/a
    Element Text Should Be    //h1[@class='heading1']    BENEFIT
    Check currency current    $    

    #Create list product
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}

    #Currency exchange: US DOLLAR -> EURO
    Mouse Over    xpath=/html/body/div/header/div[2]/div/div[2]/ul/li/a/span/span
    Click Element    xpath=/html/body/div/header/div[2]/div/div[2]/ul/li/ul/li[1]/a
    Check currency current    €
    
    #Create list price EURO
    ${convert_names}    Create List
    ${convert_prices}    Create List
    ${convert_links}    Create List
    Create list product    ${convert_names}    ${convert_prices}    ${convert_links}

    #Check price
    FOR    ${index}    IN RANGE    ${convert_prices.__len__()}
        ${price}=    Evaluate    "${product_prices}[${index}]".split('$')[-1]   
        ${price}=    Convert To Number    ${price}
        ${price}=         Evaluate    ${price} * ${exchange_euro}
        ${price}=    Round Number    ${price}    2
        ${convert_price}=    Evaluate    "${convert_prices}[${index}]".strip('€')
        ${convert_price}=    Convert To Number    ${convert_price}
        Should Be Equal As Numbers    ${convert_price}    ${price}
        Go Back
    END

    #Check price in product detail
    FOR    ${index}    IN RANGE    ${convert_prices.__len__()}
        Go To    ${product_links}[${index}]
        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${convert_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${convert_prices[${index}].strip()}
        Page Should Contain Element    id=description
        Go Back
    END

    Close Browser

TC11_Verify change US DOLLAR to POUND STERLING in PANTENE
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Scroll Element Into View    id=block_frame_listing_block_1774
    Click Link    xpath://ul[@id="brandcarousal"]/li[2]//div[@class="image"]/a
    Element Text Should Be    //h1[@class='heading1']    PANTENE
    Check currency current    $    

    #Create list product
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}

    #Currency exchange: US DOLLAR -> POUND STERLING 
    Mouse Over    xpath=/html/body/div/header/div[2]/div/div[2]/ul/li/a/span/span
    Click Element    xpath=/html/body/div/header/div[2]/div/div[2]/ul/li/ul/li[2]/a
    Check currency current    £
    
    #Create list price EURO
    ${convert_names}    Create List
    ${convert_prices}    Create List
    ${convert_links}    Create List
    Create list product    ${convert_names}    ${convert_prices}    ${convert_links}

    #Check price
    FOR    ${index}    IN RANGE    ${convert_prices.__len__()}
        ${price}=    Evaluate    "${product_prices}[${index}]".split('$')[-1]   
        ${price}=    Convert To Number    ${price}
        ${price}=         Evaluate    ${price} * ${exchange_pound}
        ${price}=    Round Number    ${price}    2
        ${convert_price}=    Evaluate    "${convert_prices}[${index}]".split('£')[-1]    
        ${convert_price}=    Convert To Number    ${convert_price}
        Check Approximately Equal    ${convert_price}    ${price}    0.2
        Go Back
    END

    #Check price in product detail
    FOR    ${index}    IN RANGE    ${convert_prices.__len__()}
        Go To    ${product_links}[${index}]
        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${convert_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${convert_prices[${index}].strip()}
        Page Should Contain Element    id=description
        Go Back
    END

    Close Browser

TC12_Verify change EURO to POUND STERLING in M·A·C
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Scroll Element Into View    id=block_frame_listing_block_1774
    Click Link    xpath://ul[@id="brandcarousal"]/li[3]//div[@class="image"]/a
    Element Text Should Be    //h1[@class='heading1']    M·A·C


    Check currency current    $    

    #Currency exchange: US DOLLAR -> EURO
    Mouse Over    xpath=/html/body/div/header/div[2]/div/div[2]/ul/li/a/span/span
    Click Element    xpath=/html/body/div/header/div[2]/div/div[2]/ul/li/ul/li[1]/a
    Check currency current    €

    #Create list price EURO
    ${convert_names}    Create List
    ${convert_prices}    Create List
    ${convert_links}    Create List
    Create list product    ${convert_names}    ${convert_prices}    ${convert_links}

    #Currency exchange: EURO -> POUND STERLING 
    Mouse Over    xpath=/html/body/div/header/div[2]/div/div[2]/ul/li/a/span/span
    Click Element    xpath=/html/body/div/header/div[2]/div/div[2]/ul/li/ul/li[2]/a
    Check currency current    £

    #Create list price POUND STERLING 
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}

    #Check price
    FOR    ${index}    IN RANGE    ${convert_prices.__len__()}
        ${price}=    Evaluate    "${convert_prices}[${index}]".strip('€') 
        ${price}=    Convert To Number    ${price}
        ${price}=         Evaluate    ${price} * ${exchange_euro_pound}
        ${price}=    Round Number    ${price}    2
        ${convert_price}=    Evaluate    "${product_prices}[${index}]".split('£')[-1]   
        ${convert_price}=    Convert To Number    ${convert_price}
        Check Approximately Equal    ${convert_price}    ${price}    0.2
        Go Back
    END

    #Check price in product detail
    FOR    ${index}    IN RANGE    ${convert_prices.__len__()}
        Go To    ${product_links}[${index}]
        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${convert_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${convert_prices[${index}].strip()}
        Page Should Contain Element    id=description
        Go Back
    END

    Close Browser

TC13_Verify change US DOLLAR to EURO in LANCÔME
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Scroll Element Into View    id=block_frame_listing_block_1774
    Click Link    xpath://ul[@id="brandcarousal"]/li[4]//div[@class="image"]/a
    Element Text Should Be    //h1[@class='heading1']    LANCÔME
    Check currency current    $    

    #Create list product
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}

    #Currency exchange: US DOLLAR -> EURO
    Mouse Over    xpath=/html/body/div/header/div[2]/div/div[2]/ul/li/a/span/span
    Click Element    xpath=/html/body/div/header/div[2]/div/div[2]/ul/li/ul/li[1]/a
    Check currency current    €
    
    #Create list price EURO
    ${convert_names}    Create List
    ${convert_prices}    Create List
    ${convert_links}    Create List
    Create list product    ${convert_names}    ${convert_prices}    ${convert_links}

    #Check price
    FOR    ${index}    IN RANGE    ${convert_prices.__len__()}
        ${price}=    Evaluate    "${product_prices}[${index}]".split('$')[-1]   
        ${price}=    Convert To Number    ${price}
        ${price}=         Evaluate    ${price} * ${exchange_euro}
        ${price}=    Round Number    ${price}    2
        ${convert_price}=    Evaluate    "${convert_prices}[${index}]".strip('€')
        ${convert_price}=    Convert To Number    ${convert_price}
        Should Be Equal As Numbers    ${convert_price}    ${price}
        Go Back
    END

    #Check price in product detail
    FOR    ${index}    IN RANGE    ${convert_prices.__len__()}
        Go To    ${product_links}[${index}]
        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${convert_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${convert_prices[${index}].strip()}
        Page Should Contain Element    id=description
        Go Back
    END

    Close Browser

TC14_Verify change US DOLLAR to POUND STERLING in GUCCI
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Scroll Element Into View    id=block_frame_listing_block_1774
    Click Link    xpath://ul[@id="brandcarousal"]/li[5]//div[@class="image"]/a
    Element Text Should Be    //h1[@class='heading1']    GUCCI
    Check currency current    $    

    #Create list product
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}

    #Currency exchange: US DOLLAR -> POUND STERLING 
    Mouse Over    xpath=/html/body/div/header/div[2]/div/div[2]/ul/li/a/span/span
    Click Element    xpath=/html/body/div/header/div[2]/div/div[2]/ul/li/ul/li[2]/a
    Check currency current    £
    
    #Create list price EURO
    ${convert_names}    Create List
    ${convert_prices}    Create List
    ${convert_links}    Create List
    Create list product    ${convert_names}    ${convert_prices}    ${convert_links}

    #Check price
    FOR    ${index}    IN RANGE    ${convert_prices.__len__()}
        ${price}=    Evaluate    "${product_prices}[${index}]".split('$')[-1]   
        ${price}=    Convert To Number    ${price}
        ${price}=         Evaluate    ${price} * ${exchange_pound}
        ${price}=    Round Number    ${price}    2
        ${convert_price}=    Evaluate    "${convert_prices}[${index}]".split('£')[-1]    
        ${convert_price}=    Convert To Number    ${convert_price}
        Check Approximately Equal    ${convert_price}    ${price}    0.2
        Go Back
    END

    #Check price in product detail
    FOR    ${index}    IN RANGE    ${convert_prices.__len__()}
        Go To    ${product_links}[${index}]
        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${convert_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${convert_prices[${index}].strip()}
        Page Should Contain Element    id=description
        Go Back
    END

    Close Browser

TC15_Verify change EURO to POUND STERLING in GIORGIO ARMANI
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Scroll Element Into View    id=block_frame_listing_block_1774
    Click Link    xpath://ul[@id="brandcarousal"]/li[6]//div[@class="image"]/a
    Element Text Should Be    //h1[@class='heading1']    GIORGIO ARMANI


    Check currency current    $    

    #Currency exchange: US DOLLAR -> EURO
    Mouse Over    xpath=/html/body/div/header/div[2]/div/div[2]/ul/li/a/span/span
    Click Element    xpath=/html/body/div/header/div[2]/div/div[2]/ul/li/ul/li[1]/a
    Check currency current    €

    #Create list price EURO
    ${convert_names}    Create List
    ${convert_prices}    Create List
    ${convert_links}    Create List
    Create list product    ${convert_names}    ${convert_prices}    ${convert_links}

    #Currency exchange: EURO -> POUND STERLING 
    Mouse Over    xpath=/html/body/div/header/div[2]/div/div[2]/ul/li/a/span/span
    Click Element    xpath=/html/body/div/header/div[2]/div/div[2]/ul/li/ul/li[2]/a
    Check currency current    £

    #Create list price POUND STERLING 
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}

    #Check price
    FOR    ${index}    IN RANGE    ${convert_prices.__len__()}
        ${price}=    Evaluate    "${convert_prices}[${index}]".strip('€') 
        ${price}=    Convert To Number    ${price}
        ${price}=         Evaluate    ${price} * ${exchange_euro_pound}
        ${price}=    Round Number    ${price}    2
        ${convert_price}=    Evaluate    "${product_prices}[${index}]".split('£')[-1]   
        ${convert_price}=    Convert To Number    ${convert_price}
        Check Approximately Equal    ${convert_price}    ${price}    0.2
        Go Back
    END

    #Check price in product detail
    FOR    ${index}    IN RANGE    ${convert_prices.__len__()}
        Go To    ${product_links}[${index}]
        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${convert_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${convert_prices[${index}].strip()}
        Page Should Contain Element    id=description
        Go Back
    END

    Close Browser

TC16_Verify change US DOLLAR to EURO in DOVE
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Scroll Element Into View    id=block_frame_listing_block_1774
    Click Link    xpath://ul[@id="brandcarousal"]/li[7]//div[@class="image"]/a
    Element Text Should Be    //h1[@class='heading1']    DOVE
    Check currency current    $    

    #Create list product
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}

    #Currency exchange: US DOLLAR -> EURO
    Mouse Over    xpath=/html/body/div/header/div[2]/div/div[2]/ul/li/a/span/span
    Click Element    xpath=/html/body/div/header/div[2]/div/div[2]/ul/li/ul/li[1]/a
    Check currency current    €
    
    #Create list price EURO
    ${convert_names}    Create List
    ${convert_prices}    Create List
    ${convert_links}    Create List
    Create list product    ${convert_names}    ${convert_prices}    ${convert_links}

    #Check price
    FOR    ${index}    IN RANGE    ${convert_prices.__len__()}
        ${price}=    Evaluate    "${product_prices}[${index}]".split('$')[-1]   
        ${price}=    Convert To Number    ${price}
        ${price}=         Evaluate    ${price} * ${exchange_euro}
        ${price}=    Round Number    ${price}    2
        ${convert_price}=    Evaluate    "${convert_prices}[${index}]".strip('€')
        ${convert_price}=    Convert To Number    ${convert_price}
        Should Be Equal As Numbers    ${convert_price}    ${price}
        Go Back
    END

    #Check price in product detail
    FOR    ${index}    IN RANGE    ${convert_prices.__len__()}
        Go To    ${product_links}[${index}]
        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${convert_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${convert_prices[${index}].strip()}
        Page Should Contain Element    id=description
        Go Back
    END

    Close Browser

TC17_Verify change US DOLLAR to POUND STERLING in CALVIN KLEIN
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Scroll Element Into View    id=block_frame_listing_block_1774
    Click Link    xpath://ul[@id="brandcarousal"]/li[8]//div[@class="image"]/a
    Element Text Should Be    //h1[@class='heading1']    CALVIN KLEIN
    Check currency current    $    

    #Create list product
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}

    #Currency exchange: US DOLLAR -> POUND STERLING 
    Mouse Over    xpath=/html/body/div/header/div[2]/div/div[2]/ul/li/a/span/span
    Click Element    xpath=/html/body/div/header/div[2]/div/div[2]/ul/li/ul/li[2]/a
    Check currency current    £
    
    #Create list price EURO
    ${convert_names}    Create List
    ${convert_prices}    Create List
    ${convert_links}    Create List
    Create list product    ${convert_names}    ${convert_prices}    ${convert_links}

    #Check price
    FOR    ${index}    IN RANGE    ${convert_prices.__len__()}
        ${price}=    Evaluate    "${product_prices}[${index}]".split('$')[-1]   
        ${price}=    Convert To Number    ${price}
        ${price}=         Evaluate    ${price} * ${exchange_pound}
        ${price}=    Round Number    ${price}    2
        ${convert_price}=    Evaluate    "${convert_prices}[${index}]".split('£')[-1]    
        ${convert_price}=    Convert To Number    ${convert_price}
        Check Approximately Equal    ${convert_price}    ${price}    0.2
        Go Back
    END

    #Check price in product detail
    FOR    ${index}    IN RANGE    ${convert_prices.__len__()}
        Go To    ${product_links}[${index}]
        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${convert_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${convert_prices[${index}].strip()}
        Page Should Contain Element    id=description
        Go Back
    END

    Close Browser

TC18_Verify change EURO to POUND STERLING in BVLGARI
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Scroll Element Into View    id=block_frame_listing_block_1774
    Click Link    xpath://ul[@id="brandcarousal"]/li[9]//div[@class="image"]/a
    Element Text Should Be    //h1[@class='heading1']    BVLGARI


    Check currency current    $    

    #Currency exchange: US DOLLAR -> EURO
    Mouse Over    xpath=/html/body/div/header/div[2]/div/div[2]/ul/li/a/span/span
    Click Element    xpath=/html/body/div/header/div[2]/div/div[2]/ul/li/ul/li[1]/a
    Check currency current    €

    #Create list price EURO
    ${convert_names}    Create List
    ${convert_prices}    Create List
    ${convert_links}    Create List
    Create list product    ${convert_names}    ${convert_prices}    ${convert_links}

    #Currency exchange: EURO -> POUND STERLING 
    Mouse Over    xpath=/html/body/div/header/div[2]/div/div[2]/ul/li/a/span/span
    Click Element    xpath=/html/body/div/header/div[2]/div/div[2]/ul/li/ul/li[2]/a
    Check currency current    £

    #Create list price POUND STERLING 
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}

    #Check price
    FOR    ${index}    IN RANGE    ${convert_prices.__len__()}
        ${price}=    Evaluate    "${convert_prices}[${index}]".strip('€') 
        ${price}=    Convert To Number    ${price}
        ${price}=         Evaluate    ${price} * ${exchange_euro_pound}
        ${price}=    Round Number    ${price}    2
        ${convert_price}=    Evaluate    "${product_prices}[${index}]".split('£')[-1]   
        ${convert_price}=    Convert To Number    ${convert_price}
        Check Approximately Equal    ${convert_price}    ${price}    0.2
        Go Back
    END

    #Check price in product detail
    FOR    ${index}    IN RANGE    ${convert_prices.__len__()}
        Go To    ${product_links}[${index}]
        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${convert_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${convert_prices[${index}].strip()}
        Page Should Contain Element    id=description
        Go Back
    END

    Close Browser

TC19_Verify change US DOLLAR to EURO in SEPHORA
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Scroll Element Into View    id=block_frame_listing_block_1774
    Click Link    xpath://ul[@id="brandcarousal"]/li[10]//div[@class="image"]/a
    Element Text Should Be    //h1[@class='heading1']    SEPHORA
    Check currency current    $    

    #Create list product
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}

    #Currency exchange: US DOLLAR -> EURO
    Mouse Over    xpath=/html/body/div/header/div[2]/div/div[2]/ul/li/a/span/span
    Click Element    xpath=/html/body/div/header/div[2]/div/div[2]/ul/li/ul/li[1]/a
    Check currency current    €
    
    #Create list price EURO
    ${convert_names}    Create List
    ${convert_prices}    Create List
    ${convert_links}    Create List
    Create list product    ${convert_names}    ${convert_prices}    ${convert_links}

    #Check price
    FOR    ${index}    IN RANGE    ${convert_prices.__len__()}
        ${price}=    Evaluate    "${product_prices}[${index}]".split('$')[-1]   
        ${price}=    Convert To Number    ${price}
        ${price}=         Evaluate    ${price} * ${exchange_euro}
        ${price}=    Round Number    ${price}    2
        ${convert_price}=    Evaluate    "${convert_prices}[${index}]".strip('€')
        ${convert_price}=    Convert To Number    ${convert_price}
        Should Be Equal As Numbers    ${convert_price}    ${price}
        Go Back
    END

    #Check price in product detail
    FOR    ${index}    IN RANGE    ${convert_prices.__len__()}
        Go To    ${product_links}[${index}]
        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${convert_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${convert_prices[${index}].strip()}
        Page Should Contain Element    id=description
        Go Back
    END

    Close Browser

*** Keywords ***
Process Price
    [Arguments]    ${price}
    ${processed_price}=    Set Variable    ${price.split("\n")[0]}
    RETURN    ${processed_price}


Create list product
    [Arguments]    ${product_names}    ${product_prices}    ${product_links}
    @{product_elements}=    Get WebElements    xpath=//a[@class='prdocutname']
    @{price_elements}=    Get WebElements    xpath=//div[@class='price']
    FOR    ${i}    IN RANGE    ${product_elements.__len__()}
        ${product_name}=    Get Text    ${product_elements}[${i}]
        Run Keyword If    "${product_name}" != ""    Append To List    ${product_names}    ${product_name}
        ${product_price}=    Get Text    ${price_elements}[${i}]
        ${processed_price}=    Process Price    ${product_price}
        Run Keyword If    "${processed_price}" != ""    Append To List    ${product_prices}    ${processed_price}
        ${product_link}=    Get Element Attribute    ${product_elements}[${i}]    href
        Run Keyword If    "${product_link}" != ""    Append To List    ${product_links}    ${product_link}
    END

Check currency current
    [Arguments]    ${currency}    
    ${currency_current}=    Get Text    xpath=/html/body/div/header/div[2]/div/div[2]/ul/li/a/span/span
    Should Contain    ${currency_current}    ${currency} 
    ${cart_currency}=    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    Should Contain    ${cart_currency}    ${currency} 

Round Number
    [Arguments]    ${number}    ${decimals}
    ${rounded_number}=    Evaluate    round(${number}, ${decimals})    math
    RETURN    ${rounded_number}

Check Approximately Equal
    [Arguments]    ${expected}    ${actual}    ${tolerance}
    ${diff}=    Evaluate    abs(${expected} - ${actual})
    ${result}=    Evaluate    ${diff} <= ${tolerance}
    Run Keyword If    not ${result}    Fail    Expected ${expected} but got ${actual}, which is not within ${tolerance} tolerance



