*** Settings ***
Library           SeleniumLibrary
Library           Collections

*** Variables ***
${url}            https://automationteststore.com/
${browser}        chrome
${search_input}    id=filter_keyword
${search_button}    xpath=//*[@id="search_form"]/div/div
${detail_name}    xpath=//h1[@class='productname']/span[@class='bgnone']
${all_categories}    All Categories
${Apparel_accessories}    Apparel & accessories
${apparel_btn}    id=category_68
${makeup}    Makeup
${makeup_btn}    id=category_36
${skincare}    Skincare
${skincare_btn}    id=category_43
${fragrance}    Fragrance
${fragrance_btn}    id=category_49
${men}    Men
${men_btn}    id=category_58
${haircare}    Hair Care
${haircare_btn}    id=category_52
${books}    Books
${books_btn}    id=category_65
*** Test Cases ***
TC1_Verify search All Categories name "BeneFit Girl Meets Pearl"
    [Tags]    All Categories
    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]

    #Search keyword "BeneFit Girl Meets Pearl"
    Input Text    ${search_input}    BeneFit Girl Meets Pearl
    ${keyword}=    Get Value    ${search_input}
    Click Element    ${search_button}
    

    #Verify search result
    ${status_product}=    Run Keyword And Return Status    Page Should Contain Element    ${detail_name}
    Run Keyword If    ${status_product}    Verify Search Result    ${keyword}
    ...    ELSE IF    not ${status_product}    Handle Search Result Des and Model    ${all_categories}    ${keyword}
    ...    ELSE    Handle No Search Result    ${all_categories}    
    Close Browser

TC2_Verify search All Categories description "Bronzes, shapes and sculpts the face."
    [Tags]    All Categories

    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]

    #Search keyword "Bronzes, shapes and sculpts the face."
    Input Text    ${search_input}    Bronzes, shapes and sculpts the face.
    ${keyword}=    Get Value    ${search_input}
    Click Element    ${search_button}
    
     #Verify search result
    ${status_product}=    Run Keyword And Return Status    Page Should Contain Element    ${detail_name}
    Run Keyword If    ${status_product}    Verify Search Result    ${keyword}
    ...    ELSE IF    not ${status_product}    Handle Search Result Des and Model    ${all_categories}    ${keyword}
    ...    ELSE    Handle No Search Result    ${all_categories}    
    Close Browser

TC3_Verify search All Categories model "29"
    [Tags]    All Categories

    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]

    #Search keyword "29"
    Input Text    ${search_input}    29
    ${keyword}=    Get Value    ${search_input}
    Click Element    ${search_button}
    
     #Verify search result
    ${status_product}=    Run Keyword And Return Status    Page Should Contain Element    ${detail_name}
    Run Keyword If    ${status_product}    Verify Search Result    ${keyword}
    ...    ELSE IF    not ${status_product}    Handle Search Result Des and Model    ${all_categories}    ${keyword}
    ...    ELSE    Handle No Search Result    ${all_categories}    
    Close Browser

TC4_Verify search All Categories "he"
    [Tags]    All Categories

    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]

    #Search keyword "he"
    Input Text    ${search_input}    he
    ${keyword}=    Get Value    ${search_input}
    Click Element    ${search_button}
    
     #Verify search result
    ${status_product}=    Run Keyword And Return Status    Page Should Contain Element    ${detail_name}
    Run Keyword If    ${status_product}    Verify Search Result    ${keyword}
    ...    ELSE IF    not ${status_product}    Handle Search Result Des and Model    ${all_categories}    ${keyword}
    ...    ELSE    Handle No Search Result    ${all_categories}    
    Close Browser

TC5_Verify search All Categories "29.5"
    [Tags]    All Categories

    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]

    #Search keyword "29.5"
    Input Text    ${search_input}    29.5
    ${keyword}=    Get Value    ${search_input}
    Click Element    ${search_button}
   
     #Verify search result
    ${status_product}=    Run Keyword And Return Status    Page Should Contain Element    ${detail_name}
    Run Keyword If    ${status_product}    Verify Search Result    ${keyword}
    ...    ELSE IF    not ${status_product}    Handle Search Result Des and Model    ${all_categories}    ${keyword}
    ...    ELSE    Handle No Search Result    ${all_categories}    
    Close Browser

TC6_Verify search All Categories "haopasas"
    [Tags]    All Categories

    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]

    #Search keyword "haopasas"
    Input Text    ${search_input}    haopasas
    ${keyword}=    Get Value    ${search_input}
    Click Element    ${search_button}
    
     #Verify search result
    ${status_product}=    Run Keyword And Return Status    Page Should Contain Element    ${detail_name}
    Run Keyword If    ${status_product}    Verify Search Result    ${keyword}
    ...    ELSE IF    not ${status_product}    Handle Search Result Des and Model    ${all_categories}    ${keyword}
    ...    ELSE    Handle No Search Result    ${all_categories}    
    Close Browser

TC7_Verify search All Categories "1"
    [Tags]    All Categories

    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]

    #Search keyword "1"
    Input Text    ${search_input}    1
    ${keyword}=    Get Value    ${search_input}
    Click Element    ${search_button}
   
     #Verify search result
    ${status_product}=    Run Keyword And Return Status    Page Should Contain Element    ${detail_name}
    Run Keyword If    ${status_product}    Verify Search Result    ${keyword}
    ...    ELSE IF    not ${status_product}    Handle Search Result Des and Model    ${all_categories}    ${keyword}
    ...    ELSE    Handle No Search Result    ${all_categories}    
    Close Browser

TC8_Verify search All Categories "!@#$%*$((#))"
    [Tags]    All Categories

    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]

    #Search keyword "!@#$%*$((#))"
    Input Text    ${search_input}    !@#$%*$((#))
    ${keyword}=    Get Value    ${search_input}
    Click Element    ${search_button}

     #Verify search result
    ${status_product}=    Run Keyword And Return Status    Page Should Contain Element    ${detail_name}
    Run Keyword If    ${status_product}    Verify Search Result    ${keyword}
    ...    ELSE IF    not ${status_product}    Handle Search Result Des and Model    ${all_categories}    ${keyword}
    ...    ELSE    Handle No Search Result    ${all_categories}    
    Close Browser

TC9_Verify search All Categories "aaaaaaaaaaasfahsfoiwihofehioasihdoisoihsaihofhfioasffhhhhhhhhhhhhhhhhhhhhhIOADHabxjkABDBoahdiohadhasihdioashsdioahsioasdioashioafhs0pibsssssdsjojasbjk"
    [Tags]    All Categories

    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]

    #Search keyword "aaaaaaaaaaasfahsfoiwihofehioasihdoisoihsaihofhfioasffhhhhhhhhhhhhhhhhhhhhhIOADHabxjkABDBoahdiohadhasihdioashsdioahsioasdioashioafhs0pibsssssdsjojasbjk"
    Input Text    ${search_input}    aaaaaaaaaaasfahsfoiwihofehioasihdoisoihsaihofhfioasffhhhhhhhhhhhhhhhhhhhhhIOADHabxjkABDBoahdiohadhasihdioashsdioahsioasdioashioafhs0pibsssssdsjojasbjk
    ${keyword}=    Get Value    ${search_input}
    Click Element    ${search_button}
    
     #Verify search result
    ${status_product}=    Run Keyword And Return Status    Page Should Contain Element    ${detail_name}
    Run Keyword If    ${status_product}    Verify Search Result    ${keyword}
    ...    ELSE IF    not ${status_product}    Handle Search Result Des and Model    ${all_categories}    ${keyword}
    ...    ELSE    Handle No Search Result    ${all_categories}    
    Close Browser

