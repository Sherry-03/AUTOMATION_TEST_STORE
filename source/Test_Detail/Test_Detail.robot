*** Settings ***
Library           SeleniumLibrary
Library           Collections

*** Variables ***
${url}            https://automationteststore.com/
${browser}        chrome

*** Test Cases ***
TC1_Verify product detail in homepage
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Scroll Element Into View    id=block_frame_featured_1769
    #Create list product
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    ${product_details}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}
    #Check product detail
    FOR    ${index}    IN RANGE    ${product_names.__len__()}
          Go To    ${product_links}[${index}]

        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${product_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Contain Element    id=description
        Go Back
    END
    Close Browser

TC2_Verify product detail in APPAREL & ACCESSORIES grid view
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Element Should Be Visible    id=categorymenu
    Click Link    xpath://ul[@class="nav-pills categorymenu"]/li[2]/a
    Element Text Should Be    //h1[@class='heading1']    APPAREL & ACCESSORIES
    #Create list product
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}
    #Check product detail
    FOR    ${index}    IN RANGE    ${product_names.__len__()}
        Go To    ${product_links}[${index}]
        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${product_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Contain Element    id=description
        Go Back
    END
    Close Browser

TC3_Verify product detail in APPAREL & ACCESSORIES list view
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Element Should Be Visible    id=categorymenu
    Click Link    xpath://ul[@class="nav-pills categorymenu"]/li[2]/a
    Element Text Should Be    //h1[@class='heading1']    APPAREL & ACCESSORIES
    Click Button    id=list
    #Create list product
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    ${product_details}    Create List
    Create list detail product    ${product_names}    ${product_prices}    ${product_links}    ${product_details}
    # Check product detail
    FOR    ${index}    IN RANGE    ${product_links.__len__()}
        Go To    ${product_links}[${index}]
        Wait Until Element Is Visible    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Contain    ${product_names}[${index}]    ${detail_name_uppercase}
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Contain Element    id=description
        ${description}=    Get Text    id=description
        Should Contain    ${description}    ${product_details}[${index}]
        Execute JavaScript    window.history.back()
        Click Button    id=list
    END
    Close Browser

TC4_Verify product detail in MAKEUP grid view
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Element Should Be Visible    id=categorymenu
    Click Link    xpath://ul[@class="nav-pills categorymenu"]/li[3]/a
    Element Text Should Be    //h1[@class='heading1']    MAKEUP
    #Create list product
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}
    #Check product detail
    FOR    ${index}    IN RANGE    ${product_names.__len__()}
          Go To    ${product_links}[${index}]

        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${product_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Contain Element    id=description
        Go Back
    END
    Close Browser

TC5_Verify product detail in MAKEUP list view
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Element Should Be Visible    id=categorymenu
    Click Link    xpath://ul[@class="nav-pills categorymenu"]/li[3]/a
    Element Text Should Be    //h1[@class='heading1']    MAKEUP
    Click Button    id=list
    #Create list product
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    ${product_details}    Create List
    Create list detail product    ${product_names}    ${product_prices}    ${product_links}    ${product_details}
    # Check product detail
    FOR    ${index}    IN RANGE    ${product_links.__len__()}
          Go To    ${product_links}[${index}]

        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Contain    ${product_names}[${index}]    ${detail_name_uppercase}
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Contain Element    id=description
        ${description}=    Get Text    id=description
        Should Contain    ${description}    ${product_details}[${index}]
        Execute JavaScript    window.history.back()
        Click Button    id=list
    END
    Close Browser

TC6_Verify product detail in SKINCARE grid view
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Element Should Be Visible    id=categorymenu
    Click Link    xpath://ul[@class="nav-pills categorymenu"]/li[4]/a
    Element Text Should Be    //h1[@class='heading1']    SKINCARE
    #Create list product
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}
    #Check product detail
    FOR    ${index}    IN RANGE    ${product_names.__len__()}
          Go To    ${product_links}[${index}]

        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${product_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Contain Element    id=description
        Go Back
    END
    Close Browser

TC7_Verify product detail in SKINCARE list view
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Element Should Be Visible    id=categorymenu
    Click Link    xpath://ul[@class="nav-pills categorymenu"]/li[4]/a
    Element Text Should Be    //h1[@class='heading1']    SKINCARE
    Click Button    id=list
    #Create list product
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    ${product_details}    Create List
    Create list detail product    ${product_names}    ${product_prices}    ${product_links}    ${product_details}
    # Check product detail
    FOR    ${index}    IN RANGE    ${product_links.__len__()}
          Go To    ${product_links}[${index}]

        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Contain    ${product_names}[${index}]    ${detail_name_uppercase}
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Contain Element    id=description
        ${description}=    Get Text    id=description
        Should Contain    ${description}    ${product_details}[${index}]
        Execute JavaScript    window.history.back()
        Click Button    id=list
    END
    Close Browser

TC8_Verify product detail in FRAGRANCE grid view
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Element Should Be Visible    id=categorymenu
    Click Link    xpath://ul[@class="nav-pills categorymenu"]/li[5]/a
    Element Text Should Be    //h1[@class='heading1']    FRAGRANCE
    #Create list product
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}
    #Check product detail
    FOR    ${index}    IN RANGE    ${product_names.__len__()}
          Go To    ${product_links}[${index}]

        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${product_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Contain Element    id=description
        Go Back
    END
    Close Browser

TC9_Verify product detail in FRAGRANCE list view
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Element Should Be Visible    id=categorymenu
    Click Link    xpath://ul[@class="nav-pills categorymenu"]/li[5]/a
    Element Text Should Be    //h1[@class='heading1']    FRAGRANCE
    Click Button    id=list
    #Create list product
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    ${product_details}    Create List
    Create list detail product    ${product_names}    ${product_prices}    ${product_links}    ${product_details}
    # Check product detail
    FOR    ${index}    IN RANGE    ${product_links.__len__()}
          Go To    ${product_links}[${index}]

        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Contain    ${product_names}[${index}]    ${detail_name_uppercase}
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Contain Element    id=description
        ${description}=    Get Text    id=description
        Should Contain    ${description}    ${product_details}[${index}]
        Execute JavaScript    window.history.back()
        Click Button    id=list
    END
    Close Browser

TC10_Verify product detail in MEN grid view
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Element Should Be Visible    id=categorymenu
    Click Link    xpath://ul[@class="nav-pills categorymenu"]/li[6]/a
    Element Text Should Be    //h1[@class='heading1']    MEN
    #Create list product
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}
    #Check product detail
    FOR    ${index}    IN RANGE    ${product_names.__len__()}
          Go To    ${product_links}[${index}]

        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${product_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Contain Element    id=description
        Go Back
    END
    Close Browser

TC11_Verify product detail in MEN list view
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Element Should Be Visible    id=categorymenu
    Click Link    xpath://ul[@class="nav-pills categorymenu"]/li[6]/a
    Element Text Should Be    //h1[@class='heading1']    MEN
    Click Button    id=list
    #Create list product
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    ${product_details}    Create List
    Create list detail product    ${product_names}    ${product_prices}    ${product_links}    ${product_details}
    # Check product detail
    FOR    ${index}    IN RANGE    ${product_links.__len__()}
          Go To    ${product_links}[${index}]

        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Contain    ${product_names}[${index}]    ${detail_name_uppercase}
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Contain Element    id=description
        ${description}=    Get Text    id=description
        Should Contain    ${description}    ${product_details}[${index}]
        Execute JavaScript    window.history.back()
        Click Button    id=list
    END
    Close Browser

TC12_Verify product detail in HAIR CARE grid view
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Element Should Be Visible    id=categorymenu
    Click Link    xpath://ul[@class="nav-pills categorymenu"]/li[7]/a
    Element Text Should Be    //h1[@class='heading1']    HAIR CARE
    #Create list product
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}
    #Check product detail
    FOR    ${index}    IN RANGE    ${product_names.__len__()}
          Go To    ${product_links}[${index}]

        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${product_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Contain Element    id=description
        Go Back
    END
    Close Browser

TC13_Verify product detail in HAIR CARE list view
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Element Should Be Visible    id=categorymenu
    Click Link    xpath://ul[@class="nav-pills categorymenu"]/li[7]/a
    Element Text Should Be    //h1[@class='heading1']    HAIR CARE
    Click Button    id=list
    #Create list product
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    ${product_details}    Create List
    Create list detail product    ${product_names}    ${product_prices}    ${product_links}    ${product_details}
    # Check product detail
    FOR    ${index}    IN RANGE    ${product_links.__len__()}
          Go To    ${product_links}[${index}]

        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Contain    ${product_names}[${index}]    ${detail_name_uppercase}
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Contain Element    id=description
        ${description}=    Get Text    id=description
        Should Contain    ${description}    ${product_details}[${index}]
        Execute JavaScript    window.history.back()
        Click Button    id=list
    END
    Close Browser

TC14_Verify product detail in BOOKS grid view
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Element Should Be Visible    id=categorymenu
    Click Link    xpath://ul[@class="nav-pills categorymenu"]/li[8]/a
    Element Text Should Be    //h1[@class='heading1']    BOOKS
    #Create list product
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}
    #Check product detail
    FOR    ${index}    IN RANGE    ${product_names.__len__()}
          Go To    ${product_links}[${index}]

        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${product_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Contain Element    id=description
        Go Back
    END
    Close Browser

TC15_Verify product detail in BOOKS list view
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Element Should Be Visible    id=categorymenu
    Click Link    xpath://ul[@class="nav-pills categorymenu"]/li[8]/a
    Element Text Should Be    //h1[@class='heading1']    BOOKS
    Click Button    id=list
    #Create list product
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    ${product_details}    Create List
    Create list detail product    ${product_names}    ${product_prices}    ${product_links}    ${product_details}
    # Check product detail
    FOR    ${index}    IN RANGE    ${product_links.__len__()}
          Go To    ${product_links}[${index}]

        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Contain    ${product_names}[${index}]    ${detail_name_uppercase}
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Contain Element    id=description
        ${description}=    Get Text    id=description
        Should Contain    ${description}    ${product_details}[${index}]
        Execute JavaScript    window.history.back()
        Click Button    id=list
    END
    Close Browser

TC16_Verify product detail in SPECIAL OFFERS grid view
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Element Should Be Visible    id=categorymenu
    Click Element    xpath=//a[@class="top menu_specials"]
    Element Text Should Be    //h1[@class='heading1']    SPECIAL OFFERS
    #Create list product
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}
    #Check product detail
    FOR    ${index}    IN RANGE    ${product_names.__len__()}
          Go To    ${product_links}[${index}]

        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${product_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Contain Element    id=description
        Go Back
    END
    Close Browser

TC17_Verify product detail in SPECIAL OFFERS list view
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Element Should Be Visible    id=categorymenu
    Click Element    xpath=//a[@class="top menu_specials"]
    Element Text Should Be    //h1[@class='heading1']    SPECIAL OFFERS
    Click Button    id=list
    #Create list product
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    ${product_details}    Create List
    Create list detail product    ${product_names}    ${product_prices}    ${product_links}    ${product_details}
    # Check product detail
    FOR    ${index}    IN RANGE    ${product_links.__len__()}
          Go To    ${product_links}[${index}]

        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Contain    ${product_names}[${index}]    ${detail_name_uppercase}
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Contain Element    id=description
        ${description}=    Get Text    id=description
        Should Contain    ${description}    ${product_details}[${index}]
        Execute JavaScript    window.history.back()
        Click Button    id=list
    END
    Close Browser

TC18_Verify product detail in Brand BENEFIT grid view
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Scroll Element Into View    id=block_frame_listing_block_1774
    Click Link    xpath://ul[@id="brandcarousal"]/li[1]//div[@class="image"]/a
    Element Text Should Be    //h1[@class='heading1']    BENEFIT
    #Create list product
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}
    #Check product detail
    FOR    ${index}    IN RANGE    ${product_names.__len__()}
          Go To    ${product_links}[${index}]

        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${product_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Contain Element    id=description
        Go Back
    END
    Close Browser

TC19_Verify product detail in Brand BENEFIT list view
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Scroll Element Into View    id=block_frame_listing_block_1774
    Click Link    xpath://ul[@id="brandcarousal"]/li[1]//div[@class="image"]/a
    Element Text Should Be    //h1[@class='heading1']    BENEFIT
    Click Button    id=list
    #Create list product
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    ${product_details}    Create List
    Create list detail product    ${product_names}    ${product_prices}    ${product_links}    ${product_details}
    # Check product detail
    FOR    ${index}    IN RANGE    ${product_links.__len__()}
          Go To    ${product_links}[${index}]

        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Contain    ${product_names}[${index}]    ${detail_name_uppercase}
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Contain Element    id=description
        ${description}=    Get Text    id=description
        Should Contain    ${description}    ${product_details}[${index}]
        Execute JavaScript    window.history.back()
        Click Button    id=list
    END
    Close Browser

TC20_Verify product detail in Brand PANTENE grid view
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Scroll Element Into View    id=block_frame_listing_block_1774
    Click Link    xpath://ul[@id="brandcarousal"]/li[2]//div[@class="image"]/a
    Element Text Should Be    //h1[@class='heading1']    PANTENE
    #Create list product
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}
    #Check product detail
    FOR    ${index}    IN RANGE    ${product_names.__len__()}
          Go To    ${product_links}[${index}]

        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${product_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Contain Element    id=description
        Go Back
    END
    Close Browser

TC21_Verify product detail in Brand PANTENE list view
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Scroll Element Into View    id=block_frame_listing_block_1774
    Click Link    xpath://ul[@id="brandcarousal"]/li[2]//div[@class="image"]/a
    Element Text Should Be    //h1[@class='heading1']    PANTENE
    Click Button    id=list
    #Create list product
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    ${product_details}    Create List
    Create list detail product    ${product_names}    ${product_prices}    ${product_links}    ${product_details}
    # Check product detail
    FOR    ${index}    IN RANGE    ${product_links.__len__()}
          Go To    ${product_links}[${index}]

        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Contain    ${product_names}[${index}]    ${detail_name_uppercase}
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Contain Element    id=description
        ${description}=    Get Text    id=description
        Should Contain    ${description}    ${product_details}[${index}]
        Execute JavaScript    window.history.back()
        Click Button    id=list
    END
    Close Browser

TC22_Verify product detail in Brand M·A·C grid view
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Scroll Element Into View    id=block_frame_listing_block_1774
    Click Link    xpath://ul[@id="brandcarousal"]/li[3]//div[@class="image"]/a
    Element Text Should Be    //h1[@class='heading1']    M·A·C
    #Create list product
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}
    #Check product detail
    FOR    ${index}    IN RANGE    ${product_names.__len__()}
          Go To    ${product_links}[${index}]

        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${product_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Contain Element    id=description
        Go Back
    END
    Close Browser

TC23_Verify product detail in Brand M·A·C list view
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Scroll Element Into View    id=block_frame_listing_block_1774
    Click Link    xpath://ul[@id="brandcarousal"]/li[3]//div[@class="image"]/a
    Element Text Should Be    //h1[@class='heading1']    M·A·C
    Click Button    id=list
    #Create list product
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    ${product_details}    Create List
    Create list detail product    ${product_names}    ${product_prices}    ${product_links}    ${product_details}
    # Check product detail
    FOR    ${index}    IN RANGE    ${product_links.__len__()}
          Go To    ${product_links}[${index}]

        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Contain    ${product_names}[${index}]    ${detail_name_uppercase}
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Contain Element    id=description
        ${description}=    Get Text    id=description
        Should Contain    ${description}    ${product_details}[${index}]
        Execute JavaScript    window.history.back()
        Click Button    id=list
    END
    Close Browser

TC24_Verify product detail in Brand LANCÔME grid view
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Scroll Element Into View    id=block_frame_listing_block_1774
    Click Link    xpath://ul[@id="brandcarousal"]/li[4]//div[@class="image"]/a
    Element Text Should Be    //h1[@class='heading1']    LANCÔME
    Select From List by Value    name=limit    10
    ${selected_option}    Get Element Attribute    name=limit    value
    Should Be Equal As Strings    ${selected_option}    10
    #Create list product
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}
    #Check product detail in page 1
    FOR    ${index}    IN RANGE    10
          Go To    ${product_links}[${index}]

        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${product_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Contain Element    id=description
        Go Back
    END
    #Check product detail in page 2
    Click Link    xpath://ul[@class="pagination"]/li[2]/a
    ${product_names2}    Create List
    ${product_prices2}    Create List
    ${product_links2}    Create List
    Create list product    ${product_names2}    ${product_prices2}    ${product_links2}
    FOR    ${index}    IN RANGE    2
        Click Link    ${product_links2}[${index}]
        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${product_names2}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices2[${index}].strip()}
        Page Should Contain Element    id=description
        Go Back
    END
    Close Browser

