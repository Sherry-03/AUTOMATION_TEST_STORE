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
#Login từLogin or register
TC1: Đăng nhập với cả 2 điều trống
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Click Element   ${Login_or_register} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Page Should Contain Element    //*[@id="loginFrm_loginname"]
    Page Should Contain Element    //*[@id="loginFrm_password"]
    Page Should Contain Element    //*[@id="loginFrm"]/fieldset/button
    Click Element   ${Login} 
    ${err_account}    Get Text    //*[@id="maincontainer"]/div/div/div/div[1]
    Should Contain    ${err_account}    Incorrect login or password provided.
    Close Browser
TC2: Đăng nhập sai cả hai 
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Click Element   ${Login_or_register} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Page Should Contain Element    //*[@id="loginFrm_loginname"]
    Page Should Contain Element    //*[@id="loginFrm_password"]
    Page Should Contain Element    //*[@id="loginFrm"]/fieldset/button
    Input Text    //*[@id="loginFrm_loginname"]    Trinh
    Input Password    //*[@id="loginFrm_password"]    Trinh2003
    Click Element   ${Login} 
    ${err_account}    Get Text    //*[@id="maincontainer"]/div/div/div/div[1]
    Should Contain    ${err_account}    Incorrect login or password provided.
    Close Browser

TC3: Đặng nhập đúng tên và trống mật khẩu
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Click Element   ${Login_or_register} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Page Should Contain Element    //*[@id="loginFrm_loginname"]
    Page Should Contain Element    //*[@id="loginFrm_password"]
    Page Should Contain Element    //*[@id="loginFrm"]/fieldset/button
    Input Text    //*[@id="loginFrm_loginname"]    ttrinhtrinhhuynh18
    Input Password    //*[@id="loginFrm_password"]    ${EMPTY}
    Click Element   ${Login} 
    ${err_account}    Get Text    //*[@id="maincontainer"]/div/div/div/div[1]
    Should Contain    ${err_account}    Incorrect login or password provided.
    Close Browser
TC4: Bỏ trống Login name
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Click Element   ${Login_or_register} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Page Should Contain Element    //*[@id="loginFrm_loginname"]
    Page Should Contain Element    //*[@id="loginFrm_password"]
    Page Should Contain Element    //*[@id="loginFrm"]/fieldset/button
    Input Text    //*[@id="loginFrm_loginname"]    ${EMPTY}
    Input Password    //*[@id="loginFrm_password"]    Trinh@2003
    Click Element   ${Login} 
    ${err_account}    Get Text    //*[@id="maincontainer"]/div/div/div/div[1]
    Should Contain    ${err_account}    Incorrect login or password provided.
    Close Browser
TC5: Đúng mật khẩu sai tên
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Click Element   ${Login_or_register} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Page Should Contain Element    //*[@id="loginFrm_loginname"]
    Page Should Contain Element    //*[@id="loginFrm_password"]
    Page Should Contain Element    //*[@id="loginFrm"]/fieldset/button
    Input Text    //*[@id="loginFrm_loginname"]    hehe1234
    Input Password    //*[@id="loginFrm_password"]    Trinh@2003
    Click Element   ${Login} 
    ${err_account}    Get Text    //*[@id="maincontainer"]/div/div/div/div[1]
    Should Contain    ${err_account}    Incorrect login or password provided.
    Close Browser
TC6: Đúng tên sai mật khẩu
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Click Element   ${Login_or_register} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Page Should Contain Element    //*[@id="loginFrm_loginname"]
    Page Should Contain Element    //*[@id="loginFrm_password"]
    Page Should Contain Element    //*[@id="loginFrm"]/fieldset/button
    Input Text    //*[@id="loginFrm_loginname"]    ttrinhtrinhhuynh18
    Input Password    //*[@id="loginFrm_password"]    heheheh@2003
    Click Element   ${Login} 
    ${err_account}    Get Text    //*[@id="maincontainer"]/div/div/div/div[1]
    Should Contain    ${err_account}    Incorrect login or password provided.
    Close Browser