TC10_Verify search Apparel & accessories name "NEW LADIES HIGH WEDGE HEEL TOE THONG DIAMANTE FLIP FLOP SANDALS"
    [Tags]    Apparel & accessories

    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]

    #Search keyword "NEW LADIES HIGH WEDGE HEEL TOE THONG DIAMANTE FLIP FLOP SANDALS"
    Input Text    ${search_input}    NEW LADIES HIGH WEDGE HEEL TOE THONG DIAMANTE FLIP FLOP SANDALS
    Click Element    ${search_input}
    Click Element    ${apparel_btn}
    ${keyword}=    Get Value    ${search_input}
    Click Element    ${search_button}

     #Verify search result
    ${status_product}=    Run Keyword And Return Status    Page Should Contain Element    ${detail_name}
    Run Keyword If    ${status_product}    Verify Search Result    ${keyword}
    ...    ELSE IF    not ${status_product}    Handle Search Result Des and Model    ${Apparel_accessories}    ${keyword}
    ...    ELSE    Handle No Search Result    ${Apparel_accessories}    
    Close Browser

TC11_Verify search Apparel & accessories description "100% Cotton"
    [Tags]    Apparel & accessories

    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]

    #Search keyword "100% Cotton"
    Input Text    ${search_input}    100% Cotton
    Click Element    ${search_input}
    Click Element    ${apparel_btn}
    ${keyword}=    Get Value    ${search_input}
    Click Element    ${search_button}

     #Verify search result
    ${status_product}=    Run Keyword And Return Status    Page Should Contain Element    ${detail_name}
    Run Keyword If    ${status_product}    Verify Search Result    ${keyword}
    ...    ELSE IF    not ${status_product}    Handle Search Result Des and Model    ${Apparel_accessories}    ${keyword}
    ...    ELSE    Handle No Search Result    ${Apparel_accessories}    
    Close Browser   

TC12_Verify search Apparel & accessories model "00"
    [Tags]    Apparel & accessories

    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]

    #Search keyword "00"
    Input Text    ${search_input}    00
    Click Element    ${search_input}
    Click Element    ${apparel_btn}
    ${keyword}=    Get Value    ${search_input}
    Click Element    ${search_button}

     #Verify search result
    ${status_product}=    Run Keyword And Return Status    Page Should Contain Element    ${detail_name}
    Run Keyword If    ${status_product}    Verify Search Result    ${keyword}
    ...    ELSE IF    not ${status_product}    Handle Search Result Des and Model    ${Apparel_accessories}    ${keyword}
    ...    ELSE    Handle No Search Result    ${Apparel_accessories}    
    Close Browser

TC13_Verify search Apparel & accessories "38.6"
    [Tags]    Apparel & accessories

    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]

    #Search keyword "38.6"
    Input Text    ${search_input}    38.6
    Click Element    ${search_input}
    Click Element    ${apparel_btn}
    ${keyword}=    Get Value    ${search_input}
    Click Element    ${search_button}

     #Verify search result
    ${status_product}=    Run Keyword And Return Status    Page Should Contain Element    ${detail_name}
    Run Keyword If    ${status_product}    Verify Search Result    ${keyword}
    ...    ELSE IF    not ${status_product}    Handle Search Result Des and Model    ${Apparel_accessories}    ${keyword}
    ...    ELSE    Handle No Search Result    ${Apparel_accessories}    
    Close Browser

TC14_Verify search Apparel & accessories "NE"
    [Tags]    Apparel & accessories

    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]

    #Search keyword "NE"
    Input Text    ${search_input}    NE
    Click Element    ${search_input}
    Click Element    ${apparel_btn}
    ${keyword}=    Get Value    ${search_input}
    Click Element    ${search_button}

     #Verify search result
    ${status_product}=    Run Keyword And Return Status    Page Should Contain Element    ${detail_name}
    Run Keyword If    ${status_product}    Verify Search Result    ${keyword}
    ...    ELSE IF    not ${status_product}    Handle Search Result Des and Model    ${Apparel_accessories}    ${keyword}
    ...    ELSE    Handle No Search Result    ${Apparel_accessories}    
    Close Browser   

TC15_Verify search Apparel & accessories "45as4d554d54s55as45d"
    [Tags]    Apparel & accessories

    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]

    #Search keyword "45as4d554d54s55as45d"
    Input Text    ${search_input}    45as4d554d54s55as45d
    Click Element    ${search_input}
    Click Element    ${apparel_btn}
    ${keyword}=    Get Value    ${search_input}
    Click Element    ${search_button}

     #Verify search result
    ${status_product}=    Run Keyword And Return Status    Page Should Contain Element    ${detail_name}
    Run Keyword If    ${status_product}    Verify Search Result    ${keyword}
    ...    ELSE IF    not ${status_product}    Handle Search Result Des and Model    ${Apparel_accessories}    ${keyword}
    ...    ELSE    Handle No Search Result    ${Apparel_accessories}    
    Close Browser  

TC16_Verify search Apparel & accessories "5"
    [Tags]    Apparel & accessories

    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]

    #Search keyword "45as4d554d54s55as45d"
    Input Text    ${search_input}    45as4d554d54s55as45d
    Click Element    ${search_input}
    Click Element    ${apparel_btn}
    ${keyword}=    Get Value    ${search_input}
    Click Element    ${search_button}

     #Verify search result
    ${status_product}=    Run Keyword And Return Status    Page Should Contain Element    ${detail_name}
    Run Keyword If    ${status_product}    Verify Search Result    ${keyword}
    ...    ELSE IF    not ${status_product}    Handle Search Result Des and Model    ${Apparel_accessories}    ${keyword}
    ...    ELSE    Handle No Search Result    ${Apparel_accessories}    
    Close Browser  

TC17_Verify search Apparel & accessories "/-+(*(*((0))))"
    [Tags]    Apparel & accessories

    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]

    #Search keyword "/-+(*(*((0))))"
    Input Text    ${search_input}    /-+(*(*((0))))
    Click Element    ${search_input}
    Click Element    ${apparel_btn}
    ${keyword}=    Get Value    ${search_input}
    Click Element    ${search_button}

     #Verify search result
    ${status_product}=    Run Keyword And Return Status    Page Should Contain Element    ${detail_name}
    Run Keyword If    ${status_product}    Verify Search Result    ${keyword}
    ...    ELSE IF    not ${status_product}    Handle Search Result Des and Model    ${Apparel_accessories}    ${keyword}
    ...    ELSE    Handle No Search Result    ${Apparel_accessories}    
    Close Browser  

