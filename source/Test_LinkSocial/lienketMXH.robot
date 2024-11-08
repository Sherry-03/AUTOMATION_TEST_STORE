*** Settings ***
Library           SeleniumLibrary
Library           OperatingSystem
Library           String
Library           BuiltIn
Library           Collections
*** Variables ***
${URL}    https://automationteststore.com/
${Login_or_register}    //*[@id="customer_menu_top"]/li
${Login}    //*[@id="loginFrm"]/fieldset/button
*** Tasks ***
TC1: LK MXH Chrome Maximize Browser Window Facebook
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Click Element   ${Login_or_register} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Page Should Contain Element    //*[@id="loginFrm_loginname"]
    Page Should Contain Element    //*[@id="loginFrm_password"]
    Page Should Contain Element    //*[@id="loginFrm"]/fieldset/button
    Input Text    //*[@id="loginFrm_loginname"]    ttrinhtrinhhuynh16
    Input Password    //*[@id="loginFrm_password"]    Trinh@2003
    Click Element   ${Login} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/account
    Mouse Over    xpath=//a[@title="Facebook"]
    Execute JavaScript    document.querySelector('a[title="Facebook"]').click();
    sleep    2s
    Switch Window    NEW
    Title Should Be    Facebook – log in or sign up
    Location Should Be    https://www.facebook.com/
    Close Browser
TC2: LK MXH Chrome màn hình tự do fb
    Open Browser    ${URL}    Chrome
    Select From List By Value    //*[@id="topnav"]/select    https://automationteststore.com/index.php?rt=account/login
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Page Should Contain Element    //*[@id="loginFrm_loginname"]
    Page Should Contain Element    //*[@id="loginFrm_password"]
    Page Should Contain Element    //*[@id="loginFrm"]/fieldset/button
    Input Text    //*[@id="loginFrm_loginname"]    ttrinhtrinhhuynh16
    Input Password    //*[@id="loginFrm_password"]    Trinh@2003
    Click Element   ${Login} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/account
    Mouse Over    xpath=//a[@title="Facebook"]
    Execute JavaScript    document.querySelector('a[title="Facebook"]').click();
    sleep    2s
    Switch Window    NEW
    Title Should Be    Facebook – log in or sign up
    Location Should Be    https://www.facebook.com/
    Close Browser
TC3: LK MXH Chrome 800 600 fb
    Open Browser    ${URL}    Chrome
    Set Window Size    800    600
    Select From List By Value    //*[@id="topnav"]/select    https://automationteststore.com/index.php?rt=account/login
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Page Should Contain Element    //*[@id="loginFrm_loginname"]
    Page Should Contain Element    //*[@id="loginFrm_password"]
    Page Should Contain Element    //*[@id="loginFrm"]/fieldset/button
    Input Text    //*[@id="loginFrm_loginname"]    ttrinhtrinhhuynh16
    Input Password    //*[@id="loginFrm_password"]    Trinh@2003
    Click Element   ${Login} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/account
    Mouse Over    xpath=//a[@title="Facebook"]
    Execute JavaScript    document.querySelector('a[title="Facebook"]').click();
    sleep    2s
    Switch Window    NEW
    Title Should Be    Facebook – log in or sign up
    Location Should Be    https://www.facebook.com/
    Close Browser
TC4: LK MXH Chrome Maximize Browser Window X
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Click Element   ${Login_or_register} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Page Should Contain Element    //*[@id="loginFrm_loginname"]
    Page Should Contain Element    //*[@id="loginFrm_password"]
    Page Should Contain Element    //*[@id="loginFrm"]/fieldset/button
    Input Text    //*[@id="loginFrm_loginname"]    chinhchinh2003
    Input Password    //*[@id="loginFrm_password"]    Trinh@2003
    Click Element   ${Login} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/account
    Mouse Over    xpath=//a[@title="Twitter"]
    Execute JavaScript    document.querySelector('a[title="Twitter"]').click();
    sleep    2s
    Switch Window    NEW
    Title Should Be    X. It’s what’s happening / X
    Location Should Be    https://twitter.com/
    Close Browser
TC5: LK MXH Chrome màn hình tự do X
    Open Browser    ${URL}    Chrome
    Select From List By Value    //*[@id="topnav"]/select    https://automationteststore.com/index.php?rt=account/login
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Page Should Contain Element    //*[@id="loginFrm_loginname"]
    Page Should Contain Element    //*[@id="loginFrm_password"]
    Page Should Contain Element    //*[@id="loginFrm"]/fieldset/button
    Input Text    //*[@id="loginFrm_loginname"]    chinhchinh2003
    Input Password    //*[@id="loginFrm_password"]    Trinh@2003
    Click Element   ${Login} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/account
    Mouse Over    xpath=//a[@title="Twitter"]
    Execute JavaScript    document.querySelector('a[title="Twitter"]').click();
    sleep    2s
    Switch Window    NEW
    Title Should Be    X. It’s what’s happening / X
    Location Should Be    https://twitter.com/
    Close Browser
