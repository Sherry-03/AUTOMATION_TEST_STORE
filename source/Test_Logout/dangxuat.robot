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
TC1: Đăng xuất Chrome Maximize Browser Window
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
    Mouse Over    //*[@id="main_menu_top"]/li[2]/a
    sleep    2s
    Click Element   //*[@id="main_menu_top"]/li[2]/ul/li[2]/a
    Location Should Be    https://automationteststore.com/index.php?rt=account/logout
    Close Browser
TC2: Đăng xuất Chrome màn hình tự do
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
    Select From List By Value    //*[@id="topnav"]/select    https://automationteststore.com/index.php?rt=account/logout
    Location Should Be    https://automationteststore.com/index.php?rt=account/logout
    Close Browser
TC3: Đăng xuất Chrome 800 600
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
    Select From List By Value    //*[@id="topnav"]/select    https://automationteststore.com/index.php?rt=account/logout
    Location Should Be    https://automationteststore.com/index.php?rt=account/logout
    Close Browser
TC4: Đăng xuất Chrome Maximize Browser Window
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
    Mouse Over    //*[@id="main_menu_top"]/li[2]/a
    sleep    2s
    Click Element   //*[@id="main_menu_top"]/li[2]/ul/li[2]/a
    Location Should Be    https://automationteststore.com/index.php?rt=account/logout
    Close Browser
TC5: Đăng xuất Chrome man hinh tu do 
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
    Select From List By Value    //*[@id="topnav"]/select    https://automationteststore.com/index.php?rt=account/logout
    Location Should Be    https://automationteststore.com/index.php?rt=account/logout
    Close Browser
TC6: Đăng xuất Chrome 800 600
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
    Select From List By Value    //*[@id="topnav"]/select    https://automationteststore.com/index.php?rt=account/logout
    Location Should Be    https://automationteststore.com/index.php?rt=account/logout
    Close Browser
TC7: Đăng xuất edge Maximize Browser Window 
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
    Mouse Over    //*[@id="main_menu_top"]/li[2]/a
    sleep    2s
    Click Element   //*[@id="main_menu_top"]/li[2]/ul/li[2]/a
    Location Should Be    https://automationteststore.com/index.php?rt=account/logout
    Close Browser
TC8: Đăng xuất edge màn hình tự do 
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
    Select From List By Value    //*[@id="topnav"]/select    https://automationteststore.com/index.php?rt=account/logout
    Location Should Be    https://automationteststore.com/index.php?rt=account/logout
    Close Browser

TC9: Đăng xuất firefox Maximize Browser Window
    Open Browser    ${URL}    firefox
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
    Mouse Over    //*[@id="main_menu_top"]/li[2]/a
    sleep    2s
    Click Element   //*[@id="main_menu_top"]/li[2]/ul/li[2]/a
    Location Should Be    https://automationteststore.com/index.php?rt=account/logout
    Close Browser
TC10: Đăng xuất firefox 800 600 
    Open Browser    ${URL}    firefox
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
    Select From List By Value    //*[@id="topnav"]/select    https://automationteststore.com/index.php?rt=account/logout
    Location Should Be    https://automationteststore.com/index.php?rt=account/logout
    Close Browser