TC18_Verify search Apparel & accessories "a"
    [Tags]    Apparel & accessories

    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]

    #Search keyword "a"
    Input Text    ${search_input}    a
    Click Element    ${search_input}
    Click Element    ${apparel_btn}
    ${keyword}=    Get Value    ${search_input}
    Click Element    ${search_button}

     #Verify search result
    ${status_product}=    Run Keyword And Return Status    Page Should Contain Element    ${detail_name}
    Run Keyword If    ${status_product}    Verify Search Result    ${keyword}
    ...    ELSE IF    not ${status_product}    Handle Search Result Des and Model    ${Apparel_accessories}    ${keyword}
    ...    ELSE    Handle No Search Result    ${Apparel_accessories}    
    Close Browser  

TC19_Verify search Makeup name "VIVA GLAM LIPSTICK"
    [Tags]    Makeup

    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]

    #Search keyword "VIVA GLAM LIPSTICK"
    Input Text    ${search_input}    VIVA GLAM LIPSTICK
    Click Element    ${search_input}
    Click Element    ${makeup_btn}
    ${keyword}=    Get Value    ${search_input}
    Click Element    ${search_button}

    #Verify search result
    ${status_product}=    Run Keyword And Return Status    Page Should Contain Element    ${detail_name}
    Run Keyword If    ${status_product}    Verify Search Result    ${keyword}
    ...    ELSE IF    not ${status_product}    Handle Search Result Des and Model    ${makeup}    ${keyword}
    ...    ELSE    Handle No Search Result    ${Apparel_accessories}    
    Close Browser

TC20_Verify search Makeup description "Unique"
    [Tags]    Makeup

    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]

    #Search keyword "Unique"
    Input Text    ${search_input}    Unique
    Click Element    ${search_input}
    Click Element    ${makeup_btn}
    ${keyword}=    Get Value    ${search_input}
    Click Element    ${search_button}

     #Verify search result
    ${status_product}=    Run Keyword And Return Status    Page Should Contain Element    ${detail_name}
    Run Keyword If    ${status_product}    Verify Search Result    ${keyword}
    ...    ELSE IF    not ${status_product}    Handle Search Result Des and Model    ${makeup}    ${keyword}
    ...    ELSE    Handle No Search Result    ${Apparel_accessories}    
    Close Browser   

TC21_Verify search Makeup model "38"
    [Tags]    Makeup

    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]

    #Search keyword "38"
    Input Text    ${search_input}    38
    Click Element    ${search_input}
    Click Element    ${makeup_btn}
    ${keyword}=    Get Value    ${search_input}
    Click Element    ${search_button}

     #Verify search result
    ${status_product}=    Run Keyword And Return Status    Page Should Contain Element    ${detail_name}
    Run Keyword If    ${status_product}    Verify Search Result    ${keyword}
    ...    ELSE IF    not ${status_product}    Handle Search Result Des and Model    ${makeup}    ${keyword}
    ...    ELSE    Handle No Search Result    ${Apparel_accessories}    
    Close Browser

TC22_Verify search Makeup "162"
    [Tags]    Makeup

    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]

    #Search keyword "162"
    Input Text    ${search_input}    162
    Click Element    ${search_input}
    Click Element    ${makeup_btn}
    ${keyword}=    Get Value    ${search_input}
    Click Element    ${search_button}

     #Verify search result
    ${status_product}=    Run Keyword And Return Status    Page Should Contain Element    ${detail_name}
    Run Keyword If    ${status_product}    Verify Search Result    ${keyword}
    ...    ELSE IF    not ${status_product}    Handle Search Result Des and Model    ${makeup}    ${keyword}
    ...    ELSE    Handle No Search Result    ${Apparel_accessories}    
    Close Browser

TC23_Verify search Makeup "Th"
    [Tags]    Makeup

    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]

    #Search keyword "Th"
    Input Text    ${search_input}    Th
    Click Element    ${search_input}
    Click Element    ${makeup_btn}
    ${keyword}=    Get Value    ${search_input}
    Click Element    ${search_button}

     #Verify search result
    ${status_product}=    Run Keyword And Return Status    Page Should Contain Element    ${detail_name}
    Run Keyword If    ${status_product}    Verify Search Result    ${keyword}
    ...    ELSE IF    not ${status_product}    Handle Search Result Des and Model    ${makeup}    ${keyword}
    ...    ELSE    Handle No Search Result    ${Apparel_accessories}    
    Close Browser   

TC24_Verify search Makeup "jsaaoosinf558"
    [Tags]    Makeup

    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]

    #Search keyword "jsaaoosinf558"
    Input Text    ${search_input}    jsaaoosinf558
    Click Element    ${search_input}
    Click Element    ${makeup_btn}
    ${keyword}=    Get Value    ${search_input}
    Click Element    ${search_button}

     #Verify search result
    ${status_product}=    Run Keyword And Return Status    Page Should Contain Element    ${detail_name}
    Run Keyword If    ${status_product}    Verify Search Result    ${keyword}
    ...    ELSE IF    not ${status_product}    Handle Search Result Des and Model    ${makeup}    ${keyword}
    ...    ELSE    Handle No Search Result    ${Apparel_accessories}    
    Close Browser  

TC25_Verify search Makeup "7"
    [Tags]    Makeup

    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]

    #Search keyword "7"
    Input Text    ${search_input}    7
    Click Element    ${search_input}
    Click Element    ${makeup_btn}
    ${keyword}=    Get Value    ${search_input}
    Click Element    ${search_button}

     #Verify search result
    ${status_product}=    Run Keyword And Return Status    Page Should Contain Element    ${detail_name}
    Run Keyword If    ${status_product}    Verify Search Result    ${keyword}
    ...    ELSE IF    not ${status_product}    Handle Search Result Des and Model    ${makeup}    ${keyword}
    ...    ELSE    Handle No Search Result    ${Apparel_accessories}    
    Close Browser  

TC26_Verify search Makeup "kdkasoja#%(%(#))"
    [Tags]    Makeup

    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]

    #Search keyword "kdkasoja#%(%(#))"
    Input Text    ${search_input}    kdkasoja#%(%(#))
    Click Element    ${search_input}
    Click Element    ${makeup_btn}
    ${keyword}=    Get Value    ${search_input}
    Click Element    ${search_button}

     #Verify search result
    ${status_product}=    Run Keyword And Return Status    Page Should Contain Element    ${detail_name}
    Run Keyword If    ${status_product}    Verify Search Result    ${keyword}
    ...    ELSE IF    not ${status_product}    Handle Search Result Des and Model    ${makeup}    ${keyword}
    ...    ELSE    Handle No Search Result    ${Apparel_accessories}    
    Close Browser  

TC27_Verify search Makeup "n"
    [Tags]    Makeup

    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]

    #Search keyword "n"
    Input Text    ${search_input}    n
    Click Element    ${search_input}
    Click Element    ${makeup_btn}
    ${keyword}=    Get Value    ${search_input}
    Click Element    ${search_button}

    #Verify search result
    ${status_product}=    Run Keyword And Return Status    Page Should Contain Element    ${detail_name}
    Run Keyword If    ${status_product}    Verify Search Result    ${keyword}
    ...    ELSE IF    not ${status_product}    Handle Search Result Des and Model    ${makeup}    ${keyword}
    ...    ELSE    Handle No Search Result    ${Apparel_accessories}    
    Close Browser  