TC7: Đúng tên sai mật khẩu
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Click Element   ${Login_or_register} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Page Should Contain Element    //*[@id="loginFrm_loginname"]
    Page Should Contain Element    //*[@id="loginFrm_password"]
    Page Should Contain Element    //*[@id="loginFrm"]/fieldset/button
    Input Text    //*[@id="loginFrm_loginname"]    ttrinhtrinhhuynh18
    Input Password    //*[@id="loginFrm_password"]    heheheh@2003
    Click Element   ${Login} 
    ${err_account}    Get Text    //*[@id="maincontainer"]/div/div/div/div[1]
    Should Contain    ${err_account}    Incorrect login or password provided.
    Close Browser
TC8: Đúng tên đúng mật khẩu
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Click Element   ${Login_or_register} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Page Should Contain Element    //*[@id="loginFrm_loginname"]
    Page Should Contain Element    //*[@id="loginFrm_password"]
    Page Should Contain Element    //*[@id="loginFrm"]/fieldset/button
    Input Text    //*[@id="loginFrm_loginname"]    ttrinhtrinhhuynh18
    Input Password    //*[@id="loginFrm_password"]    Trinh@2003
    Click Element   ${Login} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/account
    Close Browser
TC9: Đúng tên đúng mật khẩu
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
    Close Browser
TC10: Đúng tên đúng mật khẩu
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Click Element   ${Login_or_register} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Page Should Contain Element    //*[@id="loginFrm_loginname"]
    Page Should Contain Element    //*[@id="loginFrm_password"]
    Page Should Contain Element    //*[@id="loginFrm"]/fieldset/button
    Input Text    //*[@id="loginFrm_loginname"]    ttrinhtrinhhuynh9
    Input Password    //*[@id="loginFrm_password"]    Trinh@2003
    Click Element   ${Login} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/account
    Close Browser
TC11: Đúng tên đúng mật khẩu
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Click Element   ${Login_or_register} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Page Should Contain Element    //*[@id="loginFrm_loginname"]
    Page Should Contain Element    //*[@id="loginFrm_password"]
    Page Should Contain Element    //*[@id="loginFrm"]/fieldset/button
    Input Text    //*[@id="loginFrm_loginname"]    ttrinhtrinhhuynh8
    Input Password    //*[@id="loginFrm_password"]    Trinh@2003
    Click Element   ${Login} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/account
    Close Browser
TC12: Đúng tên đúng mật khẩu trên trình duyệt Edge và kích thước màn hình rự do
    Open Browser    ${URL}    edge
    Click Element   ${Login_or_register} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Page Should Contain Element    //*[@id="loginFrm_loginname"]
    Page Should Contain Element    //*[@id="loginFrm_password"]
    Page Should Contain Element    //*[@id="loginFrm"]/fieldset/button
    Input Text    //*[@id="loginFrm_loginname"]    ttrinhtrinhhuynh19
    Input Password    //*[@id="loginFrm_password"]    Trinh@2003
    Click Element   ${Login} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/account
    Close Browser
TC13: Đúng tên đúng mật khẩu trên trình duyệt Edge và kích thước màn hình rự do
    Open Browser    ${URL}    firefox
    Click Element   ${Login_or_register} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Page Should Contain Element    //*[@id="loginFrm_loginname"]
    Page Should Contain Element    //*[@id="loginFrm_password"]
    Page Should Contain Element    //*[@id="loginFrm"]/fieldset/button
    Input Text    //*[@id="loginFrm_loginname"]    ttrinhtrinhhuynh2
    Input Password    //*[@id="loginFrm_password"]    Trinh@2003
    Click Element   ${Login} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/account
    Close Browser
TC14: Quên mk và bỏ trống cả hai
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Click Element   ${Login_or_register} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Page Should Contain Element    //*[@id="loginFrm_loginname"]
    Page Should Contain Element    //*[@id="loginFrm_password"]
    Page Should Contain Element    //*[@id="loginFrm"]/fieldset/button
    Click Element    //*[@id="loginFrm"]/fieldset/a[1]
    Click Element    //*[@id="forgottenFrm"]/div[2]/div/button
    ${err_psw_login}    Get Text    //*[@id="maincontainer"]/div/div/div/div[1]
    Should Contain    ${err_psw_login}    The Email address was not provided or not found in our records, please try again!
    Close Browser