TC6: LK MXH Chrome 800 600 X
    Open Browser    ${URL}    Chrome
    Set Window Size    800    600
    Select From List By Value    //*[@id="topnav"]/select    https://automationteststore.com/index.php?rt=account/login
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Page Should Contain Element    //*[@id="loginFrm_loginname"]
    Page Should Contain Element    //*[@id="loginFrm_password"]
    Page Should Contain Element    //*[@id="loginFrm"]/fieldset/button
    Input Text    //*[@id="loginFrm_loginname"]    chinhchinh2003
    Input Password    //*[@id="loginFrm_password"]    Trinh@2003
    Click Element   ${Login} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/account
    Mouse Over    xpath=//a[@title="Twitter"]
    Execute JavaScript    document.querySelector('a[title="Twitter"]').click();
    sleep    2s
    Switch Window    NEW
    Title Should Be    X. It’s what’s happening / X
    Location Should Be    https://twitter.com/
    Close Browser
TC7: LK MXH edge Maximize Browser Window in
    Open Browser    ${URL}    edge
    Maximize Browser Window
    Click Element   ${Login_or_register} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Page Should Contain Element    //*[@id="loginFrm_loginname"]
    Page Should Contain Element    //*[@id="loginFrm_password"]
    Page Should Contain Element    //*[@id="loginFrm"]/fieldset/button
    Input Text    //*[@id="loginFrm_loginname"]    ttrinhtrinhhuynh16
    Input Password    //*[@id="loginFrm_password"]    Trinh@2003
    Click Element   ${Login} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/account
    Mouse Over    xpath=//a[@title="Linkedin"]
    Execute JavaScript    document.querySelector('a[title="Linkedin"]').click();
    sleep    2s
    Title Should Be    LinkedIn: Log In or Sign Up
    Location Should Be    https://uk.linkedin.com/
    Close Browser
TC8: LK MXH edge in màn hinhf tự do
    Open Browser    ${URL}    edge
    Select From List By Value    //*[@id="topnav"]/select    https://automationteststore.com/index.php?rt=account/login
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Page Should Contain Element    //*[@id="loginFrm_loginname"]
    Page Should Contain Element    //*[@id="loginFrm_password"]
    Page Should Contain Element    //*[@id="loginFrm"]/fieldset/button
    Input Text    //*[@id="loginFrm_loginname"]    ttrinhtrinhhuynh16
    Input Password    //*[@id="loginFrm_password"]    Trinh@2003
    Click Element   ${Login} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/account
    Mouse Over    xpath=//a[@title="Linkedin"]
    Execute JavaScript    document.querySelector('a[title="Linkedin"]').click();
    sleep    2s
    Title Should Be    LinkedIn: Log In or Sign Up
    Location Should Be    https://uk.linkedin.com/
    Close Browser
TC9: LK MXH firefox màn hình tự do fb
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Click Element   ${Login_or_register} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Page Should Contain Element    //*[@id="loginFrm_loginname"]
    Page Should Contain Element    //*[@id="loginFrm_password"]
    Page Should Contain Element    //*[@id="loginFrm"]/fieldset/button
    Input Text    //*[@id="loginFrm_loginname"]    chinhchinh2003
    Input Password    //*[@id="loginFrm_password"]    Trinh@2003
    Click Element   ${Login} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/account
    Wait Until Element Is Visible    xpath=//div[@class="footer_block"]//a[@title="Facebook"]    timeout=20s
    Scroll Element Into View    xpath=//div[@class="footer_block"]//a[@title="Facebook"]
    Mouse Over    xpath=//div[@class="footer_block"]//a[@title="Facebook"]
    Execute JavaScript    document.querySelector('div.footer_block a[title="Facebook"]').click();
    sleep    2s
    Switch Window    NEW
    Title Should Be    Facebook – log in or sign up
    Location Should Be    https://www.facebook.com/
    Close Browser

TC10: LK MXH Chrome Maximize Browser Window x
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Click Element   ${Login_or_register} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Page Should Contain Element    //*[@id="loginFrm_loginname"]
    Page Should Contain Element    //*[@id="loginFrm_password"]
    Page Should Contain Element    //*[@id="loginFrm"]/fieldset/button
    Input Text    //*[@id="loginFrm_loginname"]    ttrinhtrinhhuynh19
    Input Password    //*[@id="loginFrm_password"]    Trinh@2003
    Click Element   ${Login} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/account
    Scroll Element Into View    xpath=//div[@class="footer_block"]//a[@title="Twitter"]
    Mouse Over    xpath=//div[@class="footer_block"]//a[@title="Twitter"]
    Execute JavaScript    document.querySelector('div.footer_block a[title="Twitter"]').click();
    sleep    2s
    Switch Window    NEW
    Title Should Be    X. It’s what’s happening / X
    Location Should Be    https://twitter.com/
    Close Browser