TC28_Verify search Skincare name "CREME PRECIEUSE NUIT 50ML"
    [Tags]    Skincare

    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]

    #Search keyword "CREME PRECIEUSE NUIT 50ML"
    Input Text    ${search_input}    CREME PRECIEUSE NUIT 50ML
    Click Element    ${search_input}
    Click Element    ${skincare_btn}
    ${keyword}=    Get Value    ${search_input}
    Click Element    ${search_button}

    #Verify search result
    ${status_product}=    Run Keyword And Return Status    Page Should Contain Element    ${detail_name}
    Run Keyword If    ${status_product}    Verify Search Result    ${keyword}
    ...    ELSE IF    not ${status_product}    Handle Search Result Des and Model    ${skincare}    ${keyword}
    ...    ELSE    Handle No Search Result    ${Apparel_accessories}    
    Close Browser  

TC29_Verify search Skincare description "facial cream"
    [Tags]    Skincare

    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]

    #Search keyword "facial cream"
    Input Text    ${search_input}    facial cream
    Click Element    ${search_input}
    Click Element    ${skincare_btn}
    ${keyword}=    Get Value    ${search_input}
    Click Element    ${search_button}

    #Verify search result
    ${status_product}=    Run Keyword And Return Status    Page Should Contain Element    ${detail_name}
    Run Keyword If    ${status_product}    Verify Search Result    ${keyword}
    ...    ELSE IF    not ${status_product}    Handle Search Result Des and Model    ${skincare}    ${keyword}
    ...    ELSE    Handle No Search Result    ${Apparel_accessories}    
    Close Browser  
TC30_Verify search Skincare model "40"
    [Tags]    Skincare

    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]

    #Search keyword "40"
    Input Text    ${search_input}    40
    Click Element    ${search_input}
    Click Element    ${skincare_btn}
    ${keyword}=    Get Value    ${search_input}
    Click Element    ${search_button}

    #Verify search result
    ${status_product}=    Run Keyword And Return Status    Page Should Contain Element    ${detail_name}
    Run Keyword If    ${status_product}    Verify Search Result    ${keyword}
    ...    ELSE IF    not ${status_product}    Handle Search Result Des and Model    ${skincare}    ${keyword}
    ...    ELSE    Handle No Search Result    ${Apparel_accessories}    
    Close Browser  


TC31_Verify search Skincare "17"
    [Tags]    Skincare

    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]

    #Search keyword "17"
    Input Text    ${search_input}    17
    Click Element    ${search_input}
    Click Element    ${skincare_btn}
    ${keyword}=    Get Value    ${search_input}
    Click Element    ${search_button}

    #Verify search result
    ${status_product}=    Run Keyword And Return Status    Page Should Contain Element    ${detail_name}
    Run Keyword If    ${status_product}    Verify Search Result    ${keyword}
    ...    ELSE IF    not ${status_product}    Handle Search Result Des and Model    ${skincare}    ${keyword}
    ...    ELSE    Handle No Search Result    ${Apparel_accessories}    
    Close Browser  

TC32_Verify search Skincare "HaI"
    [Tags]    Skincare

    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]

    #Search keyword "HaI"
    Input Text    ${search_input}    HaI
    Click Element    ${search_input}
    Click Element    ${skincare_btn}
    ${keyword}=    Get Value    ${search_input}
    Click Element    ${search_button}

    #Verify search result
    ${status_product}=    Run Keyword And Return Status    Page Should Contain Element    ${detail_name}
    Run Keyword If    ${status_product}    Verify Search Result    ${keyword}
    ...    ELSE IF    not ${status_product}    Handle Search Result Des and Model    ${skincare}    ${keyword}
    ...    ELSE    Handle No Search Result    ${Apparel_accessories}    
    Close Browser  

TC33_Verify search Skincare "h2bnojp1o4j"
    [Tags]    Skincare

    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]

    #Search keyword "h2bnojp1o4j"
    Input Text    ${search_input}    h2bnojp1o4j
    Click Element    ${search_input}
    Click Element    ${skincare_btn}
    ${keyword}=    Get Value    ${search_input}
    Click Element    ${search_button}

    #Verify search result
    ${status_product}=    Run Keyword And Return Status    Page Should Contain Element    ${detail_name}
    Run Keyword If    ${status_product}    Verify Search Result    ${keyword}
    ...    ELSE IF    not ${status_product}    Handle Search Result Des and Model    ${skincare}    ${keyword}
    ...    ELSE    Handle No Search Result    ${Apparel_accessories}    
    Close Browser  

TC34_Verify search Skincare "6"
    [Tags]    Skincare

    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]

    #Search keyword "6"
    Input Text    ${search_input}    6
    Click Element    ${search_input}
    Click Element    ${skincare_btn}
    ${keyword}=    Get Value    ${search_input}
    Click Element    ${search_button}

    #Verify search result
    ${status_product}=    Run Keyword And Return Status    Page Should Contain Element    ${detail_name}
    Run Keyword If    ${status_product}    Verify Search Result    ${keyword}
    ...    ELSE IF    not ${status_product}    Handle Search Result Des and Model    ${skincare}    ${keyword}
    ...    ELSE    Handle No Search Result    ${Apparel_accessories}    
    Close Browser  