TC15: Nhập dữ liệu nhưng cả hai điều sai
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Click Element   ${Login_or_register} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Page Should Contain Element    //*[@id="loginFrm_loginname"]
    Page Should Contain Element    //*[@id="loginFrm_password"]
    Page Should Contain Element    //*[@id="loginFrm"]/fieldset/button
    Click Element    //*[@id="loginFrm"]/fieldset/a[1]
    Input Text    //*[@id="forgottenFrm_loginname"]    ttrinhtrinhhu
    Input Text    //*[@id="forgottenFrm_email"]    ttrinhtrinhhuynh19
    Click Element    //*[@id="forgottenFrm"]/div[2]/div/button
    ${err_psw_login}    Get Text    //*[@id="maincontainer"]/div/div/div/div[1]
    Should Contain    ${err_psw_login}    No records found matching information your provided, please check your information and try again!
    Close Browser
TC16: Nhập dữ liệu khi quên mật khẩu
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Click Element   ${Login_or_register} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Page Should Contain Element    //*[@id="loginFrm_loginname"]
    Page Should Contain Element    //*[@id="loginFrm_password"]
    Page Should Contain Element    //*[@id="loginFrm"]/fieldset/button
    Click Element    //*[@id="loginFrm"]/fieldset/a[1]
    Location Should Be    https://automationteststore.com/index.php?rt=account/forgotten/password
    Input Text    //*[@id="forgottenFrm_loginname"]    chinhchinh2003
    Input Text    //*[@id="forgottenFrm_email"]    mongtrinhhuynh313@gmail.com
    Click Element    //*[@id="forgottenFrm"]/div[2]/div/button
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    ${sucess_psw_login}    Get Text    //*[@id="maincontainer"]/div/div/div/div[1]
    Should Contain    ${sucess_psw_login}    Password reset link has been sent to your e-mail address.
    Input Text    //*[@id="loginFrm_loginname"]    chinhchinh2003
    Input Text    //*[@id="loginFrm_password"]    Trinh@2003
    Click Element    //*[@id="loginFrm"]/fieldset/button
    Location Should Be    https://automationteststore.com/index.php?rt=account/account
    Close Browser
TC17: Quên tên đăng nhập và bỏ trống cả hai
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Click Element   ${Login_or_register} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Page Should Contain Element    //*[@id="loginFrm_loginname"]
    Page Should Contain Element    //*[@id="loginFrm_password"]
    Page Should Contain Element    //*[@id="loginFrm"]/fieldset/button
    Click Element    //*[@id="loginFrm"]/fieldset/a[2]
    Click Element    //*[@id="forgottenFrm"]/div[2]/div/button
    ${err_login}    Get Text    //*[@id="maincontainer"]/div/div/div/div[1]
    Should Contain    ${err_login}    The Email address was not provided or not found in our records, please try again!
    Close Browser
TC18:Quên tên đăng nhập nhập dữ liệu nhưng cả hai điều sai
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Click Element   ${Login_or_register} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Page Should Contain Element    //*[@id="loginFrm_loginname"]
    Page Should Contain Element    //*[@id="loginFrm_password"]
    Page Should Contain Element    //*[@id="loginFrm"]/fieldset/button
    Click Element    //*[@id="loginFrm"]/fieldset/a[2]
    Input Text    //*[@id="forgottenFrm_lastname"]    ttrinhtrinhhu
    Input Text    //*[@id="forgottenFrm_email"]    ttrinhtrinhhuynh19
    Click Element    //*[@id="forgottenFrm"]/div[2]/div/button
    ${err_psw}    Get Text    //*[@id="maincontainer"]/div/div/div/div[1]
    Should Contain    ${err_psw}    No records found matching information your provided, please check your information and try again!
    Close Browser