TC11: LK MXH Chrome màn hình tự do x
    Open Browser    ${URL}    Chrome
    Select From List By Value    //*[@id="topnav"]/select    https://automationteststore.com/index.php?rt=account/login
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Page Should Contain Element    //*[@id="loginFrm_loginname"]
    Page Should Contain Element    //*[@id="loginFrm_password"]
    Page Should Contain Element    //*[@id="loginFrm"]/fieldset/button
    Input Text    //*[@id="loginFrm_loginname"]    ttrinhtrinhhuynh19
    Input Password    //*[@id="loginFrm_password"]    Trinh@2003
    Click Element   ${Login} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/account
    Mouse Over    xpath=//div[@class="footer_block"]//a[@title="Twitter"]
    Execute JavaScript    document.querySelector('div.footer_block a[title="Twitter"]').click();
    sleep    2s
    Switch Window    NEW
    Title Should Be    X. It’s what’s happening / X
    Location Should Be    https://twitter.com/
    Close Browser
TC12: LK MXH Chrome 800 600 x
    Open Browser    ${URL}    Chrome
    #Select From List By Value    //*[@id="topnav"]/select    https://automationteststore.com/index.php?rt=account/logout
    Select From List By Value    //*[@id="topnav"]/select    https://automationteststore.com/index.php?rt=account/login
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Page Should Contain Element    //*[@id="loginFrm_loginname"]
    Page Should Contain Element    //*[@id="loginFrm_password"]
    Page Should Contain Element    //*[@id="loginFrm"]/fieldset/button
    Input Text    //*[@id="loginFrm_loginname"]    ttrinhtrinhhuynh19
    Input Password    //*[@id="loginFrm_password"]    Trinh@2003
    Click Element   ${Login} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/account
    Mouse Over    xpath=//div[@class="footer_block"]//a[@title="Twitter"]
    Execute JavaScript    document.querySelector('div.footer_block a[title="Twitter"]').click();
    sleep    2s
    Switch Window    NEW
    Title Should Be    X. It’s what’s happening / X
    Location Should Be    https://twitter.com/
    Close Browser

TC13: LK MXH Chrome Maximize Browser Window in
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Click Element   ${Login_or_register} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Page Should Contain Element    //*[@id="loginFrm_loginname"]
    Page Should Contain Element    //*[@id="loginFrm_password"]
    Page Should Contain Element    //*[@id="loginFrm"]/fieldset/button
    Input Text    //*[@id="loginFrm_loginname"]    chinhchinh2003
    Input Password    //*[@id="loginFrm_password"]    Trinh@2003
    Click Element   ${Login} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/account
    Mouse Over    xpath=//div[@class="footer_block"]//a[@title="Linkedin"]
    Execute JavaScript    document.querySelector('div.footer_block a[title="Linkedin"]').click();
    Title Should Be    LinkedIn: Log In or Sign Up
    Location Should Be    https://uk.linkedin.com/
    Close Browser

TC14: LK MXH Chrome X màn hình tự do in
    Open Browser    ${URL}    Chrome
    Select From List By Value    //*[@id="topnav"]/select    https://automationteststore.com/index.php?rt=account/login
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Page Should Contain Element    //*[@id="loginFrm_loginname"]
    Page Should Contain Element    //*[@id="loginFrm_password"]
    Page Should Contain Element    //*[@id="loginFrm"]/fieldset/button
    Input Text    //*[@id="loginFrm_loginname"]    chinhchinh2003
    Input Password    //*[@id="loginFrm_password"]    Trinh@2003
    Click Element   ${Login} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/account
    Mouse Over    xpath=//div[@class="footer_block"]//a[@title="Linkedin"]
    Execute JavaScript    document.querySelector('div.footer_block a[title="Linkedin"]').click();
    sleep    2s
    Location Should Be    https://uk.linkedin.com/
    Close Browser
TC15: LK MXH Chrome Set Window Size 800 600 in 
    Open Browser    ${URL}    Chrome
    Click Element    //*[@id="customer_menu_top"]/li/a
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Page Should Contain Element    //*[@id="loginFrm_loginname"]
    Page Should Contain Element    //*[@id="loginFrm_password"]
    Page Should Contain Element    //*[@id="loginFrm"]/fieldset/button
    Input Text    //*[@id="loginFrm_loginname"]    chinhchinh2003
    Input Password    //*[@id="loginFrm_password"]    Trinh@2003
    Click Element   ${Login} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/account
    Mouse Over    xpath=//div[@class="footer_block"]//a[@title="Linkedin"]
    Execute JavaScript    document.querySelector('div.footer_block a[title="Linkedin"]').click();
    sleep    2s
    Title Should Be    LinkedIn: Log In or Sign Up
    Location Should Be    https://uk.linkedin.com/
    Close Browser