TC35_Verify search Skincare "/*Q+WE*%()"
    [Tags]    Skincare

    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]

    #Search keyword "/*Q+WE*%()"
    Input Text    ${search_input}    /*Q+WE*%()
    Click Element    ${search_input}
    Click Element    ${skincare_btn}
    ${keyword}=    Get Value    ${search_input}
    Click Element    ${search_button}

    #Verify search result
    ${status_product}=    Run Keyword And Return Status    Page Should Contain Element    ${detail_name}
    Run Keyword If    ${status_product}    Verify Search Result    ${keyword}
    ...    ELSE IF    not ${status_product}    Handle Search Result Des and Model    ${skincare}    ${keyword}
    ...    ELSE    Handle No Search Result    ${Apparel_accessories}    
    Close Browser  

TC36_Verify search Skincare "f"
    [Tags]    Skincare

    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]

    #Search keyword "f"
    Input Text    ${search_input}    f
    Click Element    ${search_input}
    Click Element    ${skincare_btn}
    ${keyword}=    Get Value    ${search_input}
    Click Element    ${search_button}

    #Verify search result
    ${status_product}=    Run Keyword And Return Status    Page Should Contain Element    ${detail_name}
    Run Keyword If    ${status_product}    Verify Search Result    ${keyword}
    ...    ELSE IF    not ${status_product}    Handle Search Result Des and Model    ${skincare}    ${keyword}
    ...    ELSE    Handle No Search Result    ${Apparel_accessories}    
    Close Browser 

TC37_Verify search Fragrance name "GUCCI GUILTY"
    [Tags]    Fragrance

    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]

    #Search keyword "GUCCI GUILTY"
    Input Text    ${search_input}    GUCCI GUILTY
    Click Element    ${search_input}
    Click Element    ${fragrance_btn}
    ${keyword}=    Get Value    ${search_input}
    Click Element    ${search_button}

    #Verify search result
    ${status_product}=    Run Keyword And Return Status    Page Should Contain Element    ${detail_name}
    Run Keyword If    ${status_product}    Verify Search Result    ${keyword}
    ...    ELSE IF    not ${status_product}    Handle Search Result Des and Model    ${fragrance}    ${keyword}
    ...    ELSE    Handle No Search Result    ${Apparel_accessories}    
    Close Browser 

TC38_Verify search Fragrance description "from Calvin Klein"
    [Tags]    Fragrance

    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]

    #Search keyword "from Calvin Klein"
    Input Text    ${search_input}    from Calvin Klein
    Click Element    ${search_input}
    Click Element    ${fragrance_btn}
    ${keyword}=    Get Value    ${search_input}
    Click Element    ${search_button}

    #Verify search result
    ${status_product}=    Run Keyword And Return Status    Page Should Contain Element    ${detail_name}
    Run Keyword If    ${status_product}    Verify Search Result    ${keyword}
    ...    ELSE IF    not ${status_product}    Handle Search Result Des and Model    ${fragrance}    ${keyword}
    ...    ELSE    Handle No Search Result    ${Apparel_accessories}    
    Close Browser 

TC39_Verify search Fragrance model "12"
    [Tags]    Fragrance

    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]

    #Search keyword "12"
    Input Text    ${search_input}    12
    Click Element    ${search_input}
    Click Element    ${fragrance_btn}
    ${keyword}=    Get Value    ${search_input}
    Click Element    ${search_button}

    #Verify search result
    ${status_product}=    Run Keyword And Return Status    Page Should Contain Element    ${detail_name}
    Run Keyword If    ${status_product}    Verify Search Result    ${keyword}
    ...    ELSE IF    not ${status_product}    Handle Search Result Des and Model    ${fragrance}    ${keyword}
    ...    ELSE    Handle No Search Result    ${Apparel_accessories}    
    Close Browser 

TC40_Verify search Fragrance "26.36"
    [Tags]    Fragrance

    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]

    #Search keyword "26.36"
    Input Text    ${search_input}    26.36
    Click Element    ${search_input}
    Click Element    ${fragrance_btn}
    ${keyword}=    Get Value    ${search_input}
    Click Element    ${search_button}

    #Verify search result
    ${status_product}=    Run Keyword And Return Status    Page Should Contain Element    ${detail_name}
    Run Keyword If    ${status_product}    Verify Search Result    ${keyword}
    ...    ELSE IF    not ${status_product}    Handle Search Result Des and Model    ${fragrance}    ${keyword}
    ...    ELSE    Handle No Search Result    ${Apparel_accessories}    
    Close Browser

TC41_Verify search Fragrance "Le"
    [Tags]    Fragrance

    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]

    #Search keyword "Le"
    Input Text    ${search_input}    Le
    Click Element    ${search_input}
    Click Element    ${fragrance_btn}
    ${keyword}=    Get Value    ${search_input}
    Click Element    ${search_button}

    #Verify search result
    ${status_product}=    Run Keyword And Return Status    Page Should Contain Element    ${detail_name}
    Run Keyword If    ${status_product}    Verify Search Result    ${keyword}
    ...    ELSE IF    not ${status_product}    Handle Search Result Des and Model    ${fragrance}    ${keyword}
    ...    ELSE    Handle No Search Result    ${Apparel_accessories}    
    Close Browser  

TC42_Verify search Fragrance "snsjksoaonfnskalfnafldkjjjjjjjjjjjjjjjjjjjwieoutdsdnigih gưeioeciohewhgiohiohiosgh"
    [Tags]    Fragrance

    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]

    #Search keyword "snsjksoaonfnskalfnafldkjjjjjjjjjjjjjjjjjjjwieoutdsdnigih gưeioeciohewhgiohiohiosgh"
    Input Text    ${search_input}    snsjksoaonfnskalfnafldkjjjjjjjjjjjjjjjjjjjwieoutdsdnigih gưeioeciohewhgiohiohiosgh
    Click Element    ${search_input}
    Click Element    ${fragrance_btn}
    ${keyword}=    Get Value    ${search_input}
    Click Element    ${search_button}

    #Verify search result
    ${status_product}=    Run Keyword And Return Status    Page Should Contain Element    ${detail_name}
    Run Keyword If    ${status_product}    Verify Search Result    ${keyword}
    ...    ELSE IF    not ${status_product}    Handle Search Result Des and Model    ${fragrance}    ${keyword}
    ...    ELSE    Handle No Search Result    ${Apparel_accessories}    
    Close Browser  

TC43_Verify search Fragrance "9"
    [Tags]    Fragrance

    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]

    #Search keyword "9"
    Input Text    ${search_input}    9
    Click Element    ${search_input}
    Click Element    ${fragrance_btn}
    ${keyword}=    Get Value    ${search_input}
    Click Element    ${search_button}

    #Verify search result
    ${status_product}=    Run Keyword And Return Status    Page Should Contain Element    ${detail_name}
    Run Keyword If    ${status_product}    Verify Search Result    ${keyword}
    ...    ELSE IF    not ${status_product}    Handle Search Result Des and Model    ${fragrance}    ${keyword}
    ...    ELSE    Handle No Search Result    ${Apparel_accessories}    
    Close Browser  

TC44_Verify search Fragrance "!~!U#!YYU~#~~"
    [Tags]    Fragrance

    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]

    #Search keyword "!~!U#!YYU~#~~"
    Input Text    ${search_input}    !~!U#!YYU~#~~
    Click Element    ${search_input}
    Click Element    ${fragrance_btn}
    ${keyword}=    Get Value    ${search_input}
    Click Element    ${search_button}

    #Verify search result
    ${status_product}=    Run Keyword And Return Status    Page Should Contain Element    ${detail_name}
    Run Keyword If    ${status_product}    Verify Search Result    ${keyword}
    ...    ELSE IF    not ${status_product}    Handle Search Result Des and Model    ${fragrance}    ${keyword}
    ...    ELSE    Handle No Search Result    ${Apparel_accessories}    
    Close Browser  

TC45_Verify search Fragrance "q"
    [Tags]    Fragrance

    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]

    #Search keyword "q"
    Input Text    ${search_input}    q
    Click Element    ${search_input}
    Click Element    ${fragrance_btn}
    ${keyword}=    Get Value    ${search_input}
    Click Element    ${search_button}

    #Verify search result
    ${status_product}=    Run Keyword And Return Status    Page Should Contain Element    ${detail_name}
    Run Keyword If    ${status_product}    Verify Search Result    ${keyword}
    ...    ELSE IF    not ${status_product}    Handle Search Result Des and Model    ${fragrance}    ${keyword}
    ...    ELSE    Handle No Search Result    ${Apparel_accessories}    
    Close Browser  

TC46_Verify search Men name "ck IN2U Eau De Toilette Spray for Him"
    [Tags]    Men

    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]

    #Search keyword "ck IN2U Eau De Toilette Spray for Him"
    Input Text    ${search_input}    ck IN2U Eau De Toilette Spray for Him
    Click Element    ${search_input}
    Click Element    ${men_btn}
    ${keyword}=    Get Value    ${search_input}
    Click Element    ${search_button}

    #Verify search result
    ${status_product}=    Run Keyword And Return Status    Page Should Contain Element    ${detail_name}
    Run Keyword If    ${status_product}    Verify Search Result    ${keyword}
    ...    ELSE IF    not ${status_product}    Handle Search Result Des and Model    ${men}    ${keyword}
    ...    ELSE    Handle No Search Result    ${Apparel_accessories}    
    Close Browser 

TC47_Verify search Men description "With purifying grains"
    [Tags]    Men

    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]

    #Search keyword "With purifying grains"
    Input Text    ${search_input}    With purifying grains
    Click Element    ${search_input}
    Click Element    ${men_btn}
    ${keyword}=    Get Value    ${search_input}
    Click Element    ${search_button}

    #Verify search result
    ${status_product}=    Run Keyword And Return Status    Page Should Contain Element    ${detail_name}
    Run Keyword If    ${status_product}    Verify Search Result    ${keyword}
    ...    ELSE IF    not ${status_product}    Handle Search Result Des and Model    ${men}    ${keyword}
    ...    ELSE    Handle No Search Result    ${Apparel_accessories}    
    Close Browser 

TC48_Verify search Men model "DMBW0014"
    [Tags]    Men

    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]

    #Search keyword "DMBW0014"
    Input Text    ${search_input}    DMBW0014
    Click Element    ${search_input}
    Click Element    ${men_btn}
    ${keyword}=    Get Value    ${search_input}
    Click Element    ${search_button}

    #Verify search result
    ${status_product}=    Run Keyword And Return Status    Page Should Contain Element    ${detail_name}
    Run Keyword If    ${status_product}    Verify Search Result    ${keyword}
    ...    ELSE IF    not ${status_product}    Handle Search Result Des and Model    ${men}    ${keyword}
    ...    ELSE    Handle No Search Result    ${Apparel_accessories}    
    Close Browser 

TC49_Verify search Men "18"
    [Tags]    Men

    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]

    #Search keyword "18"
    Input Text    ${search_input}    18
    Click Element    ${search_input}
    Click Element    ${men_btn}
    ${keyword}=    Get Value    ${search_input}
    Click Element    ${search_button}

    #Verify search result
    ${status_product}=    Run Keyword And Return Status    Page Should Contain Element    ${detail_name}
    Run Keyword If    ${status_product}    Verify Search Result    ${keyword}
    ...    ELSE IF    not ${status_product}    Handle Search Result Des and Model    ${men}    ${keyword}
    ...    ELSE    Handle No Search Result    ${Apparel_accessories}    
    Close Browser 

TC50_Verify search Men "ck"
    [Tags]    Men

    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]

    #Search keyword "ck"
    Input Text    ${search_input}    ck
    Click Element    ${search_input}
    Click Element    ${men_btn}
    ${keyword}=    Get Value    ${search_input}
    Click Element    ${search_button}

    #Verify search result
    ${status_product}=    Run Keyword And Return Status    Page Should Contain Element    ${detail_name}
    Run Keyword If    ${status_product}    Verify Search Result    ${keyword}
    ...    ELSE IF    not ${status_product}    Handle Search Result Des and Model    ${men}    ${keyword}
    ...    ELSE    Handle No Search Result    ${Apparel_accessories}    
    Close Browser 

TC51_Verify search Men "hqiwhfhioa569979"
    [Tags]    Men

    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]

    #Search keyword "hqiwhfhioa569979"
    Input Text    ${search_input}    hqiwhfhioa569979
    Click Element    ${search_input}
    Click Element    ${men_btn}
    ${keyword}=    Get Value    ${search_input}
    Click Element    ${search_button}

    #Verify search result
    ${status_product}=    Run Keyword And Return Status    Page Should Contain Element    ${detail_name}
    Run Keyword If    ${status_product}    Verify Search Result    ${keyword}
    ...    ELSE IF    not ${status_product}    Handle Search Result Des and Model    ${men}    ${keyword}
    ...    ELSE    Handle No Search Result    ${Apparel_accessories}    
    Close Browser 

TC52_Verify search Men "2"
    [Tags]    Men

    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]

    #Search keyword "2"
    Input Text    ${search_input}    2
    Click Element    ${search_input}
    Click Element    ${men_btn}
    ${keyword}=    Get Value    ${search_input}
    Click Element    ${search_button}

    #Verify search result
    ${status_product}=    Run Keyword And Return Status    Page Should Contain Element    ${detail_name}
    Run Keyword If    ${status_product}    Verify Search Result    ${keyword}
    ...    ELSE IF    not ${status_product}    Handle Search Result Des and Model    ${men}    ${keyword}
    ...    ELSE    Handle No Search Result    ${Apparel_accessories}    
    Close Browser 

TC53_Verify search Men ">?>?<?<?":""
    [Tags]    Men

    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]

    #Search keyword ">?>?<?<?":""
    Input Text    ${search_input}    >?>?<?<?":"
    Click Element    ${search_input}
    Click Element    ${men_btn}
    ${keyword}=    Get Value    ${search_input}
    Click Element    ${search_button}

    #Verify search result
    ${status_product}=    Run Keyword And Return Status    Page Should Contain Element    ${detail_name}
    Run Keyword If    ${status_product}    Verify Search Result    ${keyword}
    ...    ELSE IF    not ${status_product}    Handle Search Result Des and Model    ${men}    ${keyword}
    ...    ELSE    Handle No Search Result    ${Apparel_accessories}    
    Close Browser 

TC54_Verify search Men "c"
    [Tags]    Men

    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]

    #Search keyword "c"
    Input Text    ${search_input}    c
    Click Element    ${search_input}
    Click Element    ${men_btn}
    ${keyword}=    Get Value    ${search_input}
    Click Element    ${search_button}

    #Verify search result
    ${status_product}=    Run Keyword And Return Status    Page Should Contain Element    ${detail_name}
    Run Keyword If    ${status_product}    Verify Search Result    ${keyword}
    ...    ELSE IF    not ${status_product}    Handle Search Result Des and Model    ${men}    ${keyword}
    ...    ELSE    Handle No Search Result    ${Apparel_accessories}    
    Close Browser 

TC55_Verify search Hair Care name "EAU PARFUMEE AU THE VERT SHAMPOO"
    [Tags]    Hair Care

    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]

    #Search keyword "EAU PARFUMEE AU THE VERT SHAMPOO"
    Input Text    ${search_input}    EAU PARFUMEE AU THE VERT SHAMPOO
    Click Element    ${search_input}
    Click Element    ${haircare_btn}
    ${keyword}=    Get Value    ${search_input}
    Click Element    ${search_button}

    #Verify search result
    ${status_product}=    Run Keyword And Return Status    Page Should Contain Element    ${detail_name}
    Run Keyword If    ${status_product}    Verify Search Result    ${keyword}
    ...    ELSE IF    not ${status_product}    Handle Search Result Des and Model    ${haircare}    ${keyword}
    ...    ELSE    Handle No Search Result    ${Apparel_accessories}    
    Close Browser 
TC56_Verify search Hair Care description "Curly hair is left ready for frizz controlled straight styling, and protected from styling damage"
    [Tags]    Hair Care

    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]

    #Search keyword "Curly hair is left ready for frizz controlled straight styling, and protected from styling damage"
    Input Text    ${search_input}    Curly hair is left ready for frizz controlled straight styling, and protected from styling damage
    Click Element    ${search_input}
    Click Element    ${haircare_btn}
    ${keyword}=    Get Value    ${search_input}
    Click Element    ${search_button}

    #Verify search result
    ${status_product}=    Run Keyword And Return Status    Page Should Contain Element    ${detail_name}
    Run Keyword If    ${status_product}    Verify Search Result    ${keyword}
    ...    ELSE IF    not ${status_product}    Handle Search Result Des and Model    ${haircare}    ${keyword}
    ...    ELSE    Handle No Search Result    ${Apparel_accessories}    
    Close Browser 

TC57_Verify search Hair Care model "SCND001"
    [Tags]    Hair Care

    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]

    #Search keyword "SCND001"
    Input Text    ${search_input}    SCND001
    Click Element    ${search_input}
    Click Element    ${haircare_btn}
    ${keyword}=    Get Value    ${search_input}
    Click Element    ${search_button}

    #Verify search result
    ${status_product}=    Run Keyword And Return Status    Page Should Contain Element    ${detail_name}
    Run Keyword If    ${status_product}    Verify Search Result    ${keyword}
    ...    ELSE IF    not ${status_product}    Handle Search Result Des and Model    ${haircare}    ${keyword}
    ...    ELSE    Handle No Search Result    ${Apparel_accessories}    
    Close Browser 

TC58_Verify search Hair Care "296"
    [Tags]    Hair Care

    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]

    #Search keyword "296"
    Input Text    ${search_input}    296
    Click Element    ${search_input}
    Click Element    ${haircare_btn}
    ${keyword}=    Get Value    ${search_input}
    Click Element    ${search_button}

    #Verify search result
    ${status_product}=    Run Keyword And Return Status    Page Should Contain Element    ${detail_name}
    Run Keyword If    ${status_product}    Verify Search Result    ${keyword}
    ...    ELSE IF    not ${status_product}    Handle Search Result Des and Model    ${haircare}    ${keyword}
    ...    ELSE    Handle No Search Result    ${Apparel_accessories}    
    Close Browser 

TC59_Verify search Hair Care "dove"
    [Tags]    Hair Care

    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]

    #Search keyword "dove"
    Input Text    ${search_input}    dove
    Click Element    ${search_input}
    Click Element    ${haircare_btn}
    ${keyword}=    Get Value    ${search_input}
    Click Element    ${search_button}

    #Verify search result
    ${status_product}=    Run Keyword And Return Status    Page Should Contain Element    ${detail_name}
    Run Keyword If    ${status_product}    Verify Search Result    ${keyword}
    ...    ELSE IF    not ${status_product}    Handle Search Result Des and Model    ${haircare}    ${keyword}
    ...    ELSE    Handle No Search Result    ${Apparel_accessories}    
    Close Browser 

TC60_Verify search Hair Care "IAOAhfihwirFOOPSFAJp"
    [Tags]    Hair Care

    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]

    #Search keyword "IAOAhfihwirFOOPSFAJp"
    Input Text    ${search_input}    IAOAhfihwirFOOPSFAJp
    Click Element    ${search_input}
    Click Element    ${haircare_btn}
    ${keyword}=    Get Value    ${search_input}
    Click Element    ${search_button}

    #Verify search result
    ${status_product}=    Run Keyword And Return Status    Page Should Contain Element    ${detail_name}
    Run Keyword If    ${status_product}    Verify Search Result    ${keyword}
    ...    ELSE IF    not ${status_product}    Handle Search Result Des and Model    ${haircare}    ${keyword}
    ...    ELSE    Handle No Search Result    ${Apparel_accessories}    
    Close Browser 

TC61_Verify search Hair Care "8"
    [Tags]    Hair Care

    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]

    #Search keyword "8"
    Input Text    ${search_input}    8
    Click Element    ${search_input}
    Click Element    ${haircare_btn}
    ${keyword}=    Get Value    ${search_input}
    Click Element    ${search_button}

    #Verify search result
    ${status_product}=    Run Keyword And Return Status    Page Should Contain Element    ${detail_name}
    Run Keyword If    ${status_product}    Verify Search Result    ${keyword}
    ...    ELSE IF    not ${status_product}    Handle Search Result Des and Model    ${haircare}    ${keyword}
    ...    ELSE    Handle No Search Result    ${Apparel_accessories}    
    Close Browser 

TC62_Verify search Hair Care "Ư|||Ơ}Ơ|Ư)++_"
    [Tags]    Hair Care

    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]

    #Search keyword "Ư|||Ơ}Ơ|Ư)++_"
    Input Text    ${search_input}    Ư|||Ơ}Ơ|Ư)++_
    Click Element    ${search_input}
    Click Element    ${haircare_btn}
    ${keyword}=    Get Value    ${search_input}
    Click Element    ${search_button}

    #Verify search result
    ${status_product}=    Run Keyword And Return Status    Page Should Contain Element    ${detail_name}
    Run Keyword If    ${status_product}    Verify Search Result    ${keyword}
    ...    ELSE IF    not ${status_product}    Handle Search Result Des and Model    ${haircare}    ${keyword}
    ...    ELSE    Handle No Search Result    ${Apparel_accessories}    
    Close Browser 

TC63_Verify search Hair Care "l"
    [Tags]    Hair Care

    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]

    #Search keyword "l"
    Input Text    ${search_input}    l
    Click Element    ${search_input}
    Click Element    ${haircare_btn}
    ${keyword}=    Get Value    ${search_input}
    Click Element    ${search_button}

    #Verify search result
    ${status_product}=    Run Keyword And Return Status    Page Should Contain Element    ${detail_name}
    Run Keyword If    ${status_product}    Verify Search Result    ${keyword}
    ...    ELSE IF    not ${status_product}    Handle Search Result Des and Model    ${haircare}    ${keyword}
    ...    ELSE    Handle No Search Result    ${Apparel_accessories}    
    Close Browser 

TC64_Verify search Books name "ALLEGIANT BY VERONICA ROTH"
    [Tags]    Books

    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]

    #Search keyword "ALLEGIANT BY VERONICA ROTH"
    Input Text    ${search_input}    ALLEGIANT BY VERONICA ROTH
    Click Element    ${search_input}
    Click Element    ${books_btn}
    ${keyword}=    Get Value    ${search_input}
    Click Element    ${search_button}

    #Verify search result
    ${status_product}=    Run Keyword And Return Status    Page Should Contain Element    ${detail_name}
    Run Keyword If    ${status_product}    Verify Search Result    ${keyword}
    ...    ELSE IF    not ${status_product}    Handle Search Result Des and Model    ${books}    ${keyword}
    ...    ELSE    Handle No Search Result    ${Apparel_accessories}    
    Close Browser 

TC65_Verify search Books description "Working progressively"
    [Tags]    Books

    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]

    #Search keyword "Working progressively"
    Input Text    ${search_input}    Working progressively
    Click Element    ${search_input}
    Click Element    ${books_btn}
    ${keyword}=    Get Value    ${search_input}
    Click Element    ${search_button}

    #Verify search result
    ${status_product}=    Run Keyword And Return Status    Page Should Contain Element    ${detail_name}
    Run Keyword If    ${status_product}    Verify Search Result    ${keyword}
    ...    ELSE IF    not ${status_product}    Handle Search Result Des and Model    ${books}    ${keyword}
    ...    ELSE    Handle No Search Result    ${Apparel_accessories}    
    Close Browser

TC66_Verify search Books "27"
    [Tags]    Books

    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]

    #Search keyword "27"
    Input Text    ${search_input}    27
    Click Element    ${search_input}
    Click Element    ${books_btn}
    ${keyword}=    Get Value    ${search_input}
    Click Element    ${search_button}

    #Verify search result
    ${status_product}=    Run Keyword And Return Status    Page Should Contain Element    ${detail_name}
    Run Keyword If    ${status_product}    Verify Search Result    ${keyword}
    ...    ELSE IF    not ${status_product}    Handle Search Result Des and Model    ${books}    ${keyword}
    ...    ELSE    Handle No Search Result    ${Apparel_accessories}    
    Close Browser

TC67_Verify search Books "cd"
    [Tags]    Books

    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]

    #Search keyword "cd"
    Input Text    ${search_input}    cd
    Click Element    ${search_input}
    Click Element    ${books_btn}
    ${keyword}=    Get Value    ${search_input}
    Click Element    ${search_button}

    #Verify search result
    ${status_product}=    Run Keyword And Return Status    Page Should Contain Element    ${detail_name}
    Run Keyword If    ${status_product}    Verify Search Result    ${keyword}
    ...    ELSE IF    not ${status_product}    Handle Search Result Des and Model    ${books}    ${keyword}
    ...    ELSE    Handle No Search Result    ${Apparel_accessories}    
    Close Browser

TC68_Verify search Books "kasnfowpw"
    [Tags]    Books

    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]

    #Search keyword "kasnfowpw"
    Input Text    ${search_input}    kasnfowpw
    Click Element    ${search_input}
    Click Element    ${books_btn}
    ${keyword}=    Get Value    ${search_input}
    Click Element    ${search_button}

    #Verify search result
    ${status_product}=    Run Keyword And Return Status    Page Should Contain Element    ${detail_name}
    Run Keyword If    ${status_product}    Verify Search Result    ${keyword}
    ...    ELSE IF    not ${status_product}    Handle Search Result Des and Model    ${books}    ${keyword}
    ...    ELSE    Handle No Search Result    ${Apparel_accessories}    
    Close Browser

TC69_Verify search Books "0"
    [Tags]    Books

    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]

    #Search keyword "0"
    Input Text    ${search_input}    0
    Click Element    ${search_input}
    Click Element    ${books_btn}
    ${keyword}=    Get Value    ${search_input}
    Click Element    ${search_button}

    #Verify search result
    ${status_product}=    Run Keyword And Return Status    Page Should Contain Element    ${detail_name}
    Run Keyword If    ${status_product}    Verify Search Result    ${keyword}
    ...    ELSE IF    not ${status_product}    Handle Search Result Des and Model    ${books}    ${keyword}
    ...    ELSE    Handle No Search Result    ${Apparel_accessories}    
    Close Browser

TC70_Verify search Books "{}||\:;';'>?"
    [Tags]    Books

    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]

    #Search keyword "{}||\:;';'>?"
    Input Text    ${search_input}    {}||\:;';'>?
    Click Element    ${search_input}
    Click Element    ${books_btn}
    ${keyword}=    Get Value    ${search_input}
    Click Element    ${search_button}

    #Verify search result
    ${status_product}=    Run Keyword And Return Status    Page Should Contain Element    ${detail_name}
    Run Keyword If    ${status_product}    Verify Search Result    ${keyword}
    ...    ELSE IF    not ${status_product}    Handle Search Result Des and Model    ${books}    ${keyword}
    ...    ELSE    Handle No Search Result    ${Apparel_accessories}    
    Close Browser

TC71_Verify search Books "d"
    [Tags]    Books

    Open Browser    ${url}    ${browser}
    Page Should Contain Element    xpath=//div[@class="banner_container"]

    #Search keyword "d"
    Input Text    ${search_input}    d
    Click Element    ${search_input}
    Click Element    ${books_btn}
    ${keyword}=    Get Value    ${search_input}
    Click Element    ${search_button}

    #Verify search result
    ${status_product}=    Run Keyword And Return Status    Page Should Contain Element    ${detail_name}
    Run Keyword If    ${status_product}    Verify Search Result    ${keyword}
    ...    ELSE IF    not ${status_product}    Handle Search Result Des and Model    ${books}    ${keyword}
    ...    ELSE    Handle No Search Result    ${Apparel_accessories}    
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

Verify Search Result
    [Arguments]    ${keyword}    
    ${keyword}    Set Variable    ${keyword.upper()}
    ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
    ${detail_name}    Set Variable    ${detail_name.upper()}
    Should Contain    ${detail_name}    ${keyword}

Handle No Search Result
    [Arguments]    ${filter}
    ${selected_text}=    Get Selected List Label    id=category_id
    Should Contain    ${selected_text}    ${filter}
    ${msg}=    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/div/div[2]
    Should Be Equal As Strings    ${msg}    There is no product that matches the search criteria.

Handle Search Result Des and Model
    [Arguments]    ${filter}    ${keyword}   
    ${keyword}    Set Variable    ${keyword.upper()}
    ${selected_text}=    Get Selected List Label    id=category_id
    Should Contain    ${selected_text}    ${filter}
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}
    FOR    ${index}    IN RANGE    ${product_names.__len__()}
        Should Contain    ${product_names}[${index}]    ${keyword}
    END
    Click Element    id=description
    Click Element    id=model
    Click Button    id=search_button
    ${product_names}    Create List
    ${product_prices}    Create List
    ${product_links}    Create List
    Create list product    ${product_names}    ${product_prices}    ${product_links}
    FOR    ${index}    IN RANGE    ${product_names.__len__()}
        Go To    ${product_links}[${index}]
        ${detail_name}=    Get Text    xpath=//h1[@class='productname']/span[@class='bgnone']
        ${detail_name}    Set Variable    ${detail_name.upper()}
        ${name}=    Run Keyword And Return Status     Should Be Equal As Strings    ${detail_name}    ${keyword}
        ${description}=    Get Text    xpath=//*[@id="description"]
        ${description}    Set Variable    ${description.upper()}
        ${check_des}=    Run Keyword And Return Status    Should Contain    ${description}    ${keyword}
        Run Keyword If    ${name} or ${check_des}    Continue For Loop
        Go Back    
    END