TC25_Verify product detail in Brand LANCÔME list view
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Scroll Element Into View    id=block_frame_listing_block_1774
    Click Link    xpath://ul[@id="brandcarousal"]/li[4]//div[@class="image"]/a
    Element Text Should Be    //h1[@class='heading1']    LANCÔME
    Select From List by Value    name=limit    10
    ${selected_option}    Get Element Attribute    name=limit    value
    Should Be Equal As Strings    ${selected_option}    10
    Click Button    id=list
    #Create list product
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    ${product_details}    Create List
    Create list detail product    ${product_names}    ${product_prices}    ${product_links}    ${product_details}
    #Check product detail in page 1
    FOR    ${index}    IN RANGE    10
          Go To    ${product_links}[${index}]

        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Contain    ${product_names}[${index}]    ${detail_name_uppercase}
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Contain Element    id=description
        ${description}=    Get Text    id=description
        Should Contain    ${description}    ${product_details}[${index}]
        Execute JavaScript    window.history.back()
        Click Button    id=list
    END
    #Check product detail in page 2
    Click Link    xpath://ul[@class="pagination"]/li[2]/a
    Click Button    id=list
    ${product_names2}    Create List
    ${product_prices2}    Create List
    ${product_links2}    Create List
    ${product_details2}    Create List
    Create list detail product    ${product_names2}    ${product_prices2}    ${product_links2}    ${product_details2}
    FOR    ${index}    IN RANGE    2
        Click Link    ${product_links2}[${index}]
        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Contain    ${product_names2}[${index}]    ${detail_name_uppercase}
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices2[${index}].strip()}
        Page Should Contain Element    id=description
        ${description}=    Get Text    id=description
        Should Contain    ${description}    ${product_details2}[${index}]
        Execute JavaScript    window.history.back()
        Click Button    id=list
    END
    Close Browser