TC19: Quên tên đăng nhập nhập dữ liệu
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Click Element   ${Login_or_register} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Page Should Contain Element    //*[@id="loginFrm_loginname"]
    Page Should Contain Element    //*[@id="loginFrm_password"]
    Page Should Contain Element    //*[@id="loginFrm"]/fieldset/button
    Click Element    //*[@id="loginFrm"]/fieldset/a[2]
    Location Should Be    https://automationteststore.com/index.php?rt=account/forgotten/loginname
    Input Text    //*[@id="forgottenFrm_lastname"]    Huynh
    Input Text    //*[@id="forgottenFrm_email"]    mongtrinhhuynh313@gmail.com
    Click Element    //*[@id="forgottenFrm"]/div[2]/div/button
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    ${sucess_login}    Get Text    //*[@id="maincontainer"]/div/div/div/div[1]
    Should Contain    ${sucess_login}    Your login name reminder has been sent to your e-mail address.
    Input Text    //*[@id="loginFrm_loginname"]    chinhchinh2003
    Input Text    //*[@id="loginFrm_password"]    Trinh@2003
    Click Element    //*[@id="loginFrm"]/fieldset/button
    Location Should Be    https://automationteststore.com/index.php?rt=account/account
    Close Browser
#Login từ Account 
TC20: Đăng nhập với cả 2 điều trống
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Mouse Over    //*[@id="main_menu_top"]/li[2]/a
    Click Element   //*[@id="main_menu_top"]/li[2]/ul/li[1]/a
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Page Should Contain Element    //*[@id="loginFrm_loginname"]
    Page Should Contain Element    //*[@id="loginFrm_password"]
    Page Should Contain Element    //*[@id="loginFrm"]/fieldset/button
    Click Element   ${Login} 
    ${err_account}    Get Text    //*[@id="maincontainer"]/div/div/div/div[1]
    Should Contain    ${err_account}    Incorrect login or password provided.
    Close Browser
TC21: Đăng nhập sai cả hai 
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Mouse Over    //*[@id="main_menu_top"]/li[2]/a
    Click Element   //*[@id="main_menu_top"]/li[2]/ul/li[1]/a
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Page Should Contain Element    //*[@id="loginFrm_loginname"]
    Page Should Contain Element    //*[@id="loginFrm_password"]
    Page Should Contain Element    //*[@id="loginFrm"]/fieldset/button
    Input Text    //*[@id="loginFrm_loginname"]    Trinh
    Input Password    //*[@id="loginFrm_password"]    Trinh2003
    Click Element   ${Login} 
    ${err_account}    Get Text    //*[@id="maincontainer"]/div/div/div/div[1]
    Should Contain    ${err_account}    Incorrect login or password provided.
    Close Browser

TC22: Đặng nhập đúng tên và trống mật khẩu
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Mouse Over    //*[@id="main_menu_top"]/li[2]/a
    Click Element   //*[@id="main_menu_top"]/li[2]/ul/li[1]/a
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Page Should Contain Element    //*[@id="loginFrm_loginname"]
    Page Should Contain Element    //*[@id="loginFrm_password"]
    Page Should Contain Element    //*[@id="loginFrm"]/fieldset/button
    Input Text    //*[@id="loginFrm_loginname"]    ttrinhtrinhhuynh18
    Input Password    //*[@id="loginFrm_password"]    ${EMPTY}
    Click Element   ${Login} 
    ${err_account}    Get Text    //*[@id="maincontainer"]/div/div/div/div[1]
    Should Contain    ${err_account}    Incorrect login or password provided.
    Close Browser
TC23: Bỏ trống Login name
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Mouse Over    //*[@id="main_menu_top"]/li[2]/a
    Click Element   //*[@id="main_menu_top"]/li[2]/ul/li[1]/a
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Page Should Contain Element    //*[@id="loginFrm_loginname"]
    Page Should Contain Element    //*[@id="loginFrm_password"]
    Page Should Contain Element    //*[@id="loginFrm"]/fieldset/button
    Input Text    //*[@id="loginFrm_loginname"]    ${EMPTY}
    Input Password    //*[@id="loginFrm_password"]    Trinh@2003
    Click Element   ${Login} 
    ${err_account}    Get Text    //*[@id="maincontainer"]/div/div/div/div[1]
    Should Contain    ${err_account}    Incorrect login or password provided.
    Close Browser