TC26_Verify product detail in Brand GUCCI grid view
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Scroll Element Into View    id=block_frame_listing_block_1774
    Click Link    xpath://ul[@id="brandcarousal"]/li[5]//div[@class="image"]/a
    Element Text Should Be    //h1[@class='heading1']    GUCCI
    #Create list product
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}
    #Check product detail
    FOR    ${index}    IN RANGE    ${product_names.__len__()}
          Go To    ${product_links}[${index}]

        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${product_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Contain Element    id=description
        Go Back
    END
    Close Browser

TC27_Verify product detail in Brand GUCCI list view
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Scroll Element Into View    id=block_frame_listing_block_1774
    Click Link    xpath://ul[@id="brandcarousal"]/li[5]//div[@class="image"]/a
    Element Text Should Be    //h1[@class='heading1']    GUCCI
    Click Button    id=list
    #Create list product
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    ${product_details}    Create List
    Create list detail product    ${product_names}    ${product_prices}    ${product_links}    ${product_details}
    # Check product detail
    FOR    ${index}    IN RANGE    ${product_links.__len__()}
          Go To    ${product_links}[${index}]

        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Contain    ${product_names}[${index}]    ${detail_name_uppercase}
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Contain Element    id=description
        ${description}=    Get Text    id=description
        Should Contain    ${description}    ${product_details}[${index}]
        Execute JavaScript    window.history.back()
        Click Button    id=list
    END
    Close Browser

TC28_Verify product detail in Brand GIORGIO ARMANI grid view
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Scroll Element Into View    id=block_frame_listing_block_1774
    Click Link    xpath://ul[@id="brandcarousal"]/li[6]//div[@class="image"]/a
    Element Text Should Be    //h1[@class='heading1']    GIORGIO ARMANI
    Select From List by Value    name=limit    10
    ${selected_option}    Get Element Attribute    name=limit    value
    Should Be Equal As Strings    ${selected_option}    10
    #Create list product
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}
    #Check product detail in page 1
    FOR    ${index}    IN RANGE    10
          Go To    ${product_links}[${index}]

        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${product_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Contain Element    id=description
        Go Back
    END
    #Check product detail in page 2
    Click Link    xpath://ul[@class="pagination"]/li[2]/a
    ${product_names2}    Create List
    ${product_prices2}    Create List
    ${product_links2}    Create List
    Create list product    ${product_names2}    ${product_prices2}    ${product_links2}
    FOR    ${index}    IN RANGE    3
        Click Link    ${product_links2}[${index}]
        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${product_names2}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices2[${index}].strip()}
        Page Should Contain Element    id=description
        Go Back
    END
    Close Browser