TC24: Đúng mật khẩu sai tên
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Mouse Over    //*[@id="main_menu_top"]/li[2]/a
    Click Element   //*[@id="main_menu_top"]/li[2]/ul/li[1]/a
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Page Should Contain Element    //*[@id="loginFrm_loginname"]
    Page Should Contain Element    //*[@id="loginFrm_password"]
    Page Should Contain Element    //*[@id="loginFrm"]/fieldset/button
    Input Text    //*[@id="loginFrm_loginname"]    hehe1234
    Input Password    //*[@id="loginFrm_password"]    Trinh@2003
    Click Element   ${Login} 
    ${err_account}    Get Text    //*[@id="maincontainer"]/div/div/div/div[1]
    Should Contain    ${err_account}    Incorrect login or password provided.
    Close Browser
TC25: Đúng tên sai mật khẩu
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Mouse Over    //*[@id="main_menu_top"]/li[2]/a
    Click Element   //*[@id="main_menu_top"]/li[2]/ul/li[1]/a
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Page Should Contain Element    //*[@id="loginFrm_loginname"]
    Page Should Contain Element    //*[@id="loginFrm_password"]
    Page Should Contain Element    //*[@id="loginFrm"]/fieldset/button
    Input Text    //*[@id="loginFrm_loginname"]    ttrinhtrinhhuynh18
    Input Password    //*[@id="loginFrm_password"]    heheheh@2003
    Click Element   ${Login} 
    ${err_account}    Get Text    //*[@id="maincontainer"]/div/div/div/div[1]
    Should Contain    ${err_account}    Incorrect login or password provided.
    Close Browser
TC26: Đúng tên sai mật khẩu
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Mouse Over    //*[@id="main_menu_top"]/li[2]/a
    Click Element   //*[@id="main_menu_top"]/li[2]/ul/li[1]/a
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Page Should Contain Element    //*[@id="loginFrm_loginname"]
    Page Should Contain Element    //*[@id="loginFrm_password"]
    Page Should Contain Element    //*[@id="loginFrm"]/fieldset/button
    Input Text    //*[@id="loginFrm_loginname"]    ttrinhtrinhhuynh18
    Input Password    //*[@id="loginFrm_password"]    heheheh@2003
    Click Element   ${Login} 
    ${err_account}    Get Text    //*[@id="maincontainer"]/div/div/div/div[1]
    Should Contain    ${err_account}    Incorrect login or password provided.
    Close Browser
TC27: Đúng tên đúng mật khẩu
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Mouse Over    //*[@id="main_menu_top"]/li[2]/a
    Click Element   //*[@id="main_menu_top"]/li[2]/ul/li[1]/a
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Page Should Contain Element    //*[@id="loginFrm_loginname"]
    Page Should Contain Element    //*[@id="loginFrm_password"]
    Page Should Contain Element    //*[@id="loginFrm"]/fieldset/button
    Input Text    //*[@id="loginFrm_loginname"]    ttrinhtrinhhuynh18
    Input Password    //*[@id="loginFrm_password"]    Trinh@2003
    Click Element   ${Login} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/account
    Close Browser
TC28: Đúng tên đúng mật khẩu
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Mouse Over    //*[@id="main_menu_top"]/li[2]/a
    Click Element   //*[@id="main_menu_top"]/li[2]/ul/li[1]/a
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Page Should Contain Element    //*[@id="loginFrm_loginname"]
    Page Should Contain Element    //*[@id="loginFrm_password"]
    Page Should Contain Element    //*[@id="loginFrm"]/fieldset/button
    Input Text    //*[@id="loginFrm_loginname"]    ttrinhtrinhhuynh16
    Input Password    //*[@id="loginFrm_password"]    Trinh@2003
    Click Element   ${Login} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/account
    Close Browser
TC29: Đúng tên đúng mật khẩu
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Mouse Over    //*[@id="main_menu_top"]/li[2]/a
    Click Element   //*[@id="main_menu_top"]/li[2]/ul/li[1]/a
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Page Should Contain Element    //*[@id="loginFrm_loginname"]
    Page Should Contain Element    //*[@id="loginFrm_password"]
    Page Should Contain Element    //*[@id="loginFrm"]/fieldset/button
    Input Text    //*[@id="loginFrm_loginname"]    ttrinhtrinhhuynh9
    Input Password    //*[@id="loginFrm_password"]    Trinh@2003
    Click Element   ${Login} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/account
    Close Browser