TC29_Verify product detail in Brand GIORGIO ARMANI list view
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Scroll Element Into View    id=block_frame_listing_block_1774
    Click Link    xpath://ul[@id="brandcarousal"]/li[6]//div[@class="image"]/a
    Element Text Should Be    //h1[@class='heading1']    GIORGIO ARMANI
    Select From List by Value    name=limit    10
    ${selected_option}    Get Element Attribute    name=limit    value
    Should Be Equal As Strings    ${selected_option}    10
    Click Button    id=list
    #Create list product
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    ${product_details}    Create List
    Create list detail product    ${product_names}    ${product_prices}    ${product_links}    ${product_details}
    #Check product detail in page 1
    FOR    ${index}    IN RANGE    10
          Go To    ${product_links}[${index}]

        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Contain    ${product_names}[${index}]    ${detail_name_uppercase}
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Contain Element    id=description
        ${description}=    Get Text    id=description
        Should Contain    ${description}    ${product_details}[${index}]
        Execute JavaScript    window.history.back()
        Click Button    id=list
    END
    #Check product detail in page 2
    Click Link    xpath://ul[@class="pagination"]/li[2]/a
    Click Button    id=list
    ${product_names2}    Create List
    ${product_prices2}    Create List
    ${product_links2}    Create List
    ${product_details2}    Create List
    Create list detail product    ${product_names2}    ${product_prices2}    ${product_links2}    ${product_details2}
    FOR    ${index}    IN RANGE    3
        Click Link    ${product_links2}[${index}]
        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Contain    ${product_names2}[${index}]    ${detail_name_uppercase}
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices2[${index}].strip()}
        Page Should Contain Element    id=description
        ${description}=    Get Text    id=description
        Should Contain    ${description}    ${product_details2}[${index}]
        Execute JavaScript    window.history.back()
        Click Button    id=list
    END
    Close Browser