TC30: Đúng tên đúng mật khẩu
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Mouse Over    //*[@id="main_menu_top"]/li[2]/a
    Click Element   //*[@id="main_menu_top"]/li[2]/ul/li[1]/a
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Page Should Contain Element    //*[@id="loginFrm_loginname"]
    Page Should Contain Element    //*[@id="loginFrm_password"]
    Page Should Contain Element    //*[@id="loginFrm"]/fieldset/button
    Input Text    //*[@id="loginFrm_loginname"]    ttrinhtrinhhuynh8
    Input Password    //*[@id="loginFrm_password"]    Trinh@2003
    Click Element   ${Login} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/account
    Close Browser
TC31: Đúng tên đúng mật khẩu trên trình duyệt Edge và kích thước màn hình rự do
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
    Close Browser
TC32: Đúng tên đúng mật khẩu trên trình duyệt Edge và kích thước màn hình rự do
    Open Browser    ${URL}    firefox
    Maximize Browser Window
    Mouse Over    //*[@id="main_menu_top"]/li[2]/a
    Click Element   //*[@id="main_menu_top"]/li[2]/ul/li[1]/a
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Page Should Contain Element    //*[@id="loginFrm_loginname"]
    Page Should Contain Element    //*[@id="loginFrm_password"]
    Page Should Contain Element    //*[@id="loginFrm"]/fieldset/button
    Input Text    //*[@id="loginFrm_loginname"]    ttrinhtrinhhuynh2
    Input Password    //*[@id="loginFrm_password"]    Trinh@2003
    Click Element   ${Login} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/account
    Close Browser
TC33: Quên mk và bỏ trống cả hai
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Mouse Over    //*[@id="main_menu_top"]/li[2]/a
    Click Element   //*[@id="main_menu_top"]/li[2]/ul/li[1]/a
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Page Should Contain Element    //*[@id="loginFrm_loginname"]
    Page Should Contain Element    //*[@id="loginFrm_password"]
    Page Should Contain Element    //*[@id="loginFrm"]/fieldset/button
    Click Element    //*[@id="loginFrm"]/fieldset/a[1]
    Click Element    //*[@id="forgottenFrm"]/div[2]/div/button
    ${err_psw_login}    Get Text    //*[@id="maincontainer"]/div/div/div/div[1]
    Should Contain    ${err_psw_login}    The Email address was not provided or not found in our records, please try again!
    Close Browser
TC34: Nhập dữ liệu nhưng cả hai điều sai
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Mouse Over    //*[@id="main_menu_top"]/li[2]/a
    Click Element   //*[@id="main_menu_top"]/li[2]/ul/li[1]/a
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Page Should Contain Element    //*[@id="loginFrm_loginname"]
    Page Should Contain Element    //*[@id="loginFrm_password"]
    Page Should Contain Element    //*[@id="loginFrm"]/fieldset/button
    Click Element    //*[@id="loginFrm"]/fieldset/a[1]
    Input Text    //*[@id="forgottenFrm_loginname"]    ttrinhtrinhhu
    Input Text    //*[@id="forgottenFrm_email"]    ttrinhtrinhhuynh19
    Click Element    //*[@id="forgottenFrm"]/div[2]/div/button
    ${err_psw_login}    Get Text    //*[@id="maincontainer"]/div/div/div/div[1]
    Should Contain    ${err_psw_login}    No records found matching information your provided, please check your information and try again!
    Close Browser