TC30_Verify product detail in Brand DOVE grid view
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Scroll Element Into View    id=block_frame_listing_block_1774
    Click Link    xpath://ul[@id="brandcarousal"]/li[7]//div[@class="image"]/a
    Element Text Should Be    //h1[@class='heading1']    DOVE
    #Create list product
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}
    #Check product detail
    FOR    ${index}    IN RANGE    ${product_names.__len__()}
          Go To    ${product_links}[${index}]

        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${product_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Contain Element    id=description
        Go Back
    END
    Close Browser

TC31_Verify product detail in Brand DOVE list view
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Scroll Element Into View    id=block_frame_listing_block_1774
    Click Link    xpath://ul[@id="brandcarousal"]/li[7]//div[@class="image"]/a
    Element Text Should Be    //h1[@class='heading1']    DOVE
    Click Button    id=list
    #Create list product
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    ${product_details}    Create List
    Create list detail product    ${product_names}    ${product_prices}    ${product_links}    ${product_details}
    # Check product detail
    FOR    ${index}    IN RANGE    ${product_links.__len__()}
          Go To    ${product_links}[${index}]

        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Contain    ${product_names}[${index}]    ${detail_name_uppercase}
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Contain Element    id=description
        ${description}=    Get Text    id=description
        Should Contain    ${description}    ${product_details}[${index}]
        Execute JavaScript    window.history.back()
        Click Button    id=list
    END
    Close Browser

TC32_Verify product detail in Brand CALVIN KLEIN grid view
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Scroll Element Into View    id=block_frame_listing_block_1774
    Click Link    xpath://ul[@id="brandcarousal"]/li[8]//div[@class="image"]/a
    Element Text Should Be    //h1[@class='heading1']    CALVIN KLEIN
    #Create list product
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}
    #Check product detail
    FOR    ${index}    IN RANGE    ${product_names.__len__()}
          Go To    ${product_links}[${index}]

        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${product_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Contain Element    id=description
        Go Back
    END
    Close Browser

TC33_Verify product detail in Brand CALVIN KLEIN list view
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Scroll Element Into View    id=block_frame_listing_block_1774
    Click Link    xpath://ul[@id="brandcarousal"]/li[8]//div[@class="image"]/a
    Element Text Should Be    //h1[@class='heading1']    CALVIN KLEIN
    Click Button    id=list
    
    #Create list product
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    ${product_details}    Create List
    Create list detail product    ${product_names}    ${product_prices}    ${product_links}    ${product_details}
    # Check product detail
    FOR    ${index}    IN RANGE    ${product_links.__len__()}
          Go To    ${product_links}[${index}]

        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Contain    ${product_names}[${index}]    ${detail_name_uppercase}
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Contain Element    id=description
        ${description}=    Get Text    id=description
        Should Contain    ${description}    ${product_details}[${index}]
        Execute JavaScript    window.history.back()
        Click Button    id=list
    END
    Close Browser

TC34_Verify product detail in Brand BVLGARI grid view
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Scroll Element Into View    id=block_frame_listing_block_1774
    Click Link    xpath://ul[@id="brandcarousal"]/li[9]//div[@class="image"]/a
    Element Text Should Be    //h1[@class='heading1']    BVLGARI
    #Create list product
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}
    #Check product detail
    FOR    ${index}    IN RANGE    ${product_names.__len__()}
        Go To    ${product_links}[${index}]

        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${product_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Contain Element    id=description
        Go Back
    END
    Close Browser

TC35_Verify product detail in Brand BVLGARI list view
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Scroll Element Into View    id=block_frame_listing_block_1774
    Click Link    xpath://ul[@id="brandcarousal"]/li[9]//div[@class="image"]/a
    Element Text Should Be    //h1[@class='heading1']    BVLGARI
    Click Button    id=list
    #Create list product
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    ${product_details}    Create List
    Create list detail product    ${product_names}    ${product_prices}    ${product_links}    ${product_details}
    # Check product detail
    FOR    ${index}    IN RANGE    ${product_links.__len__()}
          Go To    ${product_links}[${index}]

        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Contain    ${product_names}[${index}]    ${detail_name_uppercase}
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Contain Element    id=description
        ${description}=    Get Text    id=description
        Should Contain    ${description}    ${product_details}[${index}]
        Execute JavaScript    window.history.back()
        Click Button    id=list
    END
    Close Browser

TC36_Verify product detail in Brand SEPHORA grid view
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Scroll Element Into View    id=block_frame_listing_block_1774
    Click Link    xpath://ul[@id="brandcarousal"]/li[10]//div[@class="image"]/a
    Element Text Should Be    //h1[@class='heading1']    SEPHORA
    #Create list product
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}
    #Check product detail
    FOR    ${index}    IN RANGE    ${product_names.__len__()}
          Go To    ${product_links}[${index}]

        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Be Equal As Strings    ${detail_name_uppercase}    ${product_names}[${index}]
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Contain Element    id=description
        Go Back
    END
    Close Browser