TC35: Nhập dữ liệu khi quên mật khẩu
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Mouse Over    //*[@id="main_menu_top"]/li[2]/a
    Click Element   //*[@id="main_menu_top"]/li[2]/ul/li[1]/a
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Page Should Contain Element    //*[@id="loginFrm_loginname"]
    Page Should Contain Element    //*[@id="loginFrm_password"]
    Page Should Contain Element    //*[@id="loginFrm"]/fieldset/button
    Click Element    //*[@id="loginFrm"]/fieldset/a[1]
    Location Should Be    https://automationteststore.com/index.php?rt=account/forgotten/password
    Input Text    //*[@id="forgottenFrm_loginname"]    chinhchinh2003
    Input Text    //*[@id="forgottenFrm_email"]    mongtrinhhuynh313@gmail.com
    Click Element    //*[@id="forgottenFrm"]/div[2]/div/button
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    ${sucess_psw_login}    Get Text    //*[@id="maincontainer"]/div/div/div/div[1]
    Should Contain    ${sucess_psw_login}    Password reset link has been sent to your e-mail address.
    Input Text    //*[@id="loginFrm_loginname"]    chinhchinh2003
    Input Text    //*[@id="loginFrm_password"]    Trinh@2003
    Click Element    //*[@id="loginFrm"]/fieldset/button
    Location Should Be    https://automationteststore.com/index.php?rt=account/account
    Close Browser
TC36: Quên tên đăng nhập và bỏ trống cả hai
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Mouse Over    //*[@id="main_menu_top"]/li[2]/a
    Click Element   //*[@id="main_menu_top"]/li[2]/ul/li[1]/a
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Page Should Contain Element    //*[@id="loginFrm_loginname"]
    Page Should Contain Element    //*[@id="loginFrm_password"]
    Page Should Contain Element    //*[@id="loginFrm"]/fieldset/button
    Click Element    //*[@id="loginFrm"]/fieldset/a[2]
    Click Element    //*[@id="forgottenFrm"]/div[2]/div/button
    ${err_login}    Get Text    //*[@id="maincontainer"]/div/div/div/div[1]
    Should Contain    ${err_login}    The Email address was not provided or not found in our records, please try again!
    Close Browser
TC37:Quên tên đăng nhập nhập dữ liệu nhưng cả hai điều sai
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Mouse Over    //*[@id="main_menu_top"]/li[2]/a
    Click Element   //*[@id="main_menu_top"]/li[2]/ul/li[1]/a
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Page Should Contain Element    //*[@id="loginFrm_loginname"]
    Page Should Contain Element    //*[@id="loginFrm_password"]
    Page Should Contain Element    //*[@id="loginFrm"]/fieldset/button
    Click Element    //*[@id="loginFrm"]/fieldset/a[2]
    Input Text    //*[@id="forgottenFrm_lastname"]    ttrinhtrinhhu
    Input Text    //*[@id="forgottenFrm_email"]    ttrinhtrinhhuynh19
    Click Element    //*[@id="forgottenFrm"]/div[2]/div/button
    ${err_psw}    Get Text    //*[@id="maincontainer"]/div/div/div/div[1]
    Should Contain    ${err_psw}    No records found matching information your provided, please check your information and try again!
    Close Browser
TC38: Quên tên đăng nhập nhập dữ liệu
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Mouse Over    //*[@id="main_menu_top"]/li[2]/a
    Click Element   //*[@id="main_menu_top"]/li[2]/ul/li[1]/a
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Page Should Contain Element    //*[@id="loginFrm_loginname"]
    Page Should Contain Element    //*[@id="loginFrm_password"]
    Page Should Contain Element    //*[@id="loginFrm"]/fieldset/button
    Click Element    //*[@id="loginFrm"]/fieldset/a[2]
    Location Should Be    https://automationteststore.com/index.php?rt=account/forgotten/loginname
    Input Text    //*[@id="forgottenFrm_lastname"]    Huynh
    Input Text    //*[@id="forgottenFrm_email"]    mongtrinhhuynh313@gmail.com
    Click Element    //*[@id="forgottenFrm"]/div[2]/div/button
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    ${sucess_login}    Get Text    //*[@id="maincontainer"]/div/div/div/div[1]
    Should Contain    ${sucess_login}    Your login name reminder has been sent to your e-mail address.
    Input Text    //*[@id="loginFrm_loginname"]    chinhchinh2003
    Input Text    //*[@id="loginFrm_password"]    Trinh@2003
    Click Element    //*[@id="loginFrm"]/fieldset/button
    Location Should Be    https://automationteststore.com/index.php?rt=account/account
    Close Browser