TC37_Verify product detail in Brand SEPHORA list view
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]
    Scroll Element Into View    id=block_frame_listing_block_1774
    Click Link    xpath://ul[@id="brandcarousal"]/li[10]//div[@class="image"]/a
    Element Text Should Be    //h1[@class='heading1']    SEPHORA
    Click Button    id=list
    #Create list product
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    ${product_details}    Create List
    Create list detail product    ${product_names}    ${product_prices}    ${product_links}    ${product_details}
    # Check product detail
    FOR    ${index}    IN RANGE    ${product_links.__len__()}
        Go To    ${product_links}[${index}]
        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name_uppercase}    Set Variable    ${detail_name.upper()}
        Should Contain    ${product_names}[${index}]    ${detail_name_uppercase}
        ${detail_price}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
        Should Be Equal As Strings    ${detail_price.strip()}    ${product_prices[${index}].strip()}
        Page Should Contain Element    id=description
        ${description}=    Get Text    id=description
        Should Contain    ${description}    ${product_details}[${index}]
        Execute JavaScript    window.history.back()
        Click Button    id=list
    END
    Close Browser

*** Keywords ***
Process Price
    [Arguments]    ${price}
    ${processed_price}=    Set Variable    ${price.split("\n")[0]}
    RETURN    ${processed_price}

Click Product Detail And Verify
    [Arguments]    ${detail_locator}    ${expected_name}    ${expected_price}
    Click Element    ${detail_locator}
    ${element_text}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
    Should Be Equal As Strings    ${element_text}    ${expected_name}
    ${price_text}=    Get Text    xpath=//div[@class='productprice']//div[@class='productfilneprice']
    Should Be Equal As Strings    ${price_text}    ${expected_price}

Create list detail product
    [Arguments]    ${product_names}    ${product_prices}    ${product_links}    ${product_details}
    @{product_elements}=    Get WebElements    xpath=//div[@class="col-md-8"]//a[@class="prdocutname"]
    @{price_elements}=    Get WebElements    xpath=//div[@class="col-md-8"]//div[@class="price"]
    @{detail_elements}=    Get WebElements    xpath=//div[@class="col-md-8"]//div[@class="productdiscrption"]
    FOR    ${i}    IN RANGE    ${product_elements.__len__()}
        ${product_name}=    Get Text    ${product_elements}[${i}]
        Append To List    ${product_names}    ${product_name}
        ${product_price}=    Get Text    ${price_elements}[${i}]
        ${processed_price}=    Process Price    ${product_price}
        Append To List    ${product_prices}    ${processed_price}
        ${product_link}=    Get Element Attribute    ${product_elements}[${i}]    href
        Append To List    ${product_links}    ${product_link}
        ${product_detail}=    Get Text    ${detail_elements}[${i}]
        Append To List    ${product_details}    ${product_detail}
    END

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
