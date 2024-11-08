*** Settings ***
Library           SeleniumLibrary
Library           OperatingSystem
Library           String
Library           BuiltIn
Library           Collections
*** Variables ***
${URL}    https://automationteststore.com/
${Login_or_register}    //*[@id="customer_menu_top"]/li
${Continue}    //*[@id="accountFrm"]/fieldset/button
*** Tasks ***
TC1: Trống hết
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Click Element   ${Login_or_register} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Click Element   ${Continue}  
    Location Should Be    https://automationteststore.com/index.php?rt=account/create
     #Kiểm tra trường dữ liệu
    Page Should Contain Element    //*[@id="AccountFrm_firstname"]
    Page Should Contain Element    //*[@id="AccountFrm_lastname"]
    Page Should Contain Element    //*[@id="AccountFrm_email"]
    Page Should Contain Element    //*[@id="AccountFrm_fax"]
    Page Should Contain Element    //*[@id="AccountFrm_company"]
    Page Should Contain Element    //*[@id="AccountFrm_address_1"]
    Page Should Contain Element    //*[@id="AccountFrm_address_2"]
    Page Should Contain Element    //*[@id="AccountFrm_city"]
    Page Should Contain Element    //*[@id="AccountFrm_country_id"]
    Page Should Contain Element    //*[@id="AccountFrm_zone_id"]
    Page Should Contain Element    //*[@id="AccountFrm_postcode"]
    Page Should Contain Element    //*[@id="AccountFrm_loginname"]
    Page Should Contain Element    //*[@id="AccountFrm_password"]
    Page Should Contain Element    //*[@id="AccountFrm_confirm"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter1"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter0"]
    Page Should Contain Element    //*[@id="AccountFrm_agree"]
    Page Should Contain Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    Click Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    2s
    #get text Error empty
    ${err_account}    Get Text    xpath=//div[@class="alert alert-error alert-danger"]
    ${First_Name}    Get Text    //*[@id="AccountFrm"]/div[1]/fieldset/div[1]/span
    ${Last_Name}    Get Text    //*[@id="AccountFrm"]/div[1]/fieldset/div[2]/span
    ${E_Mail}    Get Text    //*[@id="AccountFrm"]/div[1]/fieldset/div[3]/span
    ${Address_1}    Get Text    //*[@id="AccountFrm"]/div[2]/fieldset/div[2]/span
    ${City}    Get Text    //*[@id="AccountFrm"]/div[2]/fieldset/div[4]/span
    ${Region_tate}    Get Text    //*[@id="AccountFrm"]/div[2]/fieldset/div[5]/span
    ${ZIP_Code}    Get Text    //*[@id="AccountFrm"]/div[2]/fieldset/div[6]/span
    ${Login_name}    Get Text    //*[@id="AccountFrm"]/div[3]/fieldset/div[1]/span
    ${Password}    Get Text    //*[@id="AccountFrm"]/div[3]/fieldset/div[2]/span
   
    Should Contain    ${err_account}    You must agree to the Privacy Policy!
    Should Be Equal    ${First_Name}    First Name must be between 1 and 32 characters!
    Should Be Equal    ${Last_Name}    Last Name must be between 1 and 32 characters!
    Should Be Equal    ${E_Mail}    Email Address does not appear to be valid!
    Should Be Equal    ${Address_1}    Address 1 must be between 3 and 128 characters!
    Should Be Equal    ${City}    City must be between 3 and 128 characters!
    Should Be Equal    ${Region_tate}    Please select a region / state!
    Should Be Equal    ${ZIP_Code}    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal    ${Login_name}    Login name must be alphanumeric only and between 5 and 64 characters!
    Should Be Equal    ${Password}    Password must be between 4 and 20 characters!
    Close Browser
TC2: Trống First Name
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Click Element   ${Login_or_register} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Click Element   ${Continue}  
    Location Should Be    https://automationteststore.com/index.php?rt=account/create
     #Kiểm tra trường dữ liệu
    Page Should Contain Element    //*[@id="AccountFrm_firstname"]
    Page Should Contain Element    //*[@id="AccountFrm_lastname"]
    Page Should Contain Element    //*[@id="AccountFrm_email"]
    Page Should Contain Element    //*[@id="AccountFrm_fax"]
    Page Should Contain Element    //*[@id="AccountFrm_company"]
    Page Should Contain Element    //*[@id="AccountFrm_address_1"]
    Page Should Contain Element    //*[@id="AccountFrm_address_2"]
    Page Should Contain Element    //*[@id="AccountFrm_city"]
    Page Should Contain Element    //*[@id="AccountFrm_country_id"]
    Page Should Contain Element    //*[@id="AccountFrm_zone_id"]
    Page Should Contain Element    //*[@id="AccountFrm_postcode"]
    Page Should Contain Element    //*[@id="AccountFrm_loginname"]
    Page Should Contain Element    //*[@id="AccountFrm_password"]
    Page Should Contain Element    //*[@id="AccountFrm_confirm"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter1"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter0"]
    Page Should Contain Element    //*[@id="AccountFrm_agree"]
    Page Should Contain Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    #Nhập dữ liệu
    Input Text    //*[@id="AccountFrm_firstname"]    ${EMPTY}
    Input Text    //*[@id="AccountFrm_lastname"]    Trinh
    Input Text    //*[@id="AccountFrm_email"]    trinhtrinhhuynh4huynh2003@gmail.com
    Input Text    //*[@id="AccountFrm_telephone"]    0344171672
    Input Text    //*[@id="AccountFrm_fax"]    + 84 (8) 24567889
    Input Text    //*[@id="AccountFrm_company"]    Baa Baby
    Input Text    //*[@id="AccountFrm_address_1"]    Ấp Tân Thông 4, Xã Thanh Tân, Huyện Mỏ Cày Bắc, Tỉnh Bến Tre
    Input Text    //*[@id="AccountFrm_address_2"]    Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh
    Input Text    //*[@id="AccountFrm_city"]    Hồ Chí Minh
    Select From List By Value    //*[@id="AccountFrm_country_id"]    230
    Sleep    2s
    Select From List By Value    //*[@id="AccountFrm_zone_id"]    3780
    Input Text    //*[@id="AccountFrm_postcode"]    70000
    Input Text    //*[@id="AccountFrm_loginname"]    trinhtrinhhuynh4
    Input Password    //*[@id="AccountFrm_password"]    Trinh@2003
    Input Password    //*[@id="AccountFrm_confirm"]    Trinh@2003
    Click Element    //*[@id="AccountFrm_newsletter1"]
    Click Element    //*[@id="AccountFrm_agree"]
    #Nhấn Đăng ký
    Click Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    2s
    #get text Error empty
    ${err_account}    Get Text    xpath=//div[@class="alert alert-error alert-danger"]
    ${First_Name}    Get Text    //*[@id="AccountFrm"]/div[1]/fieldset/div[1]/span
    
    Should Contain    ${err_account}    First Name must be between 1 and 32 characters!
    Should Be Equal    ${First_Name}    First Name must be between 1 and 32 characters!
    #Get text err field
    ${First_Name_field}    Get Value    //*[@id="AccountFrm_firstname"]
    ${Last_Name_field}    Get Value    //*[@id="AccountFrm_lastname"]
    ${E_Mail_field}    Get Value    //*[@id="AccountFrm_email"]
    ${Telephone_field}    Get Value    //*[@id="AccountFrm_telephone"]
    ${Fax_field}    Get Value    //*[@id="AccountFrm_fax"]
    ${Company_field}    Get Value    //*[@id="AccountFrm_company"]
    ${Address_1_field}    Get Value    //*[@id="AccountFrm_address_1"]
    ${Address_2_field}    Get Value    //*[@id="AccountFrm_address_2"]
    ${City_field}    Get Value    //*[@id="AccountFrm_city"]
    ${Region_tate_field}    Get Value    //*[@id="AccountFrm_zone_id"]
    ${ZIP_Code_field}    Get Value    //*[@id="AccountFrm_postcode"]
    ${Country_field}    Get Value    //*[@id="AccountFrm_country_id"]
    ${Login_name_field}    Get Value    //*[@id="AccountFrm_loginname"]
    Click Element    //*[@id="AccountFrm_newsletter1"]
    ${Password_field}    Get Value    //*[@id="AccountFrm_password"]
    Click Element    //*[@id="AccountFrm_agree"]
    ${Password_Confirm_field}    Get Value    //*[@id="AccountFrm_confirm"]
    #Kiểm tra các trường đã được điền chưa
    Should Be Equal    ${First_Name_field}    ${EMPTY}
    Should Be Equal As Strings    ${Last_Name_field}    Trinh
    Should Be Equal    ${E_Mail_field}    trinhtrinhhuynh4huynh2003@gmail.com
    Should Be Equal    ${Telephone_field}    0344171672
    Should Be Equal    ${Fax_field}    + 84 (8) 24567889
    Should Be Equal    ${Company_field}    Baa Baby
    Should Be Equal    ${Address_1_field}    Ấp Tân Thông 4, Xã Thanh Tân, Huyện Mỏ Cày Bắc, Tỉnh Bến Tre
    Should Be Equal    ${Address_2_field}    Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh
    Should Be Equal    ${City_field}    Hồ Chí Minh
    Should Be Equal    ${Region_tate_field}    3780
    Should Be Equal    ${ZIP_Code_field}    70000
    Should Be Equal    ${Country_field}    230
    Should Be Equal    ${Login_name_field}    trinhtrinhhuynh4
    Should Be Equal    ${Password_field}    ${EMPTY}
    Should Be Equal    ${Password_Confirm_field}    ${EMPTY}
    Close Browser
TC3: Trống Last Name
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Click Element   ${Login_or_register} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Click Element   ${Continue}  
    Location Should Be    https://automationteststore.com/index.php?rt=account/create
    #Kiểm tra trường dữ liệu
    Page Should Contain Element    //*[@id="AccountFrm_firstname"]
    Page Should Contain Element    //*[@id="AccountFrm_lastname"]
    Page Should Contain Element    //*[@id="AccountFrm_email"]
    Page Should Contain Element    //*[@id="AccountFrm_fax"]
    Page Should Contain Element    //*[@id="AccountFrm_company"]
    Page Should Contain Element    //*[@id="AccountFrm_address_1"]
    Page Should Contain Element    //*[@id="AccountFrm_address_2"]
    Page Should Contain Element    //*[@id="AccountFrm_city"]
    Page Should Contain Element    //*[@id="AccountFrm_country_id"]
    Page Should Contain Element    //*[@id="AccountFrm_zone_id"]
    Page Should Contain Element    //*[@id="AccountFrm_postcode"]
    Page Should Contain Element    //*[@id="AccountFrm_loginname"]
    Page Should Contain Element    //*[@id="AccountFrm_password"]
    Page Should Contain Element    //*[@id="AccountFrm_confirm"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter1"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter0"]
    Page Should Contain Element    //*[@id="AccountFrm_agree"]
    Page Should Contain Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    #Nhập dữ liệu
    Input Text    //*[@id="AccountFrm_firstname"]    Huynh
    Input Text    //*[@id="AccountFrm_lastname"]    ${EMPTY}
    Input Text    //*[@id="AccountFrm_email"]    trinhtrinhhuynh4huynh2003@gmail.com
    Input Text    //*[@id="AccountFrm_telephone"]    0344171672
    Input Text    //*[@id="AccountFrm_fax"]    + 84 (8) 24567889
    Input Text    //*[@id="AccountFrm_company"]    Baa Baby
    Input Text    //*[@id="AccountFrm_address_1"]    Ấp Tân Thông 4, Xã Thanh Tân, Huyện Mỏ Cày Bắc, Tỉnh Bến Tre
    Input Text    //*[@id="AccountFrm_address_2"]    Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh
    Input Text    //*[@id="AccountFrm_city"]    Hồ Chí Minh
    Select From List By Value    //*[@id="AccountFrm_country_id"]    230
    Sleep    2s
    Select From List By Value    //*[@id="AccountFrm_zone_id"]    3780
    Input Text    //*[@id="AccountFrm_postcode"]    70000
    Input Text    //*[@id="AccountFrm_loginname"]    trinhtrinhhuynh4
    Input Password    //*[@id="AccountFrm_password"]    Trinh@2003
    Input Password    //*[@id="AccountFrm_confirm"]    Trinh@2003
    Click Element    //*[@id="AccountFrm_newsletter1"]
    Click Element    //*[@id="AccountFrm_agree"]
    #Nhấn Đăng ký
    Click Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    2s
    #get text Error empty
    ${err_account}    Get Text    xpath=//div[@class="alert alert-error alert-danger"]
    ${Last_Name}    Get Text    //*[@id="AccountFrm"]/div[1]/fieldset/div[2]/span
    
    Should Contain    ${err_account}    Last Name must be between 1 and 32 characters!
    Should Be Equal    ${Last_Name}    Last Name must be between 1 and 32 characters!
    #Get text err field
    ${First_Name_field}    Get Value    //*[@id="AccountFrm_firstname"]
    ${Last_Name_field}    Get Value    //*[@id="AccountFrm_lastname"]
    ${E_Mail_field}    Get Value    //*[@id="AccountFrm_email"]
    ${Telephone_field}    Get Value    //*[@id="AccountFrm_telephone"]
    ${Fax_field}    Get Value    //*[@id="AccountFrm_fax"]
    ${Company_field}    Get Value    //*[@id="AccountFrm_company"]
    ${Address_1_field}    Get Value    //*[@id="AccountFrm_address_1"]
    ${Address_2_field}    Get Value    //*[@id="AccountFrm_address_2"]
    ${City_field}    Get Value    //*[@id="AccountFrm_city"]
    ${Region_tate_field}    Get Value    //*[@id="AccountFrm_zone_id"]
    ${ZIP_Code_field}    Get Value    //*[@id="AccountFrm_postcode"]
    ${Country_field}    Get Value    //*[@id="AccountFrm_country_id"]
    ${Login_name_field}    Get Value    //*[@id="AccountFrm_loginname"]
    Click Element    //*[@id="AccountFrm_newsletter1"]
    ${Password_field}    Get Value    //*[@id="AccountFrm_password"]
    Click Element    //*[@id="AccountFrm_agree"]
    ${Password_Confirm_field}    Get Value    //*[@id="AccountFrm_confirm"]
    #Kiểm tra các trường đã được điền chưa
    Should Be Equal    ${First_Name_field}    Huynh
    Should Be Equal As Strings    ${Last_Name_field}    ${EMPTY}
    Should Be Equal    ${E_Mail_field}    trinhtrinhhuynh4huynh2003@gmail.com
    Should Be Equal    ${Telephone_field}    0344171672
    Should Be Equal    ${Fax_field}    + 84 (8) 24567889
    Should Be Equal    ${Company_field}    Baa Baby
    Should Be Equal    ${Address_1_field}    Ấp Tân Thông 4, Xã Thanh Tân, Huyện Mỏ Cày Bắc, Tỉnh Bến Tre
    Should Be Equal    ${Address_2_field}    Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh
    Should Be Equal    ${City_field}    Hồ Chí Minh
    Should Be Equal    ${Region_tate_field}    3780
    Should Be Equal    ${ZIP_Code_field}    70000
    Should Be Equal    ${Country_field}    230
    Should Be Equal    ${Login_name_field}    trinhtrinhhuynh4
    Should Be Equal    ${Password_field}    ${EMPTY}
    Should Be Equal    ${Password_Confirm_field}    ${EMPTY}
    Close Browser
TC4: Trống E-Mail
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Click Element   ${Login_or_register} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Click Element   ${Continue}  
    Location Should Be    https://automationteststore.com/index.php?rt=account/create
     #Kiểm tra trường dữ liệu
    Page Should Contain Element    //*[@id="AccountFrm_firstname"]
    Page Should Contain Element    //*[@id="AccountFrm_lastname"]
    Page Should Contain Element    //*[@id="AccountFrm_email"]
    Page Should Contain Element    //*[@id="AccountFrm_fax"]
    Page Should Contain Element    //*[@id="AccountFrm_company"]
    Page Should Contain Element    //*[@id="AccountFrm_address_1"]
    Page Should Contain Element    //*[@id="AccountFrm_address_2"]
    Page Should Contain Element    //*[@id="AccountFrm_city"]
    Page Should Contain Element    //*[@id="AccountFrm_country_id"]
    Page Should Contain Element    //*[@id="AccountFrm_zone_id"]
    Page Should Contain Element    //*[@id="AccountFrm_postcode"]
    Page Should Contain Element    //*[@id="AccountFrm_loginname"]
    Page Should Contain Element    //*[@id="AccountFrm_password"]
    Page Should Contain Element    //*[@id="AccountFrm_confirm"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter1"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter0"]
    Page Should Contain Element    //*[@id="AccountFrm_agree"]
    Page Should Contain Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    #Nhập dữ liệu
    Input Text    //*[@id="AccountFrm_firstname"]    Huynh
    Input Text    //*[@id="AccountFrm_lastname"]    Trinh
    Input Text    //*[@id="AccountFrm_email"]    ${EMPTY}
    Input Text    //*[@id="AccountFrm_telephone"]    0344171672
    Input Text    //*[@id="AccountFrm_fax"]    + 84 (8) 24567889
    Input Text    //*[@id="AccountFrm_company"]    Baa Baby
    Input Text    //*[@id="AccountFrm_address_1"]    Ấp Tân Thông 4, Xã Thanh Tân, Huyện Mỏ Cày Bắc, Tỉnh Bến Tre
    Input Text    //*[@id="AccountFrm_address_2"]    Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh
    Input Text    //*[@id="AccountFrm_city"]    Hồ Chí Minh
    Select From List By Value    //*[@id="AccountFrm_country_id"]    230
    Sleep    2s
    Select From List By Value    //*[@id="AccountFrm_zone_id"]    3780
    Input Text    //*[@id="AccountFrm_postcode"]    70000
    Input Text    //*[@id="AccountFrm_loginname"]    trinhtrinhhuynh4
    Input Password    //*[@id="AccountFrm_password"]    Trinh@2003
    Input Password    //*[@id="AccountFrm_confirm"]    Trinh@2003
    Click Element    //*[@id="AccountFrm_newsletter1"]
    Click Element    //*[@id="AccountFrm_agree"]
    #Nhấn Đăng ký
    Click Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    2s
    #get text Error empty
    ${err_account}    Get Text    xpath=//div[@class="alert alert-error alert-danger"]
    ${E_Mail}    Get Text    //*[@id="AccountFrm"]/div[1]/fieldset/div[3]/span
    
    Should Contain    ${err_account}    Email Address does not appear to be valid!
    Should Be Equal    ${E_Mail}    Email Address does not appear to be valid!
    #Get text err field
    ${First_Name_field}    Get Value    //*[@id="AccountFrm_firstname"]
    ${Last_Name_field}    Get Value    //*[@id="AccountFrm_lastname"]
    ${E_Mail_field}    Get Value    //*[@id="AccountFrm_email"]
    ${Telephone_field}    Get Value    //*[@id="AccountFrm_telephone"]
    ${Fax_field}    Get Value    //*[@id="AccountFrm_fax"]
    ${Company_field}    Get Value    //*[@id="AccountFrm_company"]
    ${Address_1_field}    Get Value    //*[@id="AccountFrm_address_1"]
    ${Address_2_field}    Get Value    //*[@id="AccountFrm_address_2"]
    ${City_field}    Get Value    //*[@id="AccountFrm_city"]
    ${Region_tate_field}    Get Value    //*[@id="AccountFrm_zone_id"]
    ${ZIP_Code_field}    Get Value    //*[@id="AccountFrm_postcode"]
    ${Country_field}    Get Value    //*[@id="AccountFrm_country_id"]
    ${Login_name_field}    Get Value    //*[@id="AccountFrm_loginname"]
    Click Element    //*[@id="AccountFrm_newsletter1"]
    ${Password_field}    Get Value    //*[@id="AccountFrm_password"]
    Click Element    //*[@id="AccountFrm_agree"]
    ${Password_Confirm_field}    Get Value    //*[@id="AccountFrm_confirm"]
    #Kiểm tra các trường đã được điền chưa
    Should Be Equal    ${First_Name_field}    Huynh
    Should Be Equal As Strings    ${Last_Name_field}    Trinh
    Should Be Equal    ${E_Mail_field}    ${EMPTY}
    Should Be Equal    ${Telephone_field}    0344171672
    Should Be Equal    ${Fax_field}    + 84 (8) 24567889
    Should Be Equal    ${Company_field}    Baa Baby
    Should Be Equal    ${Address_1_field}    Ấp Tân Thông 4, Xã Thanh Tân, Huyện Mỏ Cày Bắc, Tỉnh Bến Tre
    Should Be Equal    ${Address_2_field}    Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh
    Should Be Equal    ${City_field}    Hồ Chí Minh
    Should Be Equal    ${Region_tate_field}    3780
    Should Be Equal    ${ZIP_Code_field}    70000
    Should Be Equal    ${Country_field}    230
    Should Be Equal    ${Login_name_field}    trinhtrinhhuynh4
    Should Be Equal    ${Password_field}    ${EMPTY}
    Should Be Equal    ${Password_Confirm_field}    ${EMPTY}
    Close Browser
TC5: Trống Trống Address 1
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Click Element   ${Login_or_register} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Click Element   ${Continue}  
    Location Should Be    https://automationteststore.com/index.php?rt=account/create
     #Kiểm tra trường dữ liệu
    Page Should Contain Element    //*[@id="AccountFrm_firstname"]
    Page Should Contain Element    //*[@id="AccountFrm_lastname"]
    Page Should Contain Element    //*[@id="AccountFrm_email"]
    Page Should Contain Element    //*[@id="AccountFrm_fax"]
    Page Should Contain Element    //*[@id="AccountFrm_company"]
    Page Should Contain Element    //*[@id="AccountFrm_address_1"]
    Page Should Contain Element    //*[@id="AccountFrm_address_2"]
    Page Should Contain Element    //*[@id="AccountFrm_city"]
    Page Should Contain Element    //*[@id="AccountFrm_country_id"]
    Page Should Contain Element    //*[@id="AccountFrm_zone_id"]
    Page Should Contain Element    //*[@id="AccountFrm_postcode"]
    Page Should Contain Element    //*[@id="AccountFrm_loginname"]
    Page Should Contain Element    //*[@id="AccountFrm_password"]
    Page Should Contain Element    //*[@id="AccountFrm_confirm"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter1"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter0"]
    Page Should Contain Element    //*[@id="AccountFrm_agree"]
    Page Should Contain Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    #Nhập dữ liệu
    Input Text    //*[@id="AccountFrm_firstname"]    Huynh
    Input Text    //*[@id="AccountFrm_lastname"]    Trinh
    Input Text    //*[@id="AccountFrm_email"]    trinhtrinhhuynh4huynh2003@gmail.com
    Input Text    //*[@id="AccountFrm_telephone"]    0344171672
    Input Text    //*[@id="AccountFrm_fax"]    + 84 (8) 24567889
    Input Text    //*[@id="AccountFrm_company"]    Baa Baby
    Input Text    //*[@id="AccountFrm_address_1"]    ${EMPTY}
    Input Text    //*[@id="AccountFrm_address_2"]    Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh
    Input Text    //*[@id="AccountFrm_city"]    Hồ Chí Minh
    Select From List By Value    //*[@id="AccountFrm_country_id"]    230
    Sleep    2s
    Select From List By Value    //*[@id="AccountFrm_zone_id"]    3780
    Input Text    //*[@id="AccountFrm_postcode"]    70000
    Input Text    //*[@id="AccountFrm_loginname"]    trinhtrinhhuynh4
    Input Password    //*[@id="AccountFrm_password"]    Trinh@2003
    Input Password    //*[@id="AccountFrm_confirm"]    Trinh@2003
    Click Element    //*[@id="AccountFrm_newsletter1"]
    Click Element    //*[@id="AccountFrm_agree"]
    #Nhấn Đăng ký
    Click Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    2s
    #get text Error empty
    ${err_account}    Get Text    xpath=//div[@class="alert alert-error alert-danger"]
    ${Address_1}    Get Text    //*[@id="AccountFrm"]/div[2]/fieldset/div[2]/span
    
    Should Contain    ${err_account}    Address 1 must be between 3 and 128 characters!
    Should Be Equal    ${Address_1}    Address 1 must be between 3 and 128 characters!
    #Get text err field
    ${First_Name_field}    Get Value    //*[@id="AccountFrm_firstname"]
    ${Last_Name_field}    Get Value    //*[@id="AccountFrm_lastname"]
    ${E_Mail_field}    Get Value    //*[@id="AccountFrm_email"]
    ${Telephone_field}    Get Value    //*[@id="AccountFrm_telephone"]
    ${Fax_field}    Get Value    //*[@id="AccountFrm_fax"]
    ${Company_field}    Get Value    //*[@id="AccountFrm_company"]
    ${Address_1_field}    Get Value    //*[@id="AccountFrm_address_1"]
    ${Address_2_field}    Get Value    //*[@id="AccountFrm_address_2"]
    ${City_field}    Get Value    //*[@id="AccountFrm_city"]
    ${Region_tate_field}    Get Value    //*[@id="AccountFrm_zone_id"]
    ${ZIP_Code_field}    Get Value    //*[@id="AccountFrm_postcode"]
    ${Country_field}    Get Value    //*[@id="AccountFrm_country_id"]
    ${Login_name_field}    Get Value    //*[@id="AccountFrm_loginname"]
    Click Element    //*[@id="AccountFrm_newsletter1"]
    ${Password_field}    Get Value    //*[@id="AccountFrm_password"]
    Click Element    //*[@id="AccountFrm_agree"]
    ${Password_Confirm_field}    Get Value    //*[@id="AccountFrm_confirm"]
    #Kiểm tra các trường đã được điền chưa
    Should Be Equal    ${First_Name_field}    Huynh
    Should Be Equal As Strings    ${Last_Name_field}    Trinh
    Should Be Equal    ${E_Mail_field}    trinhtrinhhuynh4huynh2003@gmail.com
    Should Be Equal    ${Telephone_field}    0344171672
    Should Be Equal    ${Fax_field}    + 84 (8) 24567889
    Should Be Equal    ${Company_field}    Baa Baby
    Should Be Equal    ${Address_1_field}    ${EMPTY}
    Should Be Equal    ${Address_2_field}    Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh
    Should Be Equal    ${City_field}    Hồ Chí Minh
    Should Be Equal    ${Region_tate_field}    3780
    Should Be Equal    ${ZIP_Code_field}    70000
    Should Be Equal    ${Country_field}    230
    Should Be Equal    ${Login_name_field}    trinhtrinhhuynh4
    Should Be Equal    ${Password_field}    ${EMPTY}
    Should Be Equal    ${Password_Confirm_field}    ${EMPTY}
    Close Browser
TC6: Trống City
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Click Element   ${Login_or_register} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Click Element   ${Continue}  
    Location Should Be    https://automationteststore.com/index.php?rt=account/create
     #Kiểm tra trường dữ liệu
    Page Should Contain Element    //*[@id="AccountFrm_firstname"]
    Page Should Contain Element    //*[@id="AccountFrm_lastname"]
    Page Should Contain Element    //*[@id="AccountFrm_email"]
    Page Should Contain Element    //*[@id="AccountFrm_fax"]
    Page Should Contain Element    //*[@id="AccountFrm_company"]
    Page Should Contain Element    //*[@id="AccountFrm_address_1"]
    Page Should Contain Element    //*[@id="AccountFrm_address_2"]
    Page Should Contain Element    //*[@id="AccountFrm_city"]
    Page Should Contain Element    //*[@id="AccountFrm_country_id"]
    Page Should Contain Element    //*[@id="AccountFrm_zone_id"]
    Page Should Contain Element    //*[@id="AccountFrm_postcode"]
    Page Should Contain Element    //*[@id="AccountFrm_loginname"]
    Page Should Contain Element    //*[@id="AccountFrm_password"]
    Page Should Contain Element    //*[@id="AccountFrm_confirm"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter1"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter0"]
    Page Should Contain Element    //*[@id="AccountFrm_agree"]
    Page Should Contain Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    #Nhập dữ liệu
    Input Text    //*[@id="AccountFrm_firstname"]    Huynh
    Input Text    //*[@id="AccountFrm_lastname"]    Trinh
    Input Text    //*[@id="AccountFrm_email"]    trinhtrinhhuynh4huynh2003@gmail.com
    Input Text    //*[@id="AccountFrm_telephone"]    0344171672
    Input Text    //*[@id="AccountFrm_fax"]    + 84 (8) 24567889
    Input Text    //*[@id="AccountFrm_company"]    Baa Baby
    Input Text    //*[@id="AccountFrm_address_1"]    Ấp Tân Thông 4, Xã Thanh Tân, Huyện Mỏ Cày Bắc, Tỉnh Bến Tre
    Input Text    //*[@id="AccountFrm_address_2"]    Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh
    Input Text    //*[@id="AccountFrm_city"]    ${EMPTY}
    Select From List By Value    //*[@id="AccountFrm_country_id"]    230
    Sleep    2s
    Select From List By Value    //*[@id="AccountFrm_zone_id"]    3780
    Input Text    //*[@id="AccountFrm_postcode"]    70000
    Input Text    //*[@id="AccountFrm_loginname"]    trinhtrinhhuynh4
    Input Password    //*[@id="AccountFrm_password"]    Trinh@2003
    Input Password    //*[@id="AccountFrm_confirm"]    Trinh@2003
    Click Element    //*[@id="AccountFrm_newsletter1"]
    Click Element    //*[@id="AccountFrm_agree"]
    #Nhấn Đăng ký
    Click Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    2s
    #get text Error empty
    ${err_account}    Get Text    xpath=//div[@class="alert alert-error alert-danger"]
    ${City}    Get Text    //*[@id="AccountFrm"]/div[2]/fieldset/div[4]/span
    
    Should Contain    ${err_account}    City must be between 3 and 128 characters!
    Should Be Equal    ${City}    City must be between 3 and 128 characters!
    #Get text err field
    ${First_Name_field}    Get Value    //*[@id="AccountFrm_firstname"]
    ${Last_Name_field}    Get Value    //*[@id="AccountFrm_lastname"]
    ${E_Mail_field}    Get Value    //*[@id="AccountFrm_email"]
    ${Telephone_field}    Get Value    //*[@id="AccountFrm_telephone"]
    ${Fax_field}    Get Value    //*[@id="AccountFrm_fax"]
    ${Company_field}    Get Value    //*[@id="AccountFrm_company"]
    ${Address_1_field}    Get Value    //*[@id="AccountFrm_address_1"]
    ${Address_2_field}    Get Value    //*[@id="AccountFrm_address_2"]
    ${City_field}    Get Value    //*[@id="AccountFrm_city"]
    ${Region_tate_field}    Get Value    //*[@id="AccountFrm_zone_id"]
    ${ZIP_Code_field}    Get Value    //*[@id="AccountFrm_postcode"]
    ${Country_field}    Get Value    //*[@id="AccountFrm_country_id"]
    ${Login_name_field}    Get Value    //*[@id="AccountFrm_loginname"]
    Click Element    //*[@id="AccountFrm_newsletter1"]
    ${Password_field}    Get Value    //*[@id="AccountFrm_password"]
    Click Element    //*[@id="AccountFrm_agree"]
    ${Password_Confirm_field}    Get Value    //*[@id="AccountFrm_confirm"]
    #Kiểm tra các trường đã được điền chưa
    Should Be Equal    ${First_Name_field}    Huynh
    Should Be Equal As Strings    ${Last_Name_field}    Trinh
    Should Be Equal    ${E_Mail_field}    trinhtrinhhuynh4huynh2003@gmail.com
    Should Be Equal    ${Telephone_field}    0344171672
    Should Be Equal    ${Fax_field}    + 84 (8) 24567889
    Should Be Equal    ${Company_field}    Baa Baby
    Should Be Equal    ${Address_1_field}    Ấp Tân Thông 4, Xã Thanh Tân, Huyện Mỏ Cày Bắc, Tỉnh Bến Tre
    Should Be Equal    ${Address_2_field}    Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh
    Should Be Equal    ${City_field}    ${EMPTY}
    Should Be Equal    ${Region_tate_field}    3780
    Should Be Equal    ${ZIP_Code_field}    70000
    Should Be Equal    ${Country_field}    230
    Should Be Equal    ${Login_name_field}    trinhtrinhhuynh4
    Should Be Equal    ${Password_field}    ${EMPTY}
    Should Be Equal    ${Password_Confirm_field}    ${EMPTY}
    Close Browser
TC7: Trống Region / State
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Click Element   ${Login_or_register} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Click Element   ${Continue}  
    Location Should Be    https://automationteststore.com/index.php?rt=account/create
     #Kiểm tra trường dữ liệu
    Page Should Contain Element    //*[@id="AccountFrm_firstname"]
    Page Should Contain Element    //*[@id="AccountFrm_lastname"]
    Page Should Contain Element    //*[@id="AccountFrm_email"]
    Page Should Contain Element    //*[@id="AccountFrm_fax"]
    Page Should Contain Element    //*[@id="AccountFrm_company"]
    Page Should Contain Element    //*[@id="AccountFrm_address_1"]
    Page Should Contain Element    //*[@id="AccountFrm_address_2"]
    Page Should Contain Element    //*[@id="AccountFrm_city"]
    Page Should Contain Element    //*[@id="AccountFrm_country_id"]
    Page Should Contain Element    //*[@id="AccountFrm_zone_id"]
    Page Should Contain Element    //*[@id="AccountFrm_postcode"]
    Page Should Contain Element    //*[@id="AccountFrm_loginname"]
    Page Should Contain Element    //*[@id="AccountFrm_password"]
    Page Should Contain Element    //*[@id="AccountFrm_confirm"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter1"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter0"]
    Page Should Contain Element    //*[@id="AccountFrm_agree"]
    Page Should Contain Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    #Nhập dữ liệu
    Input Text    //*[@id="AccountFrm_firstname"]    Huynh
    Input Text    //*[@id="AccountFrm_lastname"]    Trinh
    Input Text    //*[@id="AccountFrm_email"]    trinhtrinhhuynh4huynh2003@gmail.com
    Input Text    //*[@id="AccountFrm_telephone"]    0344171672
    Input Text    //*[@id="AccountFrm_fax"]    + 84 (8) 24567889
    Input Text    //*[@id="AccountFrm_company"]    Baa Baby
    Input Text    //*[@id="AccountFrm_address_1"]    Ấp Tân Thông 4, Xã Thanh Tân, Huyện Mỏ Cày Bắc, Tỉnh Bến Tre
    Input Text    //*[@id="AccountFrm_address_2"]    Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh
    Input Text    //*[@id="AccountFrm_city"]    Hồ Chí Minh
    Select From List By Value    //*[@id="AccountFrm_country_id"]    230
    Sleep    2s
    Input Text    //*[@id="AccountFrm_postcode"]    70000
    Input Text    //*[@id="AccountFrm_loginname"]    trinhtrinhhuynh4
    Input Password    //*[@id="AccountFrm_password"]    Trinh@2003
    Input Password    //*[@id="AccountFrm_confirm"]    Trinh@2003
    Click Element    //*[@id="AccountFrm_newsletter1"]
    Click Element    //*[@id="AccountFrm_agree"]
    #Nhấn Đăng ký
    Click Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    2s
    #get text Error empty
    ${err_account}    Get Text    xpath=//div[@class="alert alert-error alert-danger"]
    ${Region_tate}    Get Text    //*[@id="AccountFrm"]/div[2]/fieldset/div[5]/span
    
    Should Contain    ${err_account}    Please select a region / state!
    Should Be Equal    ${Region_tate}    Please select a region / state!
    #Get text err field
    ${First_Name_field}    Get Value    //*[@id="AccountFrm_firstname"]
    ${Last_Name_field}    Get Value    //*[@id="AccountFrm_lastname"]
    ${E_Mail_field}    Get Value    //*[@id="AccountFrm_email"]
    ${Telephone_field}    Get Value    //*[@id="AccountFrm_telephone"]
    ${Fax_field}    Get Value    //*[@id="AccountFrm_fax"]
    ${Company_field}    Get Value    //*[@id="AccountFrm_company"]
    ${Address_1_field}    Get Value    //*[@id="AccountFrm_address_1"]
    ${Address_2_field}    Get Value    //*[@id="AccountFrm_address_2"]
    ${City_field}    Get Value    //*[@id="AccountFrm_city"]
    ${Region_tate_field}    Get Value    //*[@id="AccountFrm_zone_id"]
    ${ZIP_Code_field}    Get Value    //*[@id="AccountFrm_postcode"]
    ${Country_field}    Get Value    //*[@id="AccountFrm_country_id"]
    ${Login_name_field}    Get Value    //*[@id="AccountFrm_loginname"]
    Click Element    //*[@id="AccountFrm_newsletter1"]
    ${Password_field}    Get Value    //*[@id="AccountFrm_password"]
    Click Element    //*[@id="AccountFrm_agree"]
    ${Password_Confirm_field}    Get Value    //*[@id="AccountFrm_confirm"]
    #Kiểm tra các trường đã được điền chưa
    Should Be Equal    ${First_Name_field}    Huynh
    Should Be Equal As Strings    ${Last_Name_field}    Trinh
    Should Be Equal    ${E_Mail_field}    trinhtrinhhuynh4huynh2003@gmail.com
    Should Be Equal    ${Telephone_field}    0344171672
    Should Be Equal    ${Fax_field}    + 84 (8) 24567889
    Should Be Equal    ${Company_field}    Baa Baby
    Should Be Equal    ${Address_1_field}    Ấp Tân Thông 4, Xã Thanh Tân, Huyện Mỏ Cày Bắc, Tỉnh Bến Tre
    Should Be Equal    ${Address_2_field}    Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh
    Should Be Equal    ${City_field}    Hồ Chí Minh
    Should Be Equal    ${ZIP_Code_field}    70000
    Should Be Equal    ${Country_field}    230
    Should Be Equal    ${Login_name_field}    trinhtrinhhuynh4
    Should Be Equal    ${Password_field}    ${EMPTY}
    Should Be Equal    ${Password_Confirm_field}    ${EMPTY}
    Close Browser
TC8: Trống ZIP Code
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Click Element   ${Login_or_register} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Click Element   ${Continue}  
    Location Should Be    https://automationteststore.com/index.php?rt=account/create
     #Kiểm tra trường dữ liệu
    Page Should Contain Element    //*[@id="AccountFrm_firstname"]
    Page Should Contain Element    //*[@id="AccountFrm_lastname"]
    Page Should Contain Element    //*[@id="AccountFrm_email"]
    Page Should Contain Element    //*[@id="AccountFrm_fax"]
    Page Should Contain Element    //*[@id="AccountFrm_company"]
    Page Should Contain Element    //*[@id="AccountFrm_address_1"]
    Page Should Contain Element    //*[@id="AccountFrm_address_2"]
    Page Should Contain Element    //*[@id="AccountFrm_city"]
    Page Should Contain Element    //*[@id="AccountFrm_country_id"]
    Page Should Contain Element    //*[@id="AccountFrm_zone_id"]
    Page Should Contain Element    //*[@id="AccountFrm_postcode"]
    Page Should Contain Element    //*[@id="AccountFrm_loginname"]
    Page Should Contain Element    //*[@id="AccountFrm_password"]
    Page Should Contain Element    //*[@id="AccountFrm_confirm"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter1"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter0"]
    Page Should Contain Element    //*[@id="AccountFrm_agree"]
    Page Should Contain Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    #Nhập dữ liệu
    Input Text    //*[@id="AccountFrm_firstname"]    Huynh
    Input Text    //*[@id="AccountFrm_lastname"]    Trinh
    Input Text    //*[@id="AccountFrm_email"]    trinhtrinhhuynh4huynh2003@gmail.com
    Input Text    //*[@id="AccountFrm_telephone"]    0344171672
    Input Text    //*[@id="AccountFrm_fax"]    + 84 (8) 24567889
    Input Text    //*[@id="AccountFrm_company"]    Baa Baby
    Input Text    //*[@id="AccountFrm_address_1"]    Ấp Tân Thông 4, Xã Thanh Tân, Huyện Mỏ Cày Bắc, Tỉnh Bến Tre
    Input Text    //*[@id="AccountFrm_address_2"]    Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh
    Input Text    //*[@id="AccountFrm_city"]    Hồ Chí Minh
    Select From List By Value    //*[@id="AccountFrm_country_id"]    230
    Sleep    2s
    Select From List By Value    //*[@id="AccountFrm_zone_id"]    3780
    Input Text    //*[@id="AccountFrm_postcode"]    ${EMPTY}
    Input Text    //*[@id="AccountFrm_loginname"]    trinhtrinhhuynh4
    Input Password    //*[@id="AccountFrm_password"]    Trinh@2003
    Input Password    //*[@id="AccountFrm_confirm"]    Trinh@2003
    Click Element    //*[@id="AccountFrm_newsletter1"]
    Click Element    //*[@id="AccountFrm_agree"]
    #Nhấn Đăng ký
    Click Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    2s
    #get text Error empty
    ${err_account}    Get Text    xpath=//div[@class="alert alert-error alert-danger"]
    ${ZIP_Code}    Get Text    //*[@id="AccountFrm"]/div[2]/fieldset/div[6]/span
    
    Should Contain    ${err_account}    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal    ${ZIP_Code}    Zip/postal code must be between 3 and 10 characters!
    #Get text err field
    ${First_Name_field}    Get Value    //*[@id="AccountFrm_firstname"]
    ${Last_Name_field}    Get Value    //*[@id="AccountFrm_lastname"]
    ${E_Mail_field}    Get Value    //*[@id="AccountFrm_email"]
    ${Telephone_field}    Get Value    //*[@id="AccountFrm_telephone"]
    ${Fax_field}    Get Value    //*[@id="AccountFrm_fax"]
    ${Company_field}    Get Value    //*[@id="AccountFrm_company"]
    ${Address_1_field}    Get Value    //*[@id="AccountFrm_address_1"]
    ${Address_2_field}    Get Value    //*[@id="AccountFrm_address_2"]
    ${City_field}    Get Value    //*[@id="AccountFrm_city"]
    ${Region_tate_field}    Get Value    //*[@id="AccountFrm_zone_id"]
    ${ZIP_Code_field}    Get Value    //*[@id="AccountFrm_postcode"]
    ${Country_field}    Get Value    //*[@id="AccountFrm_country_id"]
    ${Login_name_field}    Get Value    //*[@id="AccountFrm_loginname"]
    Click Element    //*[@id="AccountFrm_newsletter1"]
    ${Password_field}    Get Value    //*[@id="AccountFrm_password"]
    Click Element    //*[@id="AccountFrm_agree"]
    ${Password_Confirm_field}    Get Value    //*[@id="AccountFrm_confirm"]
    #Kiểm tra các trường đã được điền chưa
    Should Be Equal    ${First_Name_field}    Huynh
    Should Be Equal As Strings    ${Last_Name_field}    Trinh
    Should Be Equal    ${E_Mail_field}    trinhtrinhhuynh4huynh2003@gmail.com
    Should Be Equal    ${Telephone_field}    0344171672
    Should Be Equal    ${Fax_field}    + 84 (8) 24567889
    Should Be Equal    ${Company_field}    Baa Baby
    Should Be Equal    ${Address_1_field}    Ấp Tân Thông 4, Xã Thanh Tân, Huyện Mỏ Cày Bắc, Tỉnh Bến Tre
    Should Be Equal    ${Address_2_field}    Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh
    Should Be Equal    ${City_field}    Hồ Chí Minh
    Should Be Equal    ${Region_tate_field}    3780
    Should Be Equal    ${ZIP_Code_field}    ${EMPTY}
    Should Be Equal    ${Country_field}    230
    Should Be Equal    ${Login_name_field}    trinhtrinhhuynh4
    Should Be Equal    ${Password_field}    ${EMPTY}
    Should Be Equal    ${Password_Confirm_field}    ${EMPTY}
    Close Browser
TC9: KHông chọn Country và region / state mặc định
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Click Element   ${Login_or_register} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Click Element   ${Continue}  
    Location Should Be    https://automationteststore.com/index.php?rt=account/create
     #Kiểm tra trường dữ liệu
    Page Should Contain Element    //*[@id="AccountFrm_firstname"]
    Page Should Contain Element    //*[@id="AccountFrm_lastname"]
    Page Should Contain Element    //*[@id="AccountFrm_email"]
    Page Should Contain Element    //*[@id="AccountFrm_fax"]
    Page Should Contain Element    //*[@id="AccountFrm_company"]
    Page Should Contain Element    //*[@id="AccountFrm_address_1"]
    Page Should Contain Element    //*[@id="AccountFrm_address_2"]
    Page Should Contain Element    //*[@id="AccountFrm_city"]
    Page Should Contain Element    //*[@id="AccountFrm_country_id"]
    Page Should Contain Element    //*[@id="AccountFrm_zone_id"]
    Page Should Contain Element    //*[@id="AccountFrm_postcode"]
    Page Should Contain Element    //*[@id="AccountFrm_loginname"]
    Page Should Contain Element    //*[@id="AccountFrm_password"]
    Page Should Contain Element    //*[@id="AccountFrm_confirm"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter1"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter0"]
    Page Should Contain Element    //*[@id="AccountFrm_agree"]
    Page Should Contain Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    #Nhập dữ liệu
    Input Text    //*[@id="AccountFrm_firstname"]    Huynh
    Input Text    //*[@id="AccountFrm_lastname"]    Trinh
    Input Text    //*[@id="AccountFrm_email"]    trinhtrinhhuynh4huynh2003@gmail.com
    Input Text    //*[@id="AccountFrm_telephone"]    0344171672
    Input Text    //*[@id="AccountFrm_fax"]    + 84 (8) 24567889
    Input Text    //*[@id="AccountFrm_company"]    Baa Baby
    Input Text    //*[@id="AccountFrm_address_1"]    Ấp Tân Thông 4, Xã Thanh Tân, Huyện Mỏ Cày Bắc, Tỉnh Bến Tre
    Input Text    //*[@id="AccountFrm_address_2"]    Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh
    Input Text    //*[@id="AccountFrm_city"]    Hồ Chí Minh
    Sleep    2s
    Select From List By Value    //*[@id="AccountFrm_zone_id"]    FALSE
    Input Text    //*[@id="AccountFrm_postcode"]    70000
    Input Text    //*[@id="AccountFrm_loginname"]    trinhtrinhhuynh4
    Input Password    //*[@id="AccountFrm_password"]    Trinh@2003
    Input Password    //*[@id="AccountFrm_confirm"]    Trinh@2003
    Click Element    //*[@id="AccountFrm_newsletter1"]
    Click Element    //*[@id="AccountFrm_agree"]
    #Nhấn Đăng ký
    Click Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    2s
    #get text Error empty
    ${err_account}    Get Text    xpath=//div[@class="alert alert-error alert-danger"]
    ${Region_tate}    Get Text    //*[@id="AccountFrm"]/div[2]/fieldset/div[5]/span
    
    Should Contain    ${err_account}    Please select a region / state!
    Should Be Equal    ${Region_tate}    Please select a region / state!
    #Get text err field
    ${First_Name_field}    Get Value    //*[@id="AccountFrm_firstname"]
    ${Last_Name_field}    Get Value    //*[@id="AccountFrm_lastname"]
    ${E_Mail_field}    Get Value    //*[@id="AccountFrm_email"]
    ${Telephone_field}    Get Value    //*[@id="AccountFrm_telephone"]
    ${Fax_field}    Get Value    //*[@id="AccountFrm_fax"]
    ${Company_field}    Get Value    //*[@id="AccountFrm_company"]
    ${Address_1_field}    Get Value    //*[@id="AccountFrm_address_1"]
    ${Address_2_field}    Get Value    //*[@id="AccountFrm_address_2"]
    ${City_field}    Get Value    //*[@id="AccountFrm_city"]
    ${Region_tate_field}    Get Value    //*[@id="AccountFrm_zone_id"]
    ${ZIP_Code_field}    Get Value    //*[@id="AccountFrm_postcode"]
    ${Country_field}    Get Value    //*[@id="AccountFrm_country_id"]
    ${Login_name_field}    Get Value    //*[@id="AccountFrm_loginname"]
    Click Element    //*[@id="AccountFrm_newsletter1"]
    ${Password_field}    Get Value    //*[@id="AccountFrm_password"]
    Click Element    //*[@id="AccountFrm_agree"]
    ${Password_Confirm_field}    Get Value    //*[@id="AccountFrm_confirm"]
    #Kiểm tra các trường đã được điền chưa
    Should Be Equal    ${First_Name_field}    Huynh
    Should Be Equal As Strings    ${Last_Name_field}    Trinh
    Should Be Equal    ${E_Mail_field}    trinhtrinhhuynh4huynh2003@gmail.com
    Should Be Equal    ${Telephone_field}    0344171672
    Should Be Equal    ${Fax_field}    + 84 (8) 24567889
    Should Be Equal    ${Company_field}    Baa Baby
    Should Be Equal    ${Address_1_field}    Ấp Tân Thông 4, Xã Thanh Tân, Huyện Mỏ Cày Bắc, Tỉnh Bến Tre
    Should Be Equal    ${Address_2_field}    Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh
    Should Be Equal    ${City_field}    Hồ Chí Minh
    Should Be Equal    ${Region_tate_field}    FALSE
    Should Be Equal    ${ZIP_Code_field}    70000
    Should Be Equal    ${Login_name_field}    trinhtrinhhuynh4
    Should Be Equal    ${Password_field}    ${EMPTY}
    Should Be Equal    ${Password_Confirm_field}    ${EMPTY}
    Close Browser
TC10: Trống Login name
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Click Element   ${Login_or_register} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Click Element   ${Continue}  
    Location Should Be    https://automationteststore.com/index.php?rt=account/create
     #Kiểm tra trường dữ liệu
    Page Should Contain Element    //*[@id="AccountFrm_firstname"]
    Page Should Contain Element    //*[@id="AccountFrm_lastname"]
    Page Should Contain Element    //*[@id="AccountFrm_email"]
    Page Should Contain Element    //*[@id="AccountFrm_fax"]
    Page Should Contain Element    //*[@id="AccountFrm_company"]
    Page Should Contain Element    //*[@id="AccountFrm_address_1"]
    Page Should Contain Element    //*[@id="AccountFrm_address_2"]
    Page Should Contain Element    //*[@id="AccountFrm_city"]
    Page Should Contain Element    //*[@id="AccountFrm_country_id"]
    Page Should Contain Element    //*[@id="AccountFrm_zone_id"]
    Page Should Contain Element    //*[@id="AccountFrm_postcode"]
    Page Should Contain Element    //*[@id="AccountFrm_loginname"]
    Page Should Contain Element    //*[@id="AccountFrm_password"]
    Page Should Contain Element    //*[@id="AccountFrm_confirm"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter1"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter0"]
    Page Should Contain Element    //*[@id="AccountFrm_agree"]
    Page Should Contain Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    #Nhập dữ liệu
    Input Text    //*[@id="AccountFrm_firstname"]    Huynh
    Input Text    //*[@id="AccountFrm_lastname"]    Trinh
    Input Text    //*[@id="AccountFrm_email"]    trinhtrinhhuynh4huynh2003@gmail.com
    Input Text    //*[@id="AccountFrm_telephone"]    0344171672
    Input Text    //*[@id="AccountFrm_fax"]    + 84 (8) 24567889
    Input Text    //*[@id="AccountFrm_company"]    Baa Baby
    Input Text    //*[@id="AccountFrm_address_1"]    Ấp Tân Thông 4, Xã Thanh Tân, Huyện Mỏ Cày Bắc, Tỉnh Bến Tre
    Input Text    //*[@id="AccountFrm_address_2"]    Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh
    Input Text    //*[@id="AccountFrm_city"]    Hồ Chí Minh
    Select From List By Value    //*[@id="AccountFrm_country_id"]    230
    Sleep    2s
    Select From List By Value    //*[@id="AccountFrm_zone_id"]    3780
    Input Text    //*[@id="AccountFrm_postcode"]    70000
    Input Text    //*[@id="AccountFrm_loginname"]    ${EMPTY}
    Input Password    //*[@id="AccountFrm_password"]    Trinh@2003
    Input Password    //*[@id="AccountFrm_confirm"]    Trinh@2003
    Click Element    //*[@id="AccountFrm_newsletter1"]
    Click Element    //*[@id="AccountFrm_agree"]
    #Nhấn Đăng ký
    Click Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    2s
    #get text Error empty
    ${err_account}    Get Text    xpath=//div[@class="alert alert-error alert-danger"]
    ${Login_name}    Get Text    //*[@id="AccountFrm"]/div[3]/fieldset/div[1]/span
    
    Should Contain    ${err_account}    Login name must be alphanumeric only and between 5 and 64 characters!
    Should Be Equal    ${Login_name}    Login name must be alphanumeric only and between 5 and 64 characters!
    #Get text err field
    ${First_Name_field}    Get Value    //*[@id="AccountFrm_firstname"]
    ${Last_Name_field}    Get Value    //*[@id="AccountFrm_lastname"]
    ${E_Mail_field}    Get Value    //*[@id="AccountFrm_email"]
    ${Telephone_field}    Get Value    //*[@id="AccountFrm_telephone"]
    ${Fax_field}    Get Value    //*[@id="AccountFrm_fax"]
    ${Company_field}    Get Value    //*[@id="AccountFrm_company"]
    ${Address_1_field}    Get Value    //*[@id="AccountFrm_address_1"]
    ${Address_2_field}    Get Value    //*[@id="AccountFrm_address_2"]
    ${City_field}    Get Value    //*[@id="AccountFrm_city"]
    ${Region_tate_field}    Get Value    //*[@id="AccountFrm_zone_id"]
    ${ZIP_Code_field}    Get Value    //*[@id="AccountFrm_postcode"]
    ${Country_field}    Get Value    //*[@id="AccountFrm_country_id"]
    ${Login_name_field}    Get Value    //*[@id="AccountFrm_loginname"]
    Click Element    //*[@id="AccountFrm_newsletter1"]
    ${Password_field}    Get Value    //*[@id="AccountFrm_password"]
    Click Element    //*[@id="AccountFrm_agree"]
    ${Password_Confirm_field}    Get Value    //*[@id="AccountFrm_confirm"]
    #Kiểm tra các trường đã được điền chưa
    Should Be Equal    ${First_Name_field}    Huynh
    Should Be Equal As Strings    ${Last_Name_field}    Trinh
    Should Be Equal    ${E_Mail_field}    trinhtrinhhuynh4huynh2003@gmail.com
    Should Be Equal    ${Telephone_field}    0344171672
    Should Be Equal    ${Fax_field}    + 84 (8) 24567889
    Should Be Equal    ${Company_field}    Baa Baby
    Should Be Equal    ${Address_1_field}    Ấp Tân Thông 4, Xã Thanh Tân, Huyện Mỏ Cày Bắc, Tỉnh Bến Tre
    Should Be Equal    ${Address_2_field}    Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh
    Should Be Equal    ${City_field}    Hồ Chí Minh
    Should Be Equal    ${Region_tate_field}    3780
    Should Be Equal    ${ZIP_Code_field}    70000
    Should Be Equal    ${Country_field}    230
    Should Be Equal    ${Login_name_field}    ${EMPTY}
    Should Be Equal    ${Password_field}    ${EMPTY}
    Should Be Equal    ${Password_Confirm_field}    ${EMPTY}
    Close Browser
TC11: Trống Password
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Click Element   ${Login_or_register} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Click Element   ${Continue}  
    Location Should Be    https://automationteststore.com/index.php?rt=account/create
     #Kiểm tra trường dữ liệu
    Page Should Contain Element    //*[@id="AccountFrm_firstname"]
    Page Should Contain Element    //*[@id="AccountFrm_lastname"]
    Page Should Contain Element    //*[@id="AccountFrm_email"]
    Page Should Contain Element    //*[@id="AccountFrm_fax"]
    Page Should Contain Element    //*[@id="AccountFrm_company"]
    Page Should Contain Element    //*[@id="AccountFrm_address_1"]
    Page Should Contain Element    //*[@id="AccountFrm_address_2"]
    Page Should Contain Element    //*[@id="AccountFrm_city"]
    Page Should Contain Element    //*[@id="AccountFrm_country_id"]
    Page Should Contain Element    //*[@id="AccountFrm_zone_id"]
    Page Should Contain Element    //*[@id="AccountFrm_postcode"]
    Page Should Contain Element    //*[@id="AccountFrm_loginname"]
    Page Should Contain Element    //*[@id="AccountFrm_password"]
    Page Should Contain Element    //*[@id="AccountFrm_confirm"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter1"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter0"]
    Page Should Contain Element    //*[@id="AccountFrm_agree"]
    Page Should Contain Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    #Nhập dữ liệu
    Input Text    //*[@id="AccountFrm_firstname"]    Huynh
    Input Text    //*[@id="AccountFrm_lastname"]    Trinh
    Input Text    //*[@id="AccountFrm_email"]    trinhtrinhhuynh4huynh2003@gmail.com
    Input Text    //*[@id="AccountFrm_telephone"]    0344171672
    Input Text    //*[@id="AccountFrm_fax"]    + 84 (8) 24567889
    Input Text    //*[@id="AccountFrm_company"]    Baa Baby
    Input Text    //*[@id="AccountFrm_address_1"]    Ấp Tân Thông 4, Xã Thanh Tân, Huyện Mỏ Cày Bắc, Tỉnh Bến Tre
    Input Text    //*[@id="AccountFrm_address_2"]    Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh
    Input Text    //*[@id="AccountFrm_city"]    Hồ Chí Minh
    Select From List By Value    //*[@id="AccountFrm_country_id"]    230
    Sleep    2s
    Select From List By Value    //*[@id="AccountFrm_zone_id"]    3780
    Input Text    //*[@id="AccountFrm_postcode"]    70000
    Input Text    //*[@id="AccountFrm_loginname"]    trinhtrinhhuynh4
    Input Password    //*[@id="AccountFrm_password"]    ${EMPTY}
    Click Element    //*[@id="AccountFrm_newsletter1"]
    Click Element    //*[@id="AccountFrm_agree"]
    #Nhấn Đăng ký
    Click Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    2s
    #get text Error empty
    ${err_account}    Get Text    xpath=//div[@class="alert alert-error alert-danger"]
    ${Password}    Get Text    //*[@id="AccountFrm"]/div[3]/fieldset/div[2]/span
    
    Should Contain    ${err_account}    Password must be between 4 and 20 characters!
    Should Be Equal    ${Password}    Password must be between 4 and 20 characters!
    #Get text err field
    ${First_Name_field}    Get Value    //*[@id="AccountFrm_firstname"]
    ${Last_Name_field}    Get Value    //*[@id="AccountFrm_lastname"]
    ${E_Mail_field}    Get Value    //*[@id="AccountFrm_email"]
    ${Telephone_field}    Get Value    //*[@id="AccountFrm_telephone"]
    ${Fax_field}    Get Value    //*[@id="AccountFrm_fax"]
    ${Company_field}    Get Value    //*[@id="AccountFrm_company"]
    ${Address_1_field}    Get Value    //*[@id="AccountFrm_address_1"]
    ${Address_2_field}    Get Value    //*[@id="AccountFrm_address_2"]
    ${City_field}    Get Value    //*[@id="AccountFrm_city"]
    ${Region_tate_field}    Get Value    //*[@id="AccountFrm_zone_id"]
    ${ZIP_Code_field}    Get Value    //*[@id="AccountFrm_postcode"]
    ${Country_field}    Get Value    //*[@id="AccountFrm_country_id"]
    ${Login_name_field}    Get Value    //*[@id="AccountFrm_loginname"]
    ${Password_field}    Get Value    //*[@id="AccountFrm_password"]
    ${Password_Confirm_field}    Get Value    //*[@id="AccountFrm_confirm"]
    #Kiểm tra các trường đã được điền chưa
    Should Be Equal    ${First_Name_field}    Huynh
    Should Be Equal As Strings    ${Last_Name_field}    Trinh
    Should Be Equal    ${E_Mail_field}    trinhtrinhhuynh4huynh2003@gmail.com
    Should Be Equal    ${Telephone_field}    0344171672
    Should Be Equal    ${Fax_field}    + 84 (8) 24567889
    Should Be Equal    ${Company_field}    Baa Baby
    Should Be Equal    ${Address_1_field}    Ấp Tân Thông 4, Xã Thanh Tân, Huyện Mỏ Cày Bắc, Tỉnh Bến Tre
    Should Be Equal    ${Address_2_field}    Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh
    Should Be Equal    ${City_field}    Hồ Chí Minh
    Should Be Equal    ${Region_tate_field}    3780
    Should Be Equal    ${ZIP_Code_field}    70000
    Should Be Equal    ${Country_field}    230
    Should Be Equal    ${Login_name_field}    trinhtrinhhuynh4
    Should Be Equal    ${Password_field}    ${EMPTY}
    Should Be Equal    ${Password_Confirm_field}    ${EMPTY}
    Close Browser
TC12: Trống Password Confirm
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Click Element   ${Login_or_register} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Click Element   ${Continue}  
    Location Should Be    https://automationteststore.com/index.php?rt=account/create
     #Kiểm tra trường dữ liệu
    Page Should Contain Element    //*[@id="AccountFrm_firstname"]
    Page Should Contain Element    //*[@id="AccountFrm_lastname"]
    Page Should Contain Element    //*[@id="AccountFrm_email"]
    Page Should Contain Element    //*[@id="AccountFrm_fax"]
    Page Should Contain Element    //*[@id="AccountFrm_company"]
    Page Should Contain Element    //*[@id="AccountFrm_address_1"]
    Page Should Contain Element    //*[@id="AccountFrm_address_2"]
    Page Should Contain Element    //*[@id="AccountFrm_city"]
    Page Should Contain Element    //*[@id="AccountFrm_country_id"]
    Page Should Contain Element    //*[@id="AccountFrm_zone_id"]
    Page Should Contain Element    //*[@id="AccountFrm_postcode"]
    Page Should Contain Element    //*[@id="AccountFrm_loginname"]
    Page Should Contain Element    //*[@id="AccountFrm_password"]
    Page Should Contain Element    //*[@id="AccountFrm_confirm"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter1"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter0"]
    Page Should Contain Element    //*[@id="AccountFrm_agree"]
    Page Should Contain Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    #Nhập dữ liệu
    Input Text    //*[@id="AccountFrm_firstname"]    Huynh
    Input Text    //*[@id="AccountFrm_lastname"]    Trinh
    Input Text    //*[@id="AccountFrm_email"]    trinhtrinhhuynh4huynh2003@gmail.com
    Input Text    //*[@id="AccountFrm_telephone"]    0344171672
    Input Text    //*[@id="AccountFrm_fax"]    + 84 (8) 24567889
    Input Text    //*[@id="AccountFrm_company"]    Baa Baby
    Input Text    //*[@id="AccountFrm_address_1"]    Ấp Tân Thông 4, Xã Thanh Tân, Huyện Mỏ Cày Bắc, Tỉnh Bến Tre
    Input Text    //*[@id="AccountFrm_address_2"]    Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh
    Input Text    //*[@id="AccountFrm_city"]    Hồ Chí Minh
    Select From List By Value    //*[@id="AccountFrm_country_id"]    230
    Sleep    2s
    Select From List By Value    //*[@id="AccountFrm_zone_id"]    3780
    Input Text    //*[@id="AccountFrm_postcode"]    70000
    Input Text    //*[@id="AccountFrm_loginname"]    trinhtrinhhuynh4
    Input Password    //*[@id="AccountFrm_password"]    Trinh@2003
    Input Password    //*[@id="AccountFrm_confirm"]    ${EMPTY}
    Click Element    //*[@id="AccountFrm_newsletter1"]
    Click Element    //*[@id="AccountFrm_agree"]
    #Nhấn Đăng ký
    Click Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    2s
    #get text Error empty
    ${err_account}    Get Text    xpath=//div[@class="alert alert-error alert-danger"]
    ${Password_Confirm_}    Get Text    //*[@id="AccountFrm"]/div[3]/fieldset/div[3]/span
    
    Should Contain    ${err_account}    Password confirmation does not match password!
    Should Be Equal    ${Password_Confirm}    Password confirmation does not match password!
    #Get text err field
    ${First_Name_field}    Get Value    //*[@id="AccountFrm_firstname"]
    ${Last_Name_field}    Get Value    //*[@id="AccountFrm_lastname"]
    ${E_Mail_field}    Get Value    //*[@id="AccountFrm_email"]
    ${Telephone_field}    Get Value    //*[@id="AccountFrm_telephone"]
    ${Fax_field}    Get Value    //*[@id="AccountFrm_fax"]
    ${Company_field}    Get Value    //*[@id="AccountFrm_company"]
    ${Address_1_field}    Get Value    //*[@id="AccountFrm_address_1"]
    ${Address_2_field}    Get Value    //*[@id="AccountFrm_address_2"]
    ${City_field}    Get Value    //*[@id="AccountFrm_city"]
    ${Region_tate_field}    Get Value    //*[@id="AccountFrm_zone_id"]
    ${ZIP_Code_field}    Get Value    //*[@id="AccountFrm_postcode"]
    ${Country_field}    Get Value    //*[@id="AccountFrm_country_id"]
    ${Login_name_field}    Get Value    //*[@id="AccountFrm_loginname"]
    Click Element    //*[@id="AccountFrm_newsletter1"]
    ${Password_field}    Get Value    //*[@id="AccountFrm_password"]
    Click Element    //*[@id="AccountFrm_agree"]
    ${Password_Confirm_field}    Get Value    //*[@id="AccountFrm_confirm"]
    #Kiểm tra các trường đã được điền chưa
    Should Be Equal    ${First_Name_field}    Huynh
    Should Be Equal As Strings    ${Last_Name_field}    Trinh
    Should Be Equal    ${E_Mail_field}    trinhtrinhhuynh4huynh2003@gmail.com
    Should Be Equal    ${Telephone_field}    0344171672
    Should Be Equal    ${Fax_field}    + 84 (8) 24567889
    Should Be Equal    ${Company_field}    Baa Baby
    Should Be Equal    ${Address_1_field}    Ấp Tân Thông 4, Xã Thanh Tân, Huyện Mỏ Cày Bắc, Tỉnh Bến Tre
    Should Be Equal    ${Address_2_field}    Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh
    Should Be Equal    ${City_field}    Hồ Chí Minh
    Should Be Equal    ${Region_tate_field}    3780
    Should Be Equal    ${ZIP_Code_field}    70000
    Should Be Equal    ${Country_field}    230
    Should Be Equal    ${Login_name_field}    trinhtrinhhuynh4
    Should Be Equal    ${Password_field}    ${EMPTY}
    Should Be Equal    ${Password_Confirm_field}    ${EMPTY}
    Close Browser
TC13: Trống Privacy Policy
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Click Element   ${Login_or_register} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Click Element   ${Continue}  
    Location Should Be    https://automationteststore.com/index.php?rt=account/create
     #Kiểm tra trường dữ liệu
    Page Should Contain Element    //*[@id="AccountFrm_firstname"]
    Page Should Contain Element    //*[@id="AccountFrm_lastname"]
    Page Should Contain Element    //*[@id="AccountFrm_email"]
    Page Should Contain Element    //*[@id="AccountFrm_fax"]
    Page Should Contain Element    //*[@id="AccountFrm_company"]
    Page Should Contain Element    //*[@id="AccountFrm_address_1"]
    Page Should Contain Element    //*[@id="AccountFrm_address_2"]
    Page Should Contain Element    //*[@id="AccountFrm_city"]
    Page Should Contain Element    //*[@id="AccountFrm_country_id"]
    Page Should Contain Element    //*[@id="AccountFrm_zone_id"]
    Page Should Contain Element    //*[@id="AccountFrm_postcode"]
    Page Should Contain Element    //*[@id="AccountFrm_loginname"]
    Page Should Contain Element    //*[@id="AccountFrm_password"]
    Page Should Contain Element    //*[@id="AccountFrm_confirm"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter1"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter0"]
    Page Should Contain Element    //*[@id="AccountFrm_agree"]
    Page Should Contain Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    #Nhập dữ liệu
    Input Text    //*[@id="AccountFrm_firstname"]    Huynh
    Input Text    //*[@id="AccountFrm_lastname"]    Trinh
    Input Text    //*[@id="AccountFrm_email"]    trinhtrinhhuynh4huynh2003@gmail.com
    Input Text    //*[@id="AccountFrm_telephone"]    0344171672
    Input Text    //*[@id="AccountFrm_fax"]    + 84 (8) 24567889
    Input Text    //*[@id="AccountFrm_company"]    Baa Baby
    Input Text    //*[@id="AccountFrm_address_1"]    Ấp Tân Thông 4, Xã Thanh Tân, Huyện Mỏ Cày Bắc, Tỉnh Bến Tre
    Input Text    //*[@id="AccountFrm_address_2"]    Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh
    Input Text    //*[@id="AccountFrm_city"]    Hồ Chí Minh
    Select From List By Value    //*[@id="AccountFrm_country_id"]    230
    Sleep    2s
    Select From List By Value    //*[@id="AccountFrm_zone_id"]    3780
    Input Text    //*[@id="AccountFrm_postcode"]    70000
    Input Text    //*[@id="AccountFrm_loginname"]    trinhtrinhhuynh4
    Input Password    //*[@id="AccountFrm_password"]    Trinh@2003
    Input Password    //*[@id="AccountFrm_confirm"]    Trinh@2003
    Click Element    //*[@id="AccountFrm_newsletter1"]
    #Nhấn Đăng ký
    Click Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    2s
    #get text Error empty
    ${err_account}    Get Text    xpath=//div[@class="alert alert-error alert-danger"]
    Should Contain    ${err_account}    You must agree to the Privacy Policy!
    #Get text err field
    ${First_Name_field}    Get Value    //*[@id="AccountFrm_firstname"]
    ${Last_Name_field}    Get Value    //*[@id="AccountFrm_lastname"]
    ${E_Mail_field}    Get Value    //*[@id="AccountFrm_email"]
    ${Telephone_field}    Get Value    //*[@id="AccountFrm_telephone"]
    ${Fax_field}    Get Value    //*[@id="AccountFrm_fax"]
    ${Company_field}    Get Value    //*[@id="AccountFrm_company"]
    ${Address_1_field}    Get Value    //*[@id="AccountFrm_address_1"]
    ${Address_2_field}    Get Value    //*[@id="AccountFrm_address_2"]
    ${City_field}    Get Value    //*[@id="AccountFrm_city"]
    ${Region_tate_field}    Get Value    //*[@id="AccountFrm_zone_id"]
    ${ZIP_Code_field}    Get Value    //*[@id="AccountFrm_postcode"]
    ${Country_field}    Get Value    //*[@id="AccountFrm_country_id"]
    ${Login_name_field}    Get Value    //*[@id="AccountFrm_loginname"]
    Click Element    //*[@id="AccountFrm_newsletter1"]
    ${Password_field}    Get Value    //*[@id="AccountFrm_password"]
    Click Element    //*[@id="AccountFrm_agree"]
    ${Password_Confirm_field}    Get Value    //*[@id="AccountFrm_confirm"]
    #Kiểm tra các trường đã được điền chưa
    Should Be Equal    ${First_Name_field}    Huynh
    Should Be Equal As Strings    ${Last_Name_field}    Trinh
    Should Be Equal    ${E_Mail_field}    trinhtrinhhuynh4huynh2003@gmail.com
    Should Be Equal    ${Telephone_field}    0344171672
    Should Be Equal    ${Fax_field}    + 84 (8) 24567889
    Should Be Equal    ${Company_field}    Baa Baby
    Should Be Equal    ${Address_1_field}    Ấp Tân Thông 4, Xã Thanh Tân, Huyện Mỏ Cày Bắc, Tỉnh Bến Tre
    Should Be Equal    ${Address_2_field}    Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh
    Should Be Equal    ${City_field}    Hồ Chí Minh
    Should Be Equal    ${Region_tate_field}    3780
    Should Be Equal    ${ZIP_Code_field}    70000
    Should Be Equal    ${Country_field}    230
    Should Be Equal    ${Login_name_field}    trinhtrinhhuynh4
    Should Be Equal    ${Password_field}    ${EMPTY}
    Should Be Equal    ${Password_Confirm_field}    ${EMPTY}
    Close Browser
TC14: Nhập firstname trên 32 kí tự
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Click Element   ${Login_or_register} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Click Element   ${Continue}  
    Location Should Be    https://automationteststore.com/index.php?rt=account/create
     #Kiểm tra trường dữ liệu
    Page Should Contain Element    //*[@id="AccountFrm_firstname"]
    Page Should Contain Element    //*[@id="AccountFrm_lastname"]
    Page Should Contain Element    //*[@id="AccountFrm_email"]
    Page Should Contain Element    //*[@id="AccountFrm_fax"]
    Page Should Contain Element    //*[@id="AccountFrm_company"]
    Page Should Contain Element    //*[@id="AccountFrm_address_1"]
    Page Should Contain Element    //*[@id="AccountFrm_address_2"]
    Page Should Contain Element    //*[@id="AccountFrm_city"]
    Page Should Contain Element    //*[@id="AccountFrm_country_id"]
    Page Should Contain Element    //*[@id="AccountFrm_zone_id"]
    Page Should Contain Element    //*[@id="AccountFrm_postcode"]
    Page Should Contain Element    //*[@id="AccountFrm_loginname"]
    Page Should Contain Element    //*[@id="AccountFrm_password"]
    Page Should Contain Element    //*[@id="AccountFrm_confirm"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter1"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter0"]
    Page Should Contain Element    //*[@id="AccountFrm_agree"]
    Page Should Contain Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    #Nhập dữ liệu
    Input Text    //*[@id="AccountFrm_firstname"]    Huynh Thi Mong Trinh chinh chinh ne Huynh Thi Mong Trinh  3131313131133133131
    Input Text    //*[@id="AccountFrm_lastname"]    Trinh
    Input Text    //*[@id="AccountFrm_email"]    trinhtrinhhuynh4huynh2003@gmail.com
    Input Text    //*[@id="AccountFrm_telephone"]    0344171672
    Input Text    //*[@id="AccountFrm_fax"]    + 84 (8) 24567889
    Input Text    //*[@id="AccountFrm_company"]    Baa Baby
    Input Text    //*[@id="AccountFrm_address_1"]    Ấp Tân Thông 4, Xã Thanh Tân, Huyện Mỏ Cày Bắc, Tỉnh Bến Tre
    Input Text    //*[@id="AccountFrm_address_2"]    Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh
    Input Text    //*[@id="AccountFrm_city"]    Hồ Chí Minh
    Select From List By Value    //*[@id="AccountFrm_country_id"]    230
    Sleep    2s
    Select From List By Value    //*[@id="AccountFrm_zone_id"]    3780
    Input Text    //*[@id="AccountFrm_postcode"]    70000
    Input Text    //*[@id="AccountFrm_loginname"]    trinhtrinhhuynh4
    Input Password    //*[@id="AccountFrm_password"]    Trinh@2003
    Input Password    //*[@id="AccountFrm_confirm"]    Trinh@2003
    Click Element    //*[@id="AccountFrm_newsletter1"]
    Click Element    //*[@id="AccountFrm_agree"]
    #Nhấn Đăng ký
    Click Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    2s
    #get text Error empty
    ${err_account}    Get Text    xpath=//div[@class="alert alert-error alert-danger"]
    ${First_Name}    Get Text    //*[@id="AccountFrm"]/div[1]/fieldset/div[1]/span
    
    Should Contain    ${err_account}    First Name must be between 1 and 32 characters!
    Should Be Equal    ${First_Name}    First Name must be between 1 and 32 characters!
    #Get text err field
    ${First_Name_field}    Get Value    //*[@id="AccountFrm_firstname"]
    ${Last_Name_field}    Get Value    //*[@id="AccountFrm_lastname"]
    ${E_Mail_field}    Get Value    //*[@id="AccountFrm_email"]
    ${Telephone_field}    Get Value    //*[@id="AccountFrm_telephone"]
    ${Fax_field}    Get Value    //*[@id="AccountFrm_fax"]
    ${Company_field}    Get Value    //*[@id="AccountFrm_company"]
    ${Address_1_field}    Get Value    //*[@id="AccountFrm_address_1"]
    ${Address_2_field}    Get Value    //*[@id="AccountFrm_address_2"]
    ${City_field}    Get Value    //*[@id="AccountFrm_city"]
    ${Region_tate_field}    Get Value    //*[@id="AccountFrm_zone_id"]
    ${ZIP_Code_field}    Get Value    //*[@id="AccountFrm_postcode"]
    ${Country_field}    Get Value    //*[@id="AccountFrm_country_id"]
    ${Login_name_field}    Get Value    //*[@id="AccountFrm_loginname"]
    Click Element    //*[@id="AccountFrm_newsletter1"]
    ${Password_field}    Get Value    //*[@id="AccountFrm_password"]
    Click Element    //*[@id="AccountFrm_agree"]
    ${Password_Confirm_field}    Get Value    //*[@id="AccountFrm_confirm"]
    #Kiểm tra các trường đã được điền chưa
    Should Be Equal    ${First_Name_field}    Huynh Thi Mong Trinh chinh chinh ne Huynh Thi Mong Trinh  3131313131133133131
    Should Be Equal As Strings    ${Last_Name_field}    Trinh
    Should Be Equal    ${E_Mail_field}    trinhtrinhhuynh4huynh2003@gmail.com
    Should Be Equal    ${Telephone_field}    0344171672
    Should Be Equal    ${Fax_field}    + 84 (8) 24567889
    Should Be Equal    ${Company_field}    Baa Baby
    Should Be Equal    ${Address_1_field}    Ấp Tân Thông 4, Xã Thanh Tân, Huyện Mỏ Cày Bắc, Tỉnh Bến Tre
    Should Be Equal    ${Address_2_field}    Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh
    Should Be Equal    ${City_field}    Hồ Chí Minh
    Should Be Equal    ${Region_tate_field}    3780
    Should Be Equal    ${ZIP_Code_field}    70000
    Should Be Equal    ${Country_field}    230
    Should Be Equal    ${Login_name_field}    trinhtrinhhuynh4
    Should Be Equal    ${Password_field}    ${EMPTY}
    Should Be Equal    ${Password_Confirm_field}    ${EMPTY}
    ${checked_yes}    Run Keyword And Return Status    Page Should Contain Element    //*[@id="AccountFrm"]/div[4]/fieldset/div/div
    Should Be True    ${checked_yes}
    ${checked_agree}    Run Keyword And Return Status    Page Should Contain Element    //*[@id="AccountFrm_agree"]
    Should Be True    ${checked_agree}
    Close Browser
TC15: Nhập lastname trên 32 kí tự
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Click Element   ${Login_or_register} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Click Element   ${Continue}  
    Location Should Be    https://automationteststore.com/index.php?rt=account/create
     #Kiểm tra trường dữ liệu
    Page Should Contain Element    //*[@id="AccountFrm_firstname"]
    Page Should Contain Element    //*[@id="AccountFrm_lastname"]
    Page Should Contain Element    //*[@id="AccountFrm_email"]
    Page Should Contain Element    //*[@id="AccountFrm_fax"]
    Page Should Contain Element    //*[@id="AccountFrm_company"]
    Page Should Contain Element    //*[@id="AccountFrm_address_1"]
    Page Should Contain Element    //*[@id="AccountFrm_address_2"]
    Page Should Contain Element    //*[@id="AccountFrm_city"]
    Page Should Contain Element    //*[@id="AccountFrm_country_id"]
    Page Should Contain Element    //*[@id="AccountFrm_zone_id"]
    Page Should Contain Element    //*[@id="AccountFrm_postcode"]
    Page Should Contain Element    //*[@id="AccountFrm_loginname"]
    Page Should Contain Element    //*[@id="AccountFrm_password"]
    Page Should Contain Element    //*[@id="AccountFrm_confirm"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter1"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter0"]
    Page Should Contain Element    //*[@id="AccountFrm_agree"]
    Page Should Contain Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    #Nhập dữ liệu
    Input Text    //*[@id="AccountFrm_firstname"]    Huynh
    Input Text    //*[@id="AccountFrm_lastname"]    Huynh Huynh HUynh Huynh Huynh Huynh Huynh Huynh
    Input Text    //*[@id="AccountFrm_email"]    trinhtrinhhuynh4huynh2003@gmail.com
    Input Text    //*[@id="AccountFrm_telephone"]    0344171672
    Input Text    //*[@id="AccountFrm_fax"]    + 84 (8) 24567889
    Input Text    //*[@id="AccountFrm_company"]    Baa Baby
    Input Text    //*[@id="AccountFrm_address_1"]    Ấp Tân Thông 4, Xã Thanh Tân, Huyện Mỏ Cày Bắc, Tỉnh Bến Tre
    Input Text    //*[@id="AccountFrm_address_2"]    Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh
    Input Text    //*[@id="AccountFrm_city"]    Hồ Chí Minh
    Select From List By Value    //*[@id="AccountFrm_country_id"]    230
    Sleep    2s
    Select From List By Value    //*[@id="AccountFrm_zone_id"]    3780
    Input Text    //*[@id="AccountFrm_postcode"]    70000
    Input Text    //*[@id="AccountFrm_loginname"]    trinhtrinhhuynh4
    Input Password    //*[@id="AccountFrm_password"]    Trinh@2003
    Input Password    //*[@id="AccountFrm_confirm"]    Trinh@2003
    Click Element    //*[@id="AccountFrm_newsletter1"]
    Click Element    //*[@id="AccountFrm_agree"]
    #Nhấn Đăng ký
    Click Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    2s
    #get text Error empty
    ${err_account}    Get Text    xpath=//div[@class="alert alert-error alert-danger"]
    ${Last_Name}    Get Text    //*[@id="AccountFrm"]/div[1]/fieldset/div[2]/span
    
    Should Contain    ${err_account}    Last Name must be between 1 and 32 characters!
    Should Be Equal    ${Last_Name}    Last Name must be between 1 and 32 characters!
    #Get text err field
    ${First_Name_field}    Get Value    //*[@id="AccountFrm_firstname"]
    ${Last_Name_field}    Get Value    //*[@id="AccountFrm_lastname"]
    ${E_Mail_field}    Get Value    //*[@id="AccountFrm_email"]
    ${Telephone_field}    Get Value    //*[@id="AccountFrm_telephone"]
    ${Fax_field}    Get Value    //*[@id="AccountFrm_fax"]
    ${Company_field}    Get Value    //*[@id="AccountFrm_company"]
    ${Address_1_field}    Get Value    //*[@id="AccountFrm_address_1"]
    ${Address_2_field}    Get Value    //*[@id="AccountFrm_address_2"]
    ${City_field}    Get Value    //*[@id="AccountFrm_city"]
    ${Region_tate_field}    Get Value    //*[@id="AccountFrm_zone_id"]
    ${ZIP_Code_field}    Get Value    //*[@id="AccountFrm_postcode"]
    ${Country_field}    Get Value    //*[@id="AccountFrm_country_id"]
    ${Login_name_field}    Get Value    //*[@id="AccountFrm_loginname"]
    Click Element    //*[@id="AccountFrm_newsletter1"]
    ${Password_field}    Get Value    //*[@id="AccountFrm_password"]
    Click Element    //*[@id="AccountFrm_agree"]
    ${Password_Confirm_field}    Get Value    //*[@id="AccountFrm_confirm"]
    #Kiểm tra các trường đã được điền chưa
    Should Be Equal    ${First_Name_field}    Huynh
    Should Be Equal As Strings    ${Last_Name_field}    Huynh Huynh HUynh Huynh Huynh Huynh Huynh Huynh
    Should Be Equal    ${E_Mail_field}    trinhtrinhhuynh4huynh2003@gmail.com
    Should Be Equal    ${Telephone_field}    0344171672
    Should Be Equal    ${Fax_field}    + 84 (8) 24567889
    Should Be Equal    ${Company_field}    Baa Baby
    Should Be Equal    ${Address_1_field}    Ấp Tân Thông 4, Xã Thanh Tân, Huyện Mỏ Cày Bắc, Tỉnh Bến Tre
    Should Be Equal    ${Address_2_field}    Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh
    Should Be Equal    ${City_field}    Hồ Chí Minh
    Should Be Equal    ${Region_tate_field}    3780
    Should Be Equal    ${ZIP_Code_field}    70000
    Should Be Equal    ${Country_field}    230
    Should Be Equal    ${Login_name_field}    trinhtrinhhuynh4
    Should Be Equal    ${Password_field}    ${EMPTY}
    Should Be Equal    ${Password_Confirm_field}    ${EMPTY}
    Close Browser
TC16: Sai định dạng Email
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Click Element   ${Login_or_register} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Click Element   ${Continue}  
    Location Should Be    https://automationteststore.com/index.php?rt=account/create
     #Kiểm tra trường dữ liệu
    Page Should Contain Element    //*[@id="AccountFrm_firstname"]
    Page Should Contain Element    //*[@id="AccountFrm_lastname"]
    Page Should Contain Element    //*[@id="AccountFrm_email"]
    Page Should Contain Element    //*[@id="AccountFrm_fax"]
    Page Should Contain Element    //*[@id="AccountFrm_company"]
    Page Should Contain Element    //*[@id="AccountFrm_address_1"]
    Page Should Contain Element    //*[@id="AccountFrm_address_2"]
    Page Should Contain Element    //*[@id="AccountFrm_city"]
    Page Should Contain Element    //*[@id="AccountFrm_country_id"]
    Page Should Contain Element    //*[@id="AccountFrm_zone_id"]
    Page Should Contain Element    //*[@id="AccountFrm_postcode"]
    Page Should Contain Element    //*[@id="AccountFrm_loginname"]
    Page Should Contain Element    //*[@id="AccountFrm_password"]
    Page Should Contain Element    //*[@id="AccountFrm_confirm"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter1"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter0"]
    Page Should Contain Element    //*[@id="AccountFrm_agree"]
    Page Should Contain Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    #Nhập dữ liệu
    Input Text    //*[@id="AccountFrm_firstname"]    Huynh
    Input Text    //*[@id="AccountFrm_lastname"]    Trinh
    Input Text    //*[@id="AccountFrm_email"]    trinhhuynh2003
    Input Text    //*[@id="AccountFrm_telephone"]    0344171672
    Input Text    //*[@id="AccountFrm_fax"]    + 84 (8) 24567889
    Input Text    //*[@id="AccountFrm_company"]    Baa Baby
    Input Text    //*[@id="AccountFrm_address_1"]    Ấp Tân Thông 4, Xã Thanh Tân, Huyện Mỏ Cày Bắc, Tỉnh Bến Tre
    Input Text    //*[@id="AccountFrm_address_2"]    Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh
    Input Text    //*[@id="AccountFrm_city"]    Hồ Chí Minh
    Select From List By Value    //*[@id="AccountFrm_country_id"]    230
    Sleep    2s
    Select From List By Value    //*[@id="AccountFrm_zone_id"]    3780
    Input Text    //*[@id="AccountFrm_postcode"]    70000
    Input Text    //*[@id="AccountFrm_loginname"]    trinhtrinhhuynh4
    Input Password    //*[@id="AccountFrm_password"]    Trinh@2003
    Input Password    //*[@id="AccountFrm_confirm"]    Trinh@2003
    Click Element    //*[@id="AccountFrm_newsletter1"]
    Click Element    //*[@id="AccountFrm_agree"]
    #Nhấn Đăng ký
    Click Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    2s
    #get text Error empty
    ${err_account}    Get Text    xpath=//div[@class="alert alert-error alert-danger"]
    ${E_Mail}    Get Text    //*[@id="AccountFrm"]/div[1]/fieldset/div[3]/span
    
    Should Contain    ${err_account}    Email Address does not appear to be valid!
    Should Be Equal    ${E_Mail}    Email Address does not appear to be valid!
    #Get text err field
    ${First_Name_field}    Get Value    //*[@id="AccountFrm_firstname"]
    ${Last_Name_field}    Get Value    //*[@id="AccountFrm_lastname"]
    ${E_Mail_field}    Get Value    //*[@id="AccountFrm_email"]
    ${Telephone_field}    Get Value    //*[@id="AccountFrm_telephone"]
    ${Fax_field}    Get Value    //*[@id="AccountFrm_fax"]
    ${Company_field}    Get Value    //*[@id="AccountFrm_company"]
    ${Address_1_field}    Get Value    //*[@id="AccountFrm_address_1"]
    ${Address_2_field}    Get Value    //*[@id="AccountFrm_address_2"]
    ${City_field}    Get Value    //*[@id="AccountFrm_city"]
    ${Region_tate_field}    Get Value    //*[@id="AccountFrm_zone_id"]
    ${ZIP_Code_field}    Get Value    //*[@id="AccountFrm_postcode"]
    ${Country_field}    Get Value    //*[@id="AccountFrm_country_id"]
    ${Login_name_field}    Get Value    //*[@id="AccountFrm_loginname"]
    Click Element    //*[@id="AccountFrm_newsletter1"]
    ${Password_field}    Get Value    //*[@id="AccountFrm_password"]
    Click Element    //*[@id="AccountFrm_agree"]
    ${Password_Confirm_field}    Get Value    //*[@id="AccountFrm_confirm"]
    #Kiểm tra các trường đã được điền chưa
    Should Be Equal    ${First_Name_field}    Huynh
    Should Be Equal As Strings    ${Last_Name_field}    Trinh
    Should Be Equal    ${E_Mail_field}    trinhhuynh2003
    Should Be Equal    ${Telephone_field}    0344171672
    Should Be Equal    ${Fax_field}    + 84 (8) 24567889
    Should Be Equal    ${Company_field}    Baa Baby
    Should Be Equal    ${Address_1_field}    Ấp Tân Thông 4, Xã Thanh Tân, Huyện Mỏ Cày Bắc, Tỉnh Bến Tre
    Should Be Equal    ${Address_2_field}    Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh
    Should Be Equal    ${City_field}    Hồ Chí Minh
    Should Be Equal    ${Region_tate_field}    3780
    Should Be Equal    ${ZIP_Code_field}    70000
    Should Be Equal    ${Country_field}    230
    Should Be Equal    ${Login_name_field}    trinhtrinhhuynh4
    Should Be Equal    ${Password_field}    ${EMPTY}
    Should Be Equal    ${Password_Confirm_field}    ${EMPTY}
    ${checked_yes}    Run Keyword And Return Status    Page Should Contain Element    //*[@id="AccountFrm"]/div[4]/fieldset/div/div
    Should Be True    ${checked_yes}
    ${checked_agree}    Run Keyword And Return Status    Page Should Contain Element    //*[@id="AccountFrm_agree"]
    Should Be True    ${checked_agree}
    Close Browser
TC17: Nhập Email dã được đăng ký
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Click Element   ${Login_or_register} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Click Element   ${Continue}  
    Location Should Be    https://automationteststore.com/index.php?rt=account/create
     #Kiểm tra trường dữ liệu
    Page Should Contain Element    //*[@id="AccountFrm_firstname"]
    Page Should Contain Element    //*[@id="AccountFrm_lastname"]
    Page Should Contain Element    //*[@id="AccountFrm_email"]
    Page Should Contain Element    //*[@id="AccountFrm_fax"]
    Page Should Contain Element    //*[@id="AccountFrm_company"]
    Page Should Contain Element    //*[@id="AccountFrm_address_1"]
    Page Should Contain Element    //*[@id="AccountFrm_address_2"]
    Page Should Contain Element    //*[@id="AccountFrm_city"]
    Page Should Contain Element    //*[@id="AccountFrm_country_id"]
    Page Should Contain Element    //*[@id="AccountFrm_zone_id"]
    Page Should Contain Element    //*[@id="AccountFrm_postcode"]
    Page Should Contain Element    //*[@id="AccountFrm_loginname"]
    Page Should Contain Element    //*[@id="AccountFrm_password"]
    Page Should Contain Element    //*[@id="AccountFrm_confirm"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter1"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter0"]
    Page Should Contain Element    //*[@id="AccountFrm_agree"]
    Page Should Contain Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    #Nhập dữ liệu
    Input Text    //*[@id="AccountFrm_firstname"]    Huynh
    Input Text    //*[@id="AccountFrm_lastname"]    Trinh
    Input Text    //*[@id="AccountFrm_email"]    mongtrinhhuynh313@gmail.com
    Input Text    //*[@id="AccountFrm_telephone"]    0344171672
    Input Text    //*[@id="AccountFrm_fax"]    + 84 (8) 24567889
    Input Text    //*[@id="AccountFrm_company"]    Baa Baby
    Input Text    //*[@id="AccountFrm_address_1"]    Ấp Tân Thông 4, Xã Thanh Tân, Huyện Mỏ Cày Bắc, Tỉnh Bến Tre
    Input Text    //*[@id="AccountFrm_address_2"]    Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh
    Input Text    //*[@id="AccountFrm_city"]    Hồ Chí Minh
    Select From List By Value    //*[@id="AccountFrm_country_id"]    230
    Sleep    2s
    Select From List By Value    //*[@id="AccountFrm_zone_id"]    3780
    Input Text    //*[@id="AccountFrm_postcode"]    70000
    Input Text    //*[@id="AccountFrm_loginname"]    trinhhalo
    Input Password    //*[@id="AccountFrm_password"]    Trinh@2003
    Input Password    //*[@id="AccountFrm_confirm"]    Trinh@2003
    Click Element    //*[@id="AccountFrm_newsletter1"]
    Click Element    //*[@id="AccountFrm_agree"]
    #Nhấn Đăng ký
    Click Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    2s
    #get text Error empty
    ${err_account}    Get Text    xpath=//div[@class="alert alert-error alert-danger"]
    #${E_Mail}    Get Text    //*[@id="AccountFrm"]/div[1]/fieldset/div[3]/span
    
    Should Contain    ${err_account}    E-Mail Address is already registered!
    #Should Be Equal    ${E_Mail}    Email Address does not appear to be valid!
    #Get text err field
    ${First_Name_field}    Get Value    //*[@id="AccountFrm_firstname"]
    ${Last_Name_field}    Get Value    //*[@id="AccountFrm_lastname"]
    ${E_Mail_field}    Get Value    //*[@id="AccountFrm_email"]
    ${Telephone_field}    Get Value    //*[@id="AccountFrm_telephone"]
    ${Fax_field}    Get Value    //*[@id="AccountFrm_fax"]
    ${Company_field}    Get Value    //*[@id="AccountFrm_company"]
    ${Address_1_field}    Get Value    //*[@id="AccountFrm_address_1"]
    ${Address_2_field}    Get Value    //*[@id="AccountFrm_address_2"]
    ${City_field}    Get Value    //*[@id="AccountFrm_city"]
    ${Region_tate_field}    Get Value    //*[@id="AccountFrm_zone_id"]
    ${ZIP_Code_field}    Get Value    //*[@id="AccountFrm_postcode"]
    ${Country_field}    Get Value    //*[@id="AccountFrm_country_id"]
    ${Login_name_field}    Get Value    //*[@id="AccountFrm_loginname"]
    Click Element    //*[@id="AccountFrm_newsletter1"]
    ${Password_field}    Get Value    //*[@id="AccountFrm_password"]
    Click Element    //*[@id="AccountFrm_agree"]
    ${Password_Confirm_field}    Get Value    //*[@id="AccountFrm_confirm"]
    #Kiểm tra các trường đã được điền chưa
    Should Be Equal    ${First_Name_field}    Huynh
    Should Be Equal As Strings    ${Last_Name_field}    Trinh
    Should Be Equal    ${E_Mail_field}    mongtrinhhuynh313@gmail.com
    Should Be Equal    ${Telephone_field}    0344171672
    Should Be Equal    ${Fax_field}    + 84 (8) 24567889
    Should Be Equal    ${Company_field}    Baa Baby
    Should Be Equal    ${Address_1_field}    Ấp Tân Thông 4, Xã Thanh Tân, Huyện Mỏ Cày Bắc, Tỉnh Bến Tre
    Should Be Equal    ${Address_2_field}    Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh
    Should Be Equal    ${City_field}    Hồ Chí Minh
    Should Be Equal    ${Region_tate_field}    3780
    Should Be Equal    ${ZIP_Code_field}    70000
    Should Be Equal    ${Country_field}    230
    Should Be Equal    ${Login_name_field}    trinhhalo
    Should Be Equal    ${Password_field}    ${EMPTY}
    Should Be Equal    ${Password_Confirm_field}    ${EMPTY}
    ${checked_yes}    Run Keyword And Return Status    Page Should Contain Element    //*[@id="AccountFrm"]/div[4]/fieldset/div/div
    Should Be True    ${checked_yes}
    ${checked_agree}    Run Keyword And Return Status    Page Should Contain Element    //*[@id="AccountFrm_agree"]
    Should Be True    ${checked_agree}
    Close Browser
TC18: Nhập Email là số
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Click Element   ${Login_or_register} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Click Element   ${Continue}  
    Location Should Be    https://automationteststore.com/index.php?rt=account/create
     #Kiểm tra trường dữ liệu
    Page Should Contain Element    //*[@id="AccountFrm_firstname"]
    Page Should Contain Element    //*[@id="AccountFrm_lastname"]
    Page Should Contain Element    //*[@id="AccountFrm_email"]
    Page Should Contain Element    //*[@id="AccountFrm_fax"]
    Page Should Contain Element    //*[@id="AccountFrm_company"]
    Page Should Contain Element    //*[@id="AccountFrm_address_1"]
    Page Should Contain Element    //*[@id="AccountFrm_address_2"]
    Page Should Contain Element    //*[@id="AccountFrm_city"]
    Page Should Contain Element    //*[@id="AccountFrm_country_id"]
    Page Should Contain Element    //*[@id="AccountFrm_zone_id"]
    Page Should Contain Element    //*[@id="AccountFrm_postcode"]
    Page Should Contain Element    //*[@id="AccountFrm_loginname"]
    Page Should Contain Element    //*[@id="AccountFrm_password"]
    Page Should Contain Element    //*[@id="AccountFrm_confirm"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter1"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter0"]
    Page Should Contain Element    //*[@id="AccountFrm_agree"]
    Page Should Contain Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    #Nhập dữ liệu
    Input Text    //*[@id="AccountFrm_firstname"]    Huynh
    Input Text    //*[@id="AccountFrm_lastname"]    Trinh
    Input Text    //*[@id="AccountFrm_email"]    1111111111
    Input Text    //*[@id="AccountFrm_telephone"]    0344171672
    Input Text    //*[@id="AccountFrm_fax"]    + 84 (8) 24567889
    Input Text    //*[@id="AccountFrm_company"]    Baa Baby
    Input Text    //*[@id="AccountFrm_address_1"]    Ấp Tân Thông 4, Xã Thanh Tân, Huyện Mỏ Cày Bắc, Tỉnh Bến Tre
    Input Text    //*[@id="AccountFrm_address_2"]    Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh
    Input Text    //*[@id="AccountFrm_city"]    Hồ Chí Minh
    Select From List By Value    //*[@id="AccountFrm_country_id"]    230
    Sleep    2s
    Select From List By Value    //*[@id="AccountFrm_zone_id"]    3780
    Input Text    //*[@id="AccountFrm_postcode"]    70000
    Input Text    //*[@id="AccountFrm_loginname"]    trinhtrinhhuynh4
    Input Password    //*[@id="AccountFrm_password"]    Trinh@2003
    Input Password    //*[@id="AccountFrm_confirm"]    Trinh@2003
    Click Element    //*[@id="AccountFrm_newsletter1"]
    Click Element    //*[@id="AccountFrm_agree"]
    #Nhấn Đăng ký
    Click Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    2s
    #get text Error empty
    ${err_account}    Get Text    xpath=//div[@class="alert alert-error alert-danger"]
    ${E_Mail}    Get Text    //*[@id="AccountFrm"]/div[1]/fieldset/div[3]/span
    
    Should Contain    ${err_account}    Email Address does not appear to be valid!
    Should Be Equal    ${E_Mail}    Email Address does not appear to be valid!
    #Get text err field
    ${First_Name_field}    Get Value    //*[@id="AccountFrm_firstname"]
    ${Last_Name_field}    Get Value    //*[@id="AccountFrm_lastname"]
    ${E_Mail_field}    Get Value    //*[@id="AccountFrm_email"]
    ${Telephone_field}    Get Value    //*[@id="AccountFrm_telephone"]
    ${Fax_field}    Get Value    //*[@id="AccountFrm_fax"]
    ${Company_field}    Get Value    //*[@id="AccountFrm_company"]
    ${Address_1_field}    Get Value    //*[@id="AccountFrm_address_1"]
    ${Address_2_field}    Get Value    //*[@id="AccountFrm_address_2"]
    ${City_field}    Get Value    //*[@id="AccountFrm_city"]
    ${Region_tate_field}    Get Value    //*[@id="AccountFrm_zone_id"]
    ${ZIP_Code_field}    Get Value    //*[@id="AccountFrm_postcode"]
    ${Country_field}    Get Value    //*[@id="AccountFrm_country_id"]
    ${Login_name_field}    Get Value    //*[@id="AccountFrm_loginname"]
    Click Element    //*[@id="AccountFrm_newsletter1"]
    ${Password_field}    Get Value    //*[@id="AccountFrm_password"]
    Click Element    //*[@id="AccountFrm_agree"]
    ${Password_Confirm_field}    Get Value    //*[@id="AccountFrm_confirm"]
    #Kiểm tra các trường đã được điền chưa
    Should Be Equal    ${First_Name_field}    Huynh
    Should Be Equal As Strings    ${Last_Name_field}    Trinh
    Should Be Equal    ${E_Mail_field}    1111111111
    Should Be Equal    ${Telephone_field}    0344171672
    Should Be Equal    ${Fax_field}    + 84 (8) 24567889
    Should Be Equal    ${Company_field}    Baa Baby
    Should Be Equal    ${Address_1_field}    Ấp Tân Thông 4, Xã Thanh Tân, Huyện Mỏ Cày Bắc, Tỉnh Bến Tre
    Should Be Equal    ${Address_2_field}    Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh
    Should Be Equal    ${City_field}    Hồ Chí Minh
    Should Be Equal    ${Region_tate_field}    3780
    Should Be Equal    ${ZIP_Code_field}    70000
    Should Be Equal    ${Country_field}    230
    Should Be Equal    ${Login_name_field}    trinhtrinhhuynh4
    Should Be Equal    ${Password_field}    ${EMPTY}
    Should Be Equal    ${Password_Confirm_field}    ${EMPTY}
    ${checked_yes}    Run Keyword And Return Status    Page Should Contain Element    //*[@id="AccountFrm"]/div[4]/fieldset/div/div
    Should Be True    ${checked_yes}
    ${checked_agree}    Run Keyword And Return Status    Page Should Contain Element    //*[@id="AccountFrm_agree"]
    Should Be True    ${checked_agree}
    Close Browser
TC19: Nhập địa chỉ 1 trên 128 ký tự
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Click Element   ${Login_or_register} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Click Element   ${Continue}  
    Location Should Be    https://automationteststore.com/index.php?rt=account/create
     #Kiểm tra trường dữ liệu
    Page Should Contain Element    //*[@id="AccountFrm_firstname"]
    Page Should Contain Element    //*[@id="AccountFrm_lastname"]
    Page Should Contain Element    //*[@id="AccountFrm_email"]
    Page Should Contain Element    //*[@id="AccountFrm_fax"]
    Page Should Contain Element    //*[@id="AccountFrm_company"]
    Page Should Contain Element    //*[@id="AccountFrm_address_1"]
    Page Should Contain Element    //*[@id="AccountFrm_address_2"]
    Page Should Contain Element    //*[@id="AccountFrm_city"]
    Page Should Contain Element    //*[@id="AccountFrm_country_id"]
    Page Should Contain Element    //*[@id="AccountFrm_zone_id"]
    Page Should Contain Element    //*[@id="AccountFrm_postcode"]
    Page Should Contain Element    //*[@id="AccountFrm_loginname"]
    Page Should Contain Element    //*[@id="AccountFrm_password"]
    Page Should Contain Element    //*[@id="AccountFrm_confirm"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter1"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter0"]
    Page Should Contain Element    //*[@id="AccountFrm_agree"]
    Page Should Contain Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    #Nhập dữ liệu
    Input Text    //*[@id="AccountFrm_firstname"]    Huynh
    Input Text    //*[@id="AccountFrm_lastname"]    Trinh
    Input Text    //*[@id="AccountFrm_email"]    trinhtrinhhuynh4huynh2003@gmail.com
    Input Text    //*[@id="AccountFrm_telephone"]    0344171672
    Input Text    //*[@id="AccountFrm_fax"]    + 84 (8) 24567889
    Input Text    //*[@id="AccountFrm_company"]    Baa Baby
    Input Text    //*[@id="AccountFrm_address_1"]    Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh
    Input Text    //*[@id="AccountFrm_address_2"]    Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh
    Input Text    //*[@id="AccountFrm_city"]    Hồ Chí Minh
    Select From List By Value    //*[@id="AccountFrm_country_id"]    230
    Sleep    2s
    Select From List By Value    //*[@id="AccountFrm_zone_id"]    3780
    Input Text    //*[@id="AccountFrm_postcode"]    70000
    Input Text    //*[@id="AccountFrm_loginname"]    trinhtrinhhuynh4
    Input Password    //*[@id="AccountFrm_password"]    Trinh@2003
    Input Password    //*[@id="AccountFrm_confirm"]    Trinh@2003
    Click Element    //*[@id="AccountFrm_newsletter1"]
    Click Element    //*[@id="AccountFrm_agree"]
    #Nhấn Đăng ký
    Click Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    2s
    #get text Error empty
    ${err_account}    Get Text    xpath=//div[@class="alert alert-error alert-danger"]
    ${Address_1}    Get Text    //*[@id="AccountFrm"]/div[2]/fieldset/div[2]/span
    
    Should Contain    ${err_account}    Address 1 must be between 3 and 128 characters!
    Should Be Equal    ${Address_1}    Address 1 must be between 3 and 128 characters!
    #Get text err field
    ${First_Name_field}    Get Value    //*[@id="AccountFrm_firstname"]
    ${Last_Name_field}    Get Value    //*[@id="AccountFrm_lastname"]
    ${E_Mail_field}    Get Value    //*[@id="AccountFrm_email"]
    ${Telephone_field}    Get Value    //*[@id="AccountFrm_telephone"]
    ${Fax_field}    Get Value    //*[@id="AccountFrm_fax"]
    ${Company_field}    Get Value    //*[@id="AccountFrm_company"]
    ${Address_1_field}    Get Value    //*[@id="AccountFrm_address_1"]
    ${Address_2_field}    Get Value    //*[@id="AccountFrm_address_2"]
    ${City_field}    Get Value    //*[@id="AccountFrm_city"]
    ${Region_tate_field}    Get Value    //*[@id="AccountFrm_zone_id"]
    ${ZIP_Code_field}    Get Value    //*[@id="AccountFrm_postcode"]
    ${Country_field}    Get Value    //*[@id="AccountFrm_country_id"]
    ${Login_name_field}    Get Value    //*[@id="AccountFrm_loginname"]
    Click Element    //*[@id="AccountFrm_newsletter1"]
    ${Password_field}    Get Value    //*[@id="AccountFrm_password"]
    Click Element    //*[@id="AccountFrm_agree"]
    ${Password_Confirm_field}    Get Value    //*[@id="AccountFrm_confirm"]
    #Kiểm tra các trường đã được điền chưa
    Should Be Equal    ${First_Name_field}    Huynh
    Should Be Equal As Strings    ${Last_Name_field}    Trinh
    Should Be Equal    ${E_Mail_field}    trinhtrinhhuynh4huynh2003@gmail.com
    Should Be Equal    ${Telephone_field}    0344171672
    Should Be Equal    ${Fax_field}    + 84 (8) 24567889
    Should Be Equal    ${Company_field}    Baa Baby
    Should Be Equal    ${Address_1_field}    Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh
    Should Be Equal    ${Address_2_field}    Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh
    Should Be Equal    ${City_field}    Hồ Chí Minh
    Should Be Equal    ${Region_tate_field}    3780
    Should Be Equal    ${ZIP_Code_field}    70000
    Should Be Equal    ${Country_field}    230
    Should Be Equal    ${Login_name_field}    trinhtrinhhuynh4
    Should Be Equal    ${Password_field}    ${EMPTY}
    Should Be Equal    ${Password_Confirm_field}    ${EMPTY}
    Close Browser
TC20: Nhập địa chỉ 1 dưới 2 ký tự
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Click Element   ${Login_or_register} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Click Element   ${Continue}  
    Location Should Be    https://automationteststore.com/index.php?rt=account/create
     #Kiểm tra trường dữ liệu
    Page Should Contain Element    //*[@id="AccountFrm_firstname"]
    Page Should Contain Element    //*[@id="AccountFrm_lastname"]
    Page Should Contain Element    //*[@id="AccountFrm_email"]
    Page Should Contain Element    //*[@id="AccountFrm_fax"]
    Page Should Contain Element    //*[@id="AccountFrm_company"]
    Page Should Contain Element    //*[@id="AccountFrm_address_1"]
    Page Should Contain Element    //*[@id="AccountFrm_address_2"]
    Page Should Contain Element    //*[@id="AccountFrm_city"]
    Page Should Contain Element    //*[@id="AccountFrm_country_id"]
    Page Should Contain Element    //*[@id="AccountFrm_zone_id"]
    Page Should Contain Element    //*[@id="AccountFrm_postcode"]
    Page Should Contain Element    //*[@id="AccountFrm_loginname"]
    Page Should Contain Element    //*[@id="AccountFrm_password"]
    Page Should Contain Element    //*[@id="AccountFrm_confirm"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter1"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter0"]
    Page Should Contain Element    //*[@id="AccountFrm_agree"]
    Page Should Contain Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    #Nhập dữ liệu
    Input Text    //*[@id="AccountFrm_firstname"]    Huynh
    Input Text    //*[@id="AccountFrm_lastname"]    Trinh
    Input Text    //*[@id="AccountFrm_email"]    trinhtrinhhuynh4huynh2003@gmail.com
    Input Text    //*[@id="AccountFrm_telephone"]    0344171672
    Input Text    //*[@id="AccountFrm_fax"]    + 84 (8) 24567889
    Input Text    //*[@id="AccountFrm_company"]    Baa Baby
    Input Text    //*[@id="AccountFrm_address_1"]    t 
    Input Text    //*[@id="AccountFrm_address_2"]    Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh
    Input Text    //*[@id="AccountFrm_city"]    Hồ Chí Minh
    Select From List By Value    //*[@id="AccountFrm_country_id"]    230
    Sleep    2s
    Select From List By Value    //*[@id="AccountFrm_zone_id"]    3780
    Input Text    //*[@id="AccountFrm_postcode"]    70000
    Input Text    //*[@id="AccountFrm_loginname"]    trinhtrinhhuynh4
    Input Password    //*[@id="AccountFrm_password"]    Trinh@2003
    Input Password    //*[@id="AccountFrm_confirm"]    Trinh@2003
    Click Element    //*[@id="AccountFrm_newsletter1"]
    Click Element    //*[@id="AccountFrm_agree"]
    #Nhấn Đăng ký
    Click Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    2s
    #get text Error empty
    ${err_account}    Get Text    xpath=//div[@class="alert alert-error alert-danger"]
    ${Address_1}    Get Text    //*[@id="AccountFrm"]/div[2]/fieldset/div[2]/span
    
    Should Contain    ${err_account}    Address 1 must be between 3 and 128 characters!
    Should Be Equal    ${Address_1}    Address 1 must be between 3 and 128 characters!
    #Get text err field
    ${First_Name_field}    Get Value    //*[@id="AccountFrm_firstname"]
    ${Last_Name_field}    Get Value    //*[@id="AccountFrm_lastname"]
    ${E_Mail_field}    Get Value    //*[@id="AccountFrm_email"]
    ${Telephone_field}    Get Value    //*[@id="AccountFrm_telephone"]
    ${Fax_field}    Get Value    //*[@id="AccountFrm_fax"]
    ${Company_field}    Get Value    //*[@id="AccountFrm_company"]
    ${Address_1_field}    Get Value    //*[@id="AccountFrm_address_1"]
    ${Address_2_field}    Get Value    //*[@id="AccountFrm_address_2"]
    ${City_field}    Get Value    //*[@id="AccountFrm_city"]
    ${Region_tate_field}    Get Value    //*[@id="AccountFrm_zone_id"]
    ${ZIP_Code_field}    Get Value    //*[@id="AccountFrm_postcode"]
    ${Country_field}    Get Value    //*[@id="AccountFrm_country_id"]
    ${Login_name_field}    Get Value    //*[@id="AccountFrm_loginname"]
    Click Element    //*[@id="AccountFrm_newsletter1"]
    ${Password_field}    Get Value    //*[@id="AccountFrm_password"]
    Click Element    //*[@id="AccountFrm_agree"]
    ${Password_Confirm_field}    Get Value    //*[@id="AccountFrm_confirm"]
    #Kiểm tra các trường đã được điền chưa
    Should Be Equal    ${First_Name_field}    Huynh
    Should Be Equal As Strings    ${Last_Name_field}    Trinh
    Should Be Equal    ${E_Mail_field}    trinhtrinhhuynh4huynh2003@gmail.com
    Should Be Equal    ${Telephone_field}    0344171672
    Should Be Equal    ${Fax_field}    + 84 (8) 24567889
    Should Be Equal    ${Company_field}    Baa Baby
    Should Be Equal    ${Address_1_field}    t
    Should Be Equal    ${Address_2_field}    Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh
    Should Be Equal    ${City_field}    Hồ Chí Minh
    Should Be Equal    ${Region_tate_field}    3780
    Should Be Equal    ${ZIP_Code_field}    70000
    Should Be Equal    ${Country_field}    230
    Should Be Equal    ${Login_name_field}    trinhtrinhhuynh4
    Should Be Equal    ${Password_field}    ${EMPTY}
    Should Be Equal    ${Password_Confirm_field}    ${EMPTY}
    Close Browser

TC21: Nhập City dưới 3 ký tự
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Click Element   ${Login_or_register} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Click Element   ${Continue}  
    Location Should Be    https://automationteststore.com/index.php?rt=account/create
     #Kiểm tra trường dữ liệu
    Page Should Contain Element    //*[@id="AccountFrm_firstname"]
    Page Should Contain Element    //*[@id="AccountFrm_lastname"]
    Page Should Contain Element    //*[@id="AccountFrm_email"]
    Page Should Contain Element    //*[@id="AccountFrm_fax"]
    Page Should Contain Element    //*[@id="AccountFrm_company"]
    Page Should Contain Element    //*[@id="AccountFrm_address_1"]
    Page Should Contain Element    //*[@id="AccountFrm_address_2"]
    Page Should Contain Element    //*[@id="AccountFrm_city"]
    Page Should Contain Element    //*[@id="AccountFrm_country_id"]
    Page Should Contain Element    //*[@id="AccountFrm_zone_id"]
    Page Should Contain Element    //*[@id="AccountFrm_postcode"]
    Page Should Contain Element    //*[@id="AccountFrm_loginname"]
    Page Should Contain Element    //*[@id="AccountFrm_password"]
    Page Should Contain Element    //*[@id="AccountFrm_confirm"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter1"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter0"]
    Page Should Contain Element    //*[@id="AccountFrm_agree"]
    Page Should Contain Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    #Nhập dữ liệu
    Input Text    //*[@id="AccountFrm_firstname"]    Huynh
    Input Text    //*[@id="AccountFrm_lastname"]    Trinh
    Input Text    //*[@id="AccountFrm_email"]    trinhtrinhhuynh4huynh2003@gmail.com
    Input Text    //*[@id="AccountFrm_telephone"]    0344171672
    Input Text    //*[@id="AccountFrm_fax"]    + 84 (8) 24567889
    Input Text    //*[@id="AccountFrm_company"]    Baa Baby
    Input Text    //*[@id="AccountFrm_address_1"]    Ấp Tân Thông 4, Xã Thanh Tân, Huyện Mỏ Cày Bắc, Tỉnh Bến Tre
    Input Text    //*[@id="AccountFrm_address_2"]    Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh
    Input Text    //*[@id="AccountFrm_city"]    sdfh djfaj Ấp Tân Thông 4, Xã Thanh Tân, Huyện Mỏ Cày Bắc, Tỉnh Bến Tre Ấp Tân Thông 4, Xã Thanh Tân, Huyện Mỏ Cày Bắc, Tỉnh Bến Tre Ấp Tân Thông 4, Xã Thanh Tân, Huyện Mỏ Cày Bắc, Tỉnh Bến Tre Ấp Tân Thông 4, Xã Thanh Tân, Huyện Mỏ Cày Bắc, Tỉnh Bến Tre Ấp Tân Thông 4, Xã Thanh Tân, Huyện Mỏ Cày Bắc, Tỉnh Bến Tre
    Select From List By Value    //*[@id="AccountFrm_country_id"]    230
    Sleep    2s
    Select From List By Value    //*[@id="AccountFrm_zone_id"]    3780
    Input Text    //*[@id="AccountFrm_postcode"]    70000
    Input Text    //*[@id="AccountFrm_loginname"]    trinhtrinhhuynh4
    Input Password    //*[@id="AccountFrm_password"]    Trinh@2003
    Input Password    //*[@id="AccountFrm_confirm"]    Trinh@2003
    Click Element    //*[@id="AccountFrm_newsletter1"]
    Click Element    //*[@id="AccountFrm_agree"]
    #Nhấn Đăng ký
    Click Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    2s
    #get text Error empty
    ${err_account}    Get Text    xpath=//div[@class="alert alert-error alert-danger"]
    ${City}    Get Text    //*[@id="AccountFrm"]/div[2]/fieldset/div[4]/span
    
    Should Contain    ${err_account}    City must be between 3 and 128 characters!
    Should Be Equal    ${City}    City must be between 3 and 128 characters!
    #Get text err field
    ${First_Name_field}    Get Value    //*[@id="AccountFrm_firstname"]
    ${Last_Name_field}    Get Value    //*[@id="AccountFrm_lastname"]
    ${E_Mail_field}    Get Value    //*[@id="AccountFrm_email"]
    ${Telephone_field}    Get Value    //*[@id="AccountFrm_telephone"]
    ${Fax_field}    Get Value    //*[@id="AccountFrm_fax"]
    ${Company_field}    Get Value    //*[@id="AccountFrm_company"]
    ${Address_1_field}    Get Value    //*[@id="AccountFrm_address_1"]
    ${Address_2_field}    Get Value    //*[@id="AccountFrm_address_2"]
    ${City_field}    Get Value    //*[@id="AccountFrm_city"]
    ${Region_tate_field}    Get Value    //*[@id="AccountFrm_zone_id"]
    ${ZIP_Code_field}    Get Value    //*[@id="AccountFrm_postcode"]
    ${Country_field}    Get Value    //*[@id="AccountFrm_country_id"]
    ${Login_name_field}    Get Value    //*[@id="AccountFrm_loginname"]
    Click Element    //*[@id="AccountFrm_newsletter1"]
    ${Password_field}    Get Value    //*[@id="AccountFrm_password"]
    Click Element    //*[@id="AccountFrm_agree"]
    ${Password_Confirm_field}    Get Value    //*[@id="AccountFrm_confirm"]
    #Kiểm tra các trường đã được điền chưa
    Should Be Equal    ${First_Name_field}    Huynh
    Should Be Equal As Strings    ${Last_Name_field}    Trinh
    Should Be Equal    ${E_Mail_field}    trinhtrinhhuynh4huynh2003@gmail.com
    Should Be Equal    ${Telephone_field}    0344171672
    Should Be Equal    ${Fax_field}    + 84 (8) 24567889
    Should Be Equal    ${Company_field}    Baa Baby
    Should Be Equal    ${Address_1_field}    Ấp Tân Thông 4, Xã Thanh Tân, Huyện Mỏ Cày Bắc, Tỉnh Bến Tre
    Should Be Equal    ${Address_2_field}    Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh
    Should Be Equal    ${City_field}    sdfh djfaj Ấp Tân Thông 4, Xã Thanh Tân, Huyện Mỏ Cày Bắc, Tỉnh Bến Tre Ấp Tân Thông 4, Xã Thanh Tân, Huyện Mỏ Cày Bắc, Tỉnh Bến Tre Ấp Tân Thông 4, Xã Thanh Tân, Huyện Mỏ Cày Bắc, Tỉnh Bến Tre Ấp Tân Thông 4, Xã Thanh Tân, Huyện Mỏ Cày Bắc, Tỉnh Bến Tre Ấp Tân Thông 4, Xã Thanh Tân, Huyện Mỏ Cày Bắc, Tỉnh Bến Tre
    Should Be Equal    ${Region_tate_field}    3780
    Should Be Equal    ${ZIP_Code_field}    70000
    Should Be Equal    ${Country_field}    230
    Should Be Equal    ${Login_name_field}    trinhtrinhhuynh4
    Should Be Equal    ${Password_field}    ${EMPTY}
    Should Be Equal    ${Password_Confirm_field}    ${EMPTY}
    Close Browser
TC22: Nhập City dưới 3 ký tự
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Click Element   ${Login_or_register} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Click Element   ${Continue}  
    Location Should Be    https://automationteststore.com/index.php?rt=account/create
     #Kiểm tra trường dữ liệu
    Page Should Contain Element    //*[@id="AccountFrm_firstname"]
    Page Should Contain Element    //*[@id="AccountFrm_lastname"]
    Page Should Contain Element    //*[@id="AccountFrm_email"]
    Page Should Contain Element    //*[@id="AccountFrm_fax"]
    Page Should Contain Element    //*[@id="AccountFrm_company"]
    Page Should Contain Element    //*[@id="AccountFrm_address_1"]
    Page Should Contain Element    //*[@id="AccountFrm_address_2"]
    Page Should Contain Element    //*[@id="AccountFrm_city"]
    Page Should Contain Element    //*[@id="AccountFrm_country_id"]
    Page Should Contain Element    //*[@id="AccountFrm_zone_id"]
    Page Should Contain Element    //*[@id="AccountFrm_postcode"]
    Page Should Contain Element    //*[@id="AccountFrm_loginname"]
    Page Should Contain Element    //*[@id="AccountFrm_password"]
    Page Should Contain Element    //*[@id="AccountFrm_confirm"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter1"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter0"]
    Page Should Contain Element    //*[@id="AccountFrm_agree"]
    Page Should Contain Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    #Nhập dữ liệu
    Input Text    //*[@id="AccountFrm_firstname"]    Huynh
    Input Text    //*[@id="AccountFrm_lastname"]    Trinh
    Input Text    //*[@id="AccountFrm_email"]    trinhtrinhhuynh4huynh2003@gmail.com
    Input Text    //*[@id="AccountFrm_telephone"]    0344171672
    Input Text    //*[@id="AccountFrm_fax"]    + 84 (8) 24567889
    Input Text    //*[@id="AccountFrm_company"]    Baa Baby
    Input Text    //*[@id="AccountFrm_address_1"]    Ấp Tân Thông 4, Xã Thanh Tân, Huyện Mỏ Cày Bắc, Tỉnh Bến Tre
    Input Text    //*[@id="AccountFrm_address_2"]    Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh
    Input Text    //*[@id="AccountFrm_city"]    sd
    Select From List By Value    //*[@id="AccountFrm_country_id"]    230
    Sleep    2s
    Select From List By Value    //*[@id="AccountFrm_zone_id"]    3780
    Input Text    //*[@id="AccountFrm_postcode"]    70000
    Input Text    //*[@id="AccountFrm_loginname"]    trinhtrinhhuynh4
    Input Password    //*[@id="AccountFrm_password"]    Trinh@2003
    Input Password    //*[@id="AccountFrm_confirm"]    Trinh@2003
    Click Element    //*[@id="AccountFrm_newsletter1"]
    Click Element    //*[@id="AccountFrm_agree"]
    #Nhấn Đăng ký
    Click Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    2s
    #get text Error empty
    ${err_account}    Get Text    xpath=//div[@class="alert alert-error alert-danger"]
    ${City}    Get Text    //*[@id="AccountFrm"]/div[2]/fieldset/div[4]/span
    
    Should Contain    ${err_account}    City must be between 3 and 128 characters!
    Should Be Equal    ${City}    City must be between 3 and 128 characters!
    #Get text err field
    ${First_Name_field}    Get Value    //*[@id="AccountFrm_firstname"]
    ${Last_Name_field}    Get Value    //*[@id="AccountFrm_lastname"]
    ${E_Mail_field}    Get Value    //*[@id="AccountFrm_email"]
    ${Telephone_field}    Get Value    //*[@id="AccountFrm_telephone"]
    ${Fax_field}    Get Value    //*[@id="AccountFrm_fax"]
    ${Company_field}    Get Value    //*[@id="AccountFrm_company"]
    ${Address_1_field}    Get Value    //*[@id="AccountFrm_address_1"]
    ${Address_2_field}    Get Value    //*[@id="AccountFrm_address_2"]
    ${City_field}    Get Value    //*[@id="AccountFrm_city"]
    ${Region_tate_field}    Get Value    //*[@id="AccountFrm_zone_id"]
    ${ZIP_Code_field}    Get Value    //*[@id="AccountFrm_postcode"]
    ${Country_field}    Get Value    //*[@id="AccountFrm_country_id"]
    ${Login_name_field}    Get Value    //*[@id="AccountFrm_loginname"]
    Click Element    //*[@id="AccountFrm_newsletter1"]
    ${Password_field}    Get Value    //*[@id="AccountFrm_password"]
    Click Element    //*[@id="AccountFrm_agree"]
    ${Password_Confirm_field}    Get Value    //*[@id="AccountFrm_confirm"]
    #Kiểm tra các trường đã được điền chưa
    Should Be Equal    ${First_Name_field}    Huynh
    Should Be Equal As Strings    ${Last_Name_field}    Trinh
    Should Be Equal    ${E_Mail_field}    trinhtrinhhuynh4huynh2003@gmail.com
    Should Be Equal    ${Telephone_field}    0344171672
    Should Be Equal    ${Fax_field}    + 84 (8) 24567889
    Should Be Equal    ${Company_field}    Baa Baby
    Should Be Equal    ${Address_1_field}    Ấp Tân Thông 4, Xã Thanh Tân, Huyện Mỏ Cày Bắc, Tỉnh Bến Tre
    Should Be Equal    ${Address_2_field}    Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh
    Should Be Equal    ${City_field}    sd
    Should Be Equal    ${ZIP_Code_field}    70000
    Should Be Equal    ${Country_field}    230
    Should Be Equal    ${Login_name_field}    trinhtrinhhuynh4
    Should Be Equal    ${Password_field}    ${EMPTY}
    Should Be Equal    ${Password_Confirm_field}    ${EMPTY}
    Close Browser

TC23: Nhập zip code dưới 3 ký tự
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Click Element   ${Login_or_register} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Click Element   ${Continue}  
    Location Should Be    https://automationteststore.com/index.php?rt=account/create
     #Kiểm tra trường dữ liệu
    Page Should Contain Element    //*[@id="AccountFrm_firstname"]
    Page Should Contain Element    //*[@id="AccountFrm_lastname"]
    Page Should Contain Element    //*[@id="AccountFrm_email"]
    Page Should Contain Element    //*[@id="AccountFrm_fax"]
    Page Should Contain Element    //*[@id="AccountFrm_company"]
    Page Should Contain Element    //*[@id="AccountFrm_address_1"]
    Page Should Contain Element    //*[@id="AccountFrm_address_2"]
    Page Should Contain Element    //*[@id="AccountFrm_city"]
    Page Should Contain Element    //*[@id="AccountFrm_country_id"]
    Page Should Contain Element    //*[@id="AccountFrm_zone_id"]
    Page Should Contain Element    //*[@id="AccountFrm_postcode"]
    Page Should Contain Element    //*[@id="AccountFrm_loginname"]
    Page Should Contain Element    //*[@id="AccountFrm_password"]
    Page Should Contain Element    //*[@id="AccountFrm_confirm"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter1"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter0"]
    Page Should Contain Element    //*[@id="AccountFrm_agree"]
    Page Should Contain Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    #Nhập dữ liệu
    Input Text    //*[@id="AccountFrm_firstname"]    Huynh
    Input Text    //*[@id="AccountFrm_lastname"]    Trinh
    Input Text    //*[@id="AccountFrm_email"]    trinhtrinhhuynh4huynh2003@gmail.com
    Input Text    //*[@id="AccountFrm_telephone"]    0344171672
    Input Text    //*[@id="AccountFrm_fax"]    + 84 (8) 24567889
    Input Text    //*[@id="AccountFrm_company"]    Baa Baby
    Input Text    //*[@id="AccountFrm_address_1"]    Ấp Tân Thông 4, Xã Thanh Tân, Huyện Mỏ Cày Bắc, Tỉnh Bến Tre
    Input Text    //*[@id="AccountFrm_address_2"]    Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh
    Input Text    //*[@id="AccountFrm_city"]    Hồ Chí Minh
    Select From List By Value    //*[@id="AccountFrm_country_id"]    230
    Sleep    2s
    Select From List By Value    //*[@id="AccountFrm_zone_id"]    3780
    Input Text    //*[@id="AccountFrm_postcode"]    12
    Input Text    //*[@id="AccountFrm_loginname"]    trinhtrinhhuynh4
    Input Password    //*[@id="AccountFrm_password"]    Trinh@2003
    Input Password    //*[@id="AccountFrm_confirm"]    Trinh@2003
    Click Element    //*[@id="AccountFrm_newsletter1"]
    Click Element    //*[@id="AccountFrm_agree"]
    #Nhấn Đăng ký
    Click Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    2s
    #get text Error empty
    ${err_account}    Get Text    xpath=//div[@class="alert alert-error alert-danger"]
    ${ZIP_Code}    Get Text    //*[@id="AccountFrm"]/div[2]/fieldset/div[6]/span
    
    Should Contain    ${err_account}    Zip/postal code must be between 3 and 10 characters!
    Should Be Equal    ${ZIP_Code}    Zip/postal code must be between 3 and 10 characters!
    #Get text err field
    ${First_Name_field}    Get Value    //*[@id="AccountFrm_firstname"]
    ${Last_Name_field}    Get Value    //*[@id="AccountFrm_lastname"]
    ${E_Mail_field}    Get Value    //*[@id="AccountFrm_email"]
    ${Telephone_field}    Get Value    //*[@id="AccountFrm_telephone"]
    ${Fax_field}    Get Value    //*[@id="AccountFrm_fax"]
    ${Company_field}    Get Value    //*[@id="AccountFrm_company"]
    ${Address_1_field}    Get Value    //*[@id="AccountFrm_address_1"]
    ${Address_2_field}    Get Value    //*[@id="AccountFrm_address_2"]
    ${City_field}    Get Value    //*[@id="AccountFrm_city"]
    ${Region_tate_field}    Get Value    //*[@id="AccountFrm_zone_id"]
    ${ZIP_Code_field}    Get Value    //*[@id="AccountFrm_postcode"]
    ${Country_field}    Get Value    //*[@id="AccountFrm_country_id"]
    ${Login_name_field}    Get Value    //*[@id="AccountFrm_loginname"]
    Click Element    //*[@id="AccountFrm_newsletter1"]
    ${Password_field}    Get Value    //*[@id="AccountFrm_password"]
    Click Element    //*[@id="AccountFrm_agree"]
    ${Password_Confirm_field}    Get Value    //*[@id="AccountFrm_confirm"]
    #Kiểm tra các trường đã được điền chưa
    Should Be Equal    ${First_Name_field}    Huynh
    Should Be Equal As Strings    ${Last_Name_field}    Trinh
    Should Be Equal    ${E_Mail_field}    trinhtrinhhuynh4huynh2003@gmail.com
    Should Be Equal    ${Telephone_field}    0344171672
    Should Be Equal    ${Fax_field}    + 84 (8) 24567889
    Should Be Equal    ${Company_field}    Baa Baby
    Should Be Equal    ${Address_1_field}    Ấp Tân Thông 4, Xã Thanh Tân, Huyện Mỏ Cày Bắc, Tỉnh Bến Tre
    Should Be Equal    ${Address_2_field}    Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh
    Should Be Equal    ${City_field}    Hồ Chí Minh
    Should Be Equal    ${Region_tate_field}    3780
    Should Be Equal    ${ZIP_Code_field}    12
    Should Be Equal    ${Country_field}    230
    Should Be Equal    ${Login_name_field}    trinhtrinhhuynh4
    Should Be Equal    ${Password_field}    ${EMPTY}
    Should Be Equal    ${Password_Confirm_field}    ${EMPTY}
    Close Browser
TC24: Nhập zip code trên 10 ký tự
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Click Element   ${Login_or_register} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Click Element   ${Continue}  
    Location Should Be    https://automationteststore.com/index.php?rt=account/create
     #Kiểm tra trường dữ liệu
    Page Should Contain Element    //*[@id="AccountFrm_firstname"]
    Page Should Contain Element    //*[@id="AccountFrm_lastname"]
    Page Should Contain Element    //*[@id="AccountFrm_email"]
    Page Should Contain Element    //*[@id="AccountFrm_fax"]
    Page Should Contain Element    //*[@id="AccountFrm_company"]
    Page Should Contain Element    //*[@id="AccountFrm_address_1"]
    Page Should Contain Element    //*[@id="AccountFrm_address_2"]
    Page Should Contain Element    //*[@id="AccountFrm_city"]
    Page Should Contain Element    //*[@id="AccountFrm_country_id"]
    Page Should Contain Element    //*[@id="AccountFrm_zone_id"]
    Page Should Contain Element    //*[@id="AccountFrm_postcode"]
    Page Should Contain Element    //*[@id="AccountFrm_loginname"]
    Page Should Contain Element    //*[@id="AccountFrm_password"]
    Page Should Contain Element    //*[@id="AccountFrm_confirm"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter1"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter0"]
    Page Should Contain Element    //*[@id="AccountFrm_agree"]
    Page Should Contain Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    #Nhập dữ liệu
    Input Text    //*[@id="AccountFrm_firstname"]    Huynh
    Input Text    //*[@id="AccountFrm_lastname"]    Trinh
    Input Text    //*[@id="AccountFrm_email"]    trinhtrinhhhuynh1huynh2003@gmail.com
    Input Text    //*[@id="AccountFrm_telephone"]    0344171672
    Input Text    //*[@id="AccountFrm_fax"]    + 84 (8) 24567889
    Input Text    //*[@id="AccountFrm_company"]    Baa Baby
    Input Text    //*[@id="AccountFrm_address_1"]    Ấp Tân Thông 4, Xã Thanh Tân, Huyện Mỏ Cày Bắc, Tỉnh Bến Tre
    Input Text    //*[@id="AccountFrm_address_2"]    Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh
    Input Text    //*[@id="AccountFrm_city"]    Hồ Chí Minh
    Select From List By Value    //*[@id="AccountFrm_country_id"]    230
    Sleep    2s
    Select From List By Value    //*[@id="AccountFrm_zone_id"]    3780
    Input Text    //*[@id="AccountFrm_postcode"]    1234567891011
    Input Text    //*[@id="AccountFrm_loginname"]    trinhtrinhhhuynh1
    Input Password    //*[@id="AccountFrm_password"]    Trinh@2003
    Input Password    //*[@id="AccountFrm_confirm"]    Trinh@2003
    Click Element    //*[@id="AccountFrm_newsletter1"]
    Click Element    //*[@id="AccountFrm_agree"]
    ${zip_code_value}    Get Element Attribute    //*[@id="AccountFrm_postcode"]    value
    ${zip_code_length}    Get Length    ${zip_code_value}
    Run Keyword If    ${zip_code_length} > 10    Fail    Zip code length is more than 10 characters: ${zip_code_length}
    #Nhấn Đăng ký
    Click Element    //*[@id="AccountFrm"]/div[5]/div/div/button

TC25: Nhập Login name trên 64 ký tự
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Click Element   ${Login_or_register} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Click Element   ${Continue}  
    Location Should Be    https://automationteststore.com/index.php?rt=account/create
     #Kiểm tra trường dữ liệu
    Page Should Contain Element    //*[@id="AccountFrm_firstname"]
    Page Should Contain Element    //*[@id="AccountFrm_lastname"]
    Page Should Contain Element    //*[@id="AccountFrm_email"]
    Page Should Contain Element    //*[@id="AccountFrm_fax"]
    Page Should Contain Element    //*[@id="AccountFrm_company"]
    Page Should Contain Element    //*[@id="AccountFrm_address_1"]
    Page Should Contain Element    //*[@id="AccountFrm_address_2"]
    Page Should Contain Element    //*[@id="AccountFrm_city"]
    Page Should Contain Element    //*[@id="AccountFrm_country_id"]
    Page Should Contain Element    //*[@id="AccountFrm_zone_id"]
    Page Should Contain Element    //*[@id="AccountFrm_postcode"]
    Page Should Contain Element    //*[@id="AccountFrm_loginname"]
    Page Should Contain Element    //*[@id="AccountFrm_password"]
    Page Should Contain Element    //*[@id="AccountFrm_confirm"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter1"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter0"]
    Page Should Contain Element    //*[@id="AccountFrm_agree"]
    Page Should Contain Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    #Nhập dữ liệu
    Input Text    //*[@id="AccountFrm_firstname"]    Huynh
    Input Text    //*[@id="AccountFrm_lastname"]    Trinh
    Input Text    //*[@id="AccountFrm_email"]    trinhtrinhhuynh4huynh2003@gmail.com
    Input Text    //*[@id="AccountFrm_telephone"]    0344171672
    Input Text    //*[@id="AccountFrm_fax"]    + 84 (8) 24567889
    Input Text    //*[@id="AccountFrm_company"]    Baa Baby
    Input Text    //*[@id="AccountFrm_address_1"]    Ấp Tân Thông 4, Xã Thanh Tân, Huyện Mỏ Cày Bắc, Tỉnh Bến Tre
    Input Text    //*[@id="AccountFrm_address_2"]    Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh
    Input Text    //*[@id="AccountFrm_city"]    Hồ Chí Minh
    Select From List By Value    //*[@id="AccountFrm_country_id"]    230
    Sleep    2s
    Select From List By Value    //*[@id="AccountFrm_zone_id"]    3780
    Input Text    //*[@id="AccountFrm_postcode"]    70000
    Input Text    //*[@id="AccountFrm_loginname"]    chinhchinh2003chinhchinh2003chinhchinh2003chinhchinh2003chinhchinh2003
    Input Password    //*[@id="AccountFrm_password"]    Trinh@2003
    Input Password    //*[@id="AccountFrm_confirm"]    Trinh@2003
    Click Element    //*[@id="AccountFrm_newsletter1"]
    Click Element    //*[@id="AccountFrm_agree"]
    #Nhấn Đăng ký
    Click Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    2s
    #get text Error empty
    ${err_account}    Get Text    xpath=//div[@class="alert alert-error alert-danger"]
    ${Login_name}    Get Text    //*[@id="AccountFrm"]/div[3]/fieldset/div[1]/span
    
    Should Contain    ${err_account}    Login name must be alphanumeric only and between 5 and 64 characters!
    Should Be Equal    ${Login_name}    Login name must be alphanumeric only and between 5 and 64 characters!
    #Get text err field
    ${First_Name_field}    Get Value    //*[@id="AccountFrm_firstname"]
    ${Last_Name_field}    Get Value    //*[@id="AccountFrm_lastname"]
    ${E_Mail_field}    Get Value    //*[@id="AccountFrm_email"]
    ${Telephone_field}    Get Value    //*[@id="AccountFrm_telephone"]
    ${Fax_field}    Get Value    //*[@id="AccountFrm_fax"]
    ${Company_field}    Get Value    //*[@id="AccountFrm_company"]
    ${Address_1_field}    Get Value    //*[@id="AccountFrm_address_1"]
    ${Address_2_field}    Get Value    //*[@id="AccountFrm_address_2"]
    ${City_field}    Get Value    //*[@id="AccountFrm_city"]
    ${Region_tate_field}    Get Value    //*[@id="AccountFrm_zone_id"]
    ${ZIP_Code_field}    Get Value    //*[@id="AccountFrm_postcode"]
    ${Country_field}    Get Value    //*[@id="AccountFrm_country_id"]
    ${Login_name_field}    Get Value    //*[@id="AccountFrm_loginname"]
    Click Element    //*[@id="AccountFrm_newsletter1"]
    ${Password_field}    Get Value    //*[@id="AccountFrm_password"]
    Click Element    //*[@id="AccountFrm_agree"]
    ${Password_Confirm_field}    Get Value    //*[@id="AccountFrm_confirm"]
    #Kiểm tra các trường đã được điền chưa
    Should Be Equal    ${First_Name_field}    Huynh
    Should Be Equal As Strings    ${Last_Name_field}    Trinh
    Should Be Equal    ${E_Mail_field}    trinhtrinhhuynh4huynh2003@gmail.com
    Should Be Equal    ${Telephone_field}    0344171672
    Should Be Equal    ${Fax_field}    + 84 (8) 24567889
    Should Be Equal    ${Company_field}    Baa Baby
    Should Be Equal    ${Address_1_field}    Ấp Tân Thông 4, Xã Thanh Tân, Huyện Mỏ Cày Bắc, Tỉnh Bến Tre
    Should Be Equal    ${Address_2_field}    Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh
    Should Be Equal    ${City_field}    Hồ Chí Minh
    Should Be Equal    ${Region_tate_field}    3780
    Should Be Equal    ${ZIP_Code_field}    70000
    Should Be Equal    ${Country_field}    230
    Should Be Equal    ${Login_name_field}    chinhchinh2003chinhchinh2003chinhchinh2003chinhchinh2003chinhchinh2003
    Should Be Equal    ${Password_field}    ${EMPTY}
    Should Be Equal    ${Password_Confirm_field}    ${EMPTY}
    Close Browser
TC26: Nhập Login name dưới 5 ký tự
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Click Element   ${Login_or_register} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Click Element   ${Continue}  
    Location Should Be    https://automationteststore.com/index.php?rt=account/create
     #Kiểm tra trường dữ liệu
    Page Should Contain Element    //*[@id="AccountFrm_firstname"]
    Page Should Contain Element    //*[@id="AccountFrm_lastname"]
    Page Should Contain Element    //*[@id="AccountFrm_email"]
    Page Should Contain Element    //*[@id="AccountFrm_fax"]
    Page Should Contain Element    //*[@id="AccountFrm_company"]
    Page Should Contain Element    //*[@id="AccountFrm_address_1"]
    Page Should Contain Element    //*[@id="AccountFrm_address_2"]
    Page Should Contain Element    //*[@id="AccountFrm_city"]
    Page Should Contain Element    //*[@id="AccountFrm_country_id"]
    Page Should Contain Element    //*[@id="AccountFrm_zone_id"]
    Page Should Contain Element    //*[@id="AccountFrm_postcode"]
    Page Should Contain Element    //*[@id="AccountFrm_loginname"]
    Page Should Contain Element    //*[@id="AccountFrm_password"]
    Page Should Contain Element    //*[@id="AccountFrm_confirm"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter1"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter0"]
    Page Should Contain Element    //*[@id="AccountFrm_agree"]
    Page Should Contain Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    #Nhập dữ liệu
    Input Text    //*[@id="AccountFrm_firstname"]    Huynh
    Input Text    //*[@id="AccountFrm_lastname"]    Trinh
    Input Text    //*[@id="AccountFrm_email"]    trinhtrinhhuynh4huynh2003@gmail.com
    Input Text    //*[@id="AccountFrm_telephone"]    0344171672
    Input Text    //*[@id="AccountFrm_fax"]    + 84 (8) 24567889
    Input Text    //*[@id="AccountFrm_company"]    Baa Baby
    Input Text    //*[@id="AccountFrm_address_1"]    Ấp Tân Thông 4, Xã Thanh Tân, Huyện Mỏ Cày Bắc, Tỉnh Bến Tre
    Input Text    //*[@id="AccountFrm_address_2"]    Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh
    Input Text    //*[@id="AccountFrm_city"]    Hồ Chí Minh
    Select From List By Value    //*[@id="AccountFrm_country_id"]    230
    Sleep    2s
    Select From List By Value    //*[@id="AccountFrm_zone_id"]    3780
    Input Text    //*[@id="AccountFrm_postcode"]    70000
    Input Text    //*[@id="AccountFrm_loginname"]    ch
    Input Password    //*[@id="AccountFrm_password"]    Trinh@2003
    Input Password    //*[@id="AccountFrm_confirm"]    Trinh@2003
    Click Element    //*[@id="AccountFrm_newsletter1"]
    Click Element    //*[@id="AccountFrm_agree"]
    #Nhấn Đăng ký
    Click Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    2s
    #get text Error empty
    ${err_account}    Get Text    xpath=//div[@class="alert alert-error alert-danger"]
    ${Login_name}    Get Text    //*[@id="AccountFrm"]/div[3]/fieldset/div[1]/span
    
    Should Contain    ${err_account}    Login name must be alphanumeric only and between 5 and 64 characters!
    Should Be Equal    ${Login_name}    Login name must be alphanumeric only and between 5 and 64 characters!
    #Get text err field
    ${First_Name_field}    Get Value    //*[@id="AccountFrm_firstname"]
    ${Last_Name_field}    Get Value    //*[@id="AccountFrm_lastname"]
    ${E_Mail_field}    Get Value    //*[@id="AccountFrm_email"]
    ${Telephone_field}    Get Value    //*[@id="AccountFrm_telephone"]
    ${Fax_field}    Get Value    //*[@id="AccountFrm_fax"]
    ${Company_field}    Get Value    //*[@id="AccountFrm_company"]
    ${Address_1_field}    Get Value    //*[@id="AccountFrm_address_1"]
    ${Address_2_field}    Get Value    //*[@id="AccountFrm_address_2"]
    ${City_field}    Get Value    //*[@id="AccountFrm_city"]
    ${Region_tate_field}    Get Value    //*[@id="AccountFrm_zone_id"]
    ${ZIP_Code_field}    Get Value    //*[@id="AccountFrm_postcode"]
    ${Country_field}    Get Value    //*[@id="AccountFrm_country_id"]
    ${Login_name_field}    Get Value    //*[@id="AccountFrm_loginname"]
    Click Element    //*[@id="AccountFrm_newsletter1"]
    ${Password_field}    Get Value    //*[@id="AccountFrm_password"]
    Click Element    //*[@id="AccountFrm_agree"]
    ${Password_Confirm_field}    Get Value    //*[@id="AccountFrm_confirm"]
    #Kiểm tra các trường đã được điền chưa
    Should Be Equal    ${First_Name_field}    Huynh
    Should Be Equal As Strings    ${Last_Name_field}    Trinh
    Should Be Equal    ${E_Mail_field}    trinhtrinhhuynh4huynh2003@gmail.com
    Should Be Equal    ${Telephone_field}    0344171672
    Should Be Equal    ${Fax_field}    + 84 (8) 24567889
    Should Be Equal    ${Company_field}    Baa Baby
    Should Be Equal    ${Address_1_field}    Ấp Tân Thông 4, Xã Thanh Tân, Huyện Mỏ Cày Bắc, Tỉnh Bến Tre
    Should Be Equal    ${Address_2_field}    Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh
    Should Be Equal    ${City_field}    Hồ Chí Minh
    Should Be Equal    ${Region_tate_field}    3780
    Should Be Equal    ${ZIP_Code_field}    70000
    Should Be Equal    ${Country_field}    230
    Should Be Equal    ${Login_name_field}    ch
    Should Be Equal    ${Password_field}    ${EMPTY}
    Should Be Equal    ${Password_Confirm_field}    ${EMPTY}
    Close Browser
TC27: Nhập Login name với ký tự đặc 
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Click Element   ${Login_or_register} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Click Element   ${Continue}  
    Location Should Be    https://automationteststore.com/index.php?rt=account/create
     #Kiểm tra trường dữ liệu
    Page Should Contain Element    //*[@id="AccountFrm_firstname"]
    Page Should Contain Element    //*[@id="AccountFrm_lastname"]
    Page Should Contain Element    //*[@id="AccountFrm_email"]
    Page Should Contain Element    //*[@id="AccountFrm_fax"]
    Page Should Contain Element    //*[@id="AccountFrm_company"]
    Page Should Contain Element    //*[@id="AccountFrm_address_1"]
    Page Should Contain Element    //*[@id="AccountFrm_address_2"]
    Page Should Contain Element    //*[@id="AccountFrm_city"]
    Page Should Contain Element    //*[@id="AccountFrm_country_id"]
    Page Should Contain Element    //*[@id="AccountFrm_zone_id"]
    Page Should Contain Element    //*[@id="AccountFrm_postcode"]
    Page Should Contain Element    //*[@id="AccountFrm_loginname"]
    Page Should Contain Element    //*[@id="AccountFrm_password"]
    Page Should Contain Element    //*[@id="AccountFrm_confirm"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter1"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter0"]
    Page Should Contain Element    //*[@id="AccountFrm_agree"]
    Page Should Contain Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    #Nhập dữ liệu
    Input Text    //*[@id="AccountFrm_firstname"]    Huynh
    Input Text    //*[@id="AccountFrm_lastname"]    Trinh
    Input Text    //*[@id="AccountFrm_email"]    trinhtrinhhuynh4huynh2003@gmail.com
    Input Text    //*[@id="AccountFrm_telephone"]    0344171672
    Input Text    //*[@id="AccountFrm_fax"]    + 84 (8) 24567889
    Input Text    //*[@id="AccountFrm_company"]    Baa Baby
    Input Text    //*[@id="AccountFrm_address_1"]    Ấp Tân Thông 4, Xã Thanh Tân, Huyện Mỏ Cày Bắc, Tỉnh Bến Tre
    Input Text    //*[@id="AccountFrm_address_2"]    Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh
    Input Text    //*[@id="AccountFrm_city"]    Hồ Chí Minh
    Select From List By Value    //*[@id="AccountFrm_country_id"]    230
    Sleep    2s
    Select From List By Value    //*[@id="AccountFrm_zone_id"]    3780
    Input Text    //*[@id="AccountFrm_postcode"]    70000
    Input Text    //*[@id="AccountFrm_loginname"]    Trinh#123
    Input Password    //*[@id="AccountFrm_password"]    Trinh@2003
    Input Password    //*[@id="AccountFrm_confirm"]    Trinh@2003
    Click Element    //*[@id="AccountFrm_newsletter1"]
    Click Element    //*[@id="AccountFrm_agree"]
    #Nhấn Đăng ký
    Click Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    2s
    #get text Error empty
    ${err_account}    Get Text    xpath=//div[@class="alert alert-error alert-danger"]
    ${Login_name}    Get Text    //*[@id="AccountFrm"]/div[3]/fieldset/div[1]/span
    
    Should Contain    ${err_account}    Login name must be alphanumeric only and between 5 and 64 characters!
    Should Be Equal    ${Login_name}    Login name must be alphanumeric only and between 5 and 64 characters!
    #Get text err field
    ${First_Name_field}    Get Value    //*[@id="AccountFrm_firstname"]
    ${Last_Name_field}    Get Value    //*[@id="AccountFrm_lastname"]
    ${E_Mail_field}    Get Value    //*[@id="AccountFrm_email"]
    ${Telephone_field}    Get Value    //*[@id="AccountFrm_telephone"]
    ${Fax_field}    Get Value    //*[@id="AccountFrm_fax"]
    ${Company_field}    Get Value    //*[@id="AccountFrm_company"]
    ${Address_1_field}    Get Value    //*[@id="AccountFrm_address_1"]
    ${Address_2_field}    Get Value    //*[@id="AccountFrm_address_2"]
    ${City_field}    Get Value    //*[@id="AccountFrm_city"]
    ${Region_tate_field}    Get Value    //*[@id="AccountFrm_zone_id"]
    ${ZIP_Code_field}    Get Value    //*[@id="AccountFrm_postcode"]
    ${Country_field}    Get Value    //*[@id="AccountFrm_country_id"]
    ${Login_name_field}    Get Value    //*[@id="AccountFrm_loginname"]
    Click Element    //*[@id="AccountFrm_newsletter1"]
    ${Password_field}    Get Value    //*[@id="AccountFrm_password"]
    Click Element    //*[@id="AccountFrm_agree"]
    ${Password_Confirm_field}    Get Value    //*[@id="AccountFrm_confirm"]
    #Kiểm tra các trường đã được điền chưa
    Should Be Equal    ${First_Name_field}    Huynh
    Should Be Equal As Strings    ${Last_Name_field}    Trinh
    Should Be Equal    ${E_Mail_field}    trinhtrinhhuynh4huynh2003@gmail.com
    Should Be Equal    ${Telephone_field}    0344171672
    Should Be Equal    ${Fax_field}    + 84 (8) 24567889
    Should Be Equal    ${Company_field}    Baa Baby
    Should Be Equal    ${Address_1_field}    Ấp Tân Thông 4, Xã Thanh Tân, Huyện Mỏ Cày Bắc, Tỉnh Bến Tre
    Should Be Equal    ${Address_2_field}    Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh
    Should Be Equal    ${City_field}    Hồ Chí Minh
    Should Be Equal    ${Region_tate_field}    3780
    Should Be Equal    ${ZIP_Code_field}    70000
    Should Be Equal    ${Country_field}    230
    Should Be Equal    ${Login_name_field}    Trinh#123
    Should Be Equal    ${Password_field}    ${EMPTY}
    Should Be Equal    ${Password_Confirm_field}    ${EMPTY}
    Close Browser
TC28: Nhập Login name có dấu cách
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Click Element   ${Login_or_register} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Click Element   ${Continue}  
    Location Should Be    https://automationteststore.com/index.php?rt=account/create
     #Kiểm tra trường dữ liệu
    Page Should Contain Element    //*[@id="AccountFrm_firstname"]
    Page Should Contain Element    //*[@id="AccountFrm_lastname"]
    Page Should Contain Element    //*[@id="AccountFrm_email"]
    Page Should Contain Element    //*[@id="AccountFrm_fax"]
    Page Should Contain Element    //*[@id="AccountFrm_company"]
    Page Should Contain Element    //*[@id="AccountFrm_address_1"]
    Page Should Contain Element    //*[@id="AccountFrm_address_2"]
    Page Should Contain Element    //*[@id="AccountFrm_city"]
    Page Should Contain Element    //*[@id="AccountFrm_country_id"]
    Page Should Contain Element    //*[@id="AccountFrm_zone_id"]
    Page Should Contain Element    //*[@id="AccountFrm_postcode"]
    Page Should Contain Element    //*[@id="AccountFrm_loginname"]
    Page Should Contain Element    //*[@id="AccountFrm_password"]
    Page Should Contain Element    //*[@id="AccountFrm_confirm"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter1"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter0"]
    Page Should Contain Element    //*[@id="AccountFrm_agree"]
    Page Should Contain Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    #Nhập dữ liệu
    Input Text    //*[@id="AccountFrm_firstname"]    Huynh
    Input Text    //*[@id="AccountFrm_lastname"]    Trinh
    Input Text    //*[@id="AccountFrm_email"]    trinhtrinhhuynh4huynh2003@gmail.com
    Input Text    //*[@id="AccountFrm_telephone"]    0344171672
    Input Text    //*[@id="AccountFrm_fax"]    + 84 (8) 24567889
    Input Text    //*[@id="AccountFrm_company"]    Baa Baby
    Input Text    //*[@id="AccountFrm_address_1"]    Ấp Tân Thông 4, Xã Thanh Tân, Huyện Mỏ Cày Bắc, Tỉnh Bến Tre
    Input Text    //*[@id="AccountFrm_address_2"]    Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh
    Input Text    //*[@id="AccountFrm_city"]    Hồ Chí Minh
    Select From List By Value    //*[@id="AccountFrm_country_id"]    230
    Sleep    2s
    Select From List By Value    //*[@id="AccountFrm_zone_id"]    3780
    Input Text    //*[@id="AccountFrm_postcode"]    70000
    Input Text    //*[@id="AccountFrm_loginname"]    Trinh 123
    Input Password    //*[@id="AccountFrm_password"]    Trinh@2003
    Input Password    //*[@id="AccountFrm_confirm"]    Trinh@2003
    Click Element    //*[@id="AccountFrm_newsletter1"]
    Click Element    //*[@id="AccountFrm_agree"]
    #Nhấn Đăng ký
    Click Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    2s
    #get text Error empty
    ${err_account}    Get Text    xpath=//div[@class="alert alert-error alert-danger"]
    ${Login_name}    Get Text    //*[@id="AccountFrm"]/div[3]/fieldset/div[1]/span
    
    Should Contain    ${err_account}    Login name must be alphanumeric only and between 5 and 64 characters!
    Should Be Equal    ${Login_name}    Login name must be alphanumeric only and between 5 and 64 characters!
    #Get text err field
    ${First_Name_field}    Get Value    //*[@id="AccountFrm_firstname"]
    ${Last_Name_field}    Get Value    //*[@id="AccountFrm_lastname"]
    ${E_Mail_field}    Get Value    //*[@id="AccountFrm_email"]
    ${Telephone_field}    Get Value    //*[@id="AccountFrm_telephone"]
    ${Fax_field}    Get Value    //*[@id="AccountFrm_fax"]
    ${Company_field}    Get Value    //*[@id="AccountFrm_company"]
    ${Address_1_field}    Get Value    //*[@id="AccountFrm_address_1"]
    ${Address_2_field}    Get Value    //*[@id="AccountFrm_address_2"]
    ${City_field}    Get Value    //*[@id="AccountFrm_city"]
    ${Region_tate_field}    Get Value    //*[@id="AccountFrm_zone_id"]
    ${ZIP_Code_field}    Get Value    //*[@id="AccountFrm_postcode"]
    ${Country_field}    Get Value    //*[@id="AccountFrm_country_id"]
    ${Login_name_field}    Get Value    //*[@id="AccountFrm_loginname"]
    Click Element    //*[@id="AccountFrm_newsletter1"]
    ${Password_field}    Get Value    //*[@id="AccountFrm_password"]
    Click Element    //*[@id="AccountFrm_agree"]
    ${Password_Confirm_field}    Get Value    //*[@id="AccountFrm_confirm"]
    #Kiểm tra các trường đã được điền chưa
    Should Be Equal    ${First_Name_field}    Huynh
    Should Be Equal As Strings    ${Last_Name_field}    Trinh
    Should Be Equal    ${E_Mail_field}    trinhtrinhhuynh4huynh2003@gmail.com
    Should Be Equal    ${Telephone_field}    0344171672
    Should Be Equal    ${Fax_field}    + 84 (8) 24567889
    Should Be Equal    ${Company_field}    Baa Baby
    Should Be Equal    ${Address_1_field}    Ấp Tân Thông 4, Xã Thanh Tân, Huyện Mỏ Cày Bắc, Tỉnh Bến Tre
    Should Be Equal    ${Address_2_field}    Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh
    Should Be Equal    ${City_field}    Hồ Chí Minh
    Should Be Equal    ${Region_tate_field}    3780
    Should Be Equal    ${ZIP_Code_field}    70000
    Should Be Equal    ${Country_field}    230
    Should Be Equal    ${Login_name_field}    Trinh 123
    Should Be Equal    ${Password_field}    ${EMPTY}
    Should Be Equal    ${Password_Confirm_field}    ${EMPTY}
    Close Browser
TC29: Nhập Login name đã tồn tại
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Click Element   ${Login_or_register} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Click Element   ${Continue}  
    Location Should Be    https://automationteststore.com/index.php?rt=account/create
     #Kiểm tra trường dữ liệu
    Page Should Contain Element    //*[@id="AccountFrm_firstname"]
    Page Should Contain Element    //*[@id="AccountFrm_lastname"]
    Page Should Contain Element    //*[@id="AccountFrm_email"]
    Page Should Contain Element    //*[@id="AccountFrm_fax"]
    Page Should Contain Element    //*[@id="AccountFrm_company"]
    Page Should Contain Element    //*[@id="AccountFrm_address_1"]
    Page Should Contain Element    //*[@id="AccountFrm_address_2"]
    Page Should Contain Element    //*[@id="AccountFrm_city"]
    Page Should Contain Element    //*[@id="AccountFrm_country_id"]
    Page Should Contain Element    //*[@id="AccountFrm_zone_id"]
    Page Should Contain Element    //*[@id="AccountFrm_postcode"]
    Page Should Contain Element    //*[@id="AccountFrm_loginname"]
    Page Should Contain Element    //*[@id="AccountFrm_password"]
    Page Should Contain Element    //*[@id="AccountFrm_confirm"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter1"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter0"]
    Page Should Contain Element    //*[@id="AccountFrm_agree"]
    Page Should Contain Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    #Nhập dữ liệu
    Input Text    //*[@id="AccountFrm_firstname"]    Huynh
    Input Text    //*[@id="AccountFrm_lastname"]    Trinh
    Input Text    //*[@id="AccountFrm_email"]    trinhtrinhhuynh4huynh2003@gmail.com
    Input Text    //*[@id="AccountFrm_telephone"]    0344171672
    Input Text    //*[@id="AccountFrm_fax"]    + 84 (8) 24567889
    Input Text    //*[@id="AccountFrm_company"]    Baa Baby
    Input Text    //*[@id="AccountFrm_address_1"]    Ấp Tân Thông 4, Xã Thanh Tân, Huyện Mỏ Cày Bắc, Tỉnh Bến Tre
    Input Text    //*[@id="AccountFrm_address_2"]    Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh
    Input Text    //*[@id="AccountFrm_city"]    Hồ Chí Minh
    Select From List By Value    //*[@id="AccountFrm_country_id"]    230
    Sleep    2s
    Select From List By Value    //*[@id="AccountFrm_zone_id"]    3780
    Input Text    //*[@id="AccountFrm_postcode"]    70000
    Input Text    //*[@id="AccountFrm_loginname"]    chinhchinh2003
    Input Password    //*[@id="AccountFrm_password"]    Trinh@2003
    Input Password    //*[@id="AccountFrm_confirm"]    Trinh@2003
    Click Element    //*[@id="AccountFrm_newsletter1"]
    Click Element    //*[@id="AccountFrm_agree"]
    #Nhấn Đăng ký
    Click Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    2s
    #get text Error empty
    ${err_account}    Get Text    xpath=//div[@class="alert alert-error alert-danger"]
    ${Login_name}    Get Text    //*[@id="AccountFrm"]/div[3]/fieldset/div[1]/span
    
    Should Contain    ${err_account}    This login name is not available. Try different login name!
    Should Be Equal    ${Login_name}    This login name is not available. Try different login name!
    #Get text err field
    ${First_Name_field}    Get Value    //*[@id="AccountFrm_firstname"]
    ${Last_Name_field}    Get Value    //*[@id="AccountFrm_lastname"]
    ${E_Mail_field}    Get Value    //*[@id="AccountFrm_email"]
    ${Telephone_field}    Get Value    //*[@id="AccountFrm_telephone"]
    ${Fax_field}    Get Value    //*[@id="AccountFrm_fax"]
    ${Company_field}    Get Value    //*[@id="AccountFrm_company"]
    ${Address_1_field}    Get Value    //*[@id="AccountFrm_address_1"]
    ${Address_2_field}    Get Value    //*[@id="AccountFrm_address_2"]
    ${City_field}    Get Value    //*[@id="AccountFrm_city"]
    ${Region_tate_field}    Get Value    //*[@id="AccountFrm_zone_id"]
    ${ZIP_Code_field}    Get Value    //*[@id="AccountFrm_postcode"]
    ${Country_field}    Get Value    //*[@id="AccountFrm_country_id"]
    ${Login_name_field}    Get Value    //*[@id="AccountFrm_loginname"]
    Click Element    //*[@id="AccountFrm_newsletter1"]
    ${Password_field}    Get Value    //*[@id="AccountFrm_password"]
    Click Element    //*[@id="AccountFrm_agree"]
    ${Password_Confirm_field}    Get Value    //*[@id="AccountFrm_confirm"]
    #Kiểm tra các trường đã được điền chưa
    Should Be Equal    ${First_Name_field}    Huynh
    Should Be Equal As Strings    ${Last_Name_field}    Trinh
    Should Be Equal    ${E_Mail_field}    trinhtrinhhuynh4huynh2003@gmail.com
    Should Be Equal    ${Telephone_field}    0344171672
    Should Be Equal    ${Fax_field}    + 84 (8) 24567889
    Should Be Equal    ${Company_field}    Baa Baby
    Should Be Equal    ${Address_1_field}    Ấp Tân Thông 4, Xã Thanh Tân, Huyện Mỏ Cày Bắc, Tỉnh Bến Tre
    Should Be Equal    ${Address_2_field}    Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh
    Should Be Equal    ${City_field}    Hồ Chí Minh
    Should Be Equal    ${Region_tate_field}    3780
    Should Be Equal    ${ZIP_Code_field}    70000
    Should Be Equal    ${Country_field}    230
    Should Be Equal    ${Login_name_field}    chinhchinh2003
    Should Be Equal    ${Password_field}    ${EMPTY}
    Should Be Equal    ${Password_Confirm_field}    ${EMPTY}
    Close Browser
TC30: Nhập Login name chữ có dấu
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Click Element   ${Login_or_register} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Click Element   ${Continue}  
    Location Should Be    https://automationteststore.com/index.php?rt=account/create
     #Kiểm tra trường dữ liệu
    Page Should Contain Element    //*[@id="AccountFrm_firstname"]
    Page Should Contain Element    //*[@id="AccountFrm_lastname"]
    Page Should Contain Element    //*[@id="AccountFrm_email"]
    Page Should Contain Element    //*[@id="AccountFrm_fax"]
    Page Should Contain Element    //*[@id="AccountFrm_company"]
    Page Should Contain Element    //*[@id="AccountFrm_address_1"]
    Page Should Contain Element    //*[@id="AccountFrm_address_2"]
    Page Should Contain Element    //*[@id="AccountFrm_city"]
    Page Should Contain Element    //*[@id="AccountFrm_country_id"]
    Page Should Contain Element    //*[@id="AccountFrm_zone_id"]
    Page Should Contain Element    //*[@id="AccountFrm_postcode"]
    Page Should Contain Element    //*[@id="AccountFrm_loginname"]
    Page Should Contain Element    //*[@id="AccountFrm_password"]
    Page Should Contain Element    //*[@id="AccountFrm_confirm"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter1"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter0"]
    Page Should Contain Element    //*[@id="AccountFrm_agree"]
    Page Should Contain Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    #Nhập dữ liệu
    Input Text    //*[@id="AccountFrm_firstname"]    Huynh
    Input Text    //*[@id="AccountFrm_lastname"]    Trinh
    Input Text    //*[@id="AccountFrm_email"]    trinhtrinhhuynh4huynh2003@gmail.com
    Input Text    //*[@id="AccountFrm_telephone"]    0344171672
    Input Text    //*[@id="AccountFrm_fax"]    + 84 (8) 24567889
    Input Text    //*[@id="AccountFrm_company"]    Baa Baby
    Input Text    //*[@id="AccountFrm_address_1"]    Ấp Tân Thông 4, Xã Thanh Tân, Huyện Mỏ Cày Bắc, Tỉnh Bến Tre
    Input Text    //*[@id="AccountFrm_address_2"]    Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh
    Input Text    //*[@id="AccountFrm_city"]    Hồ Chí Minh
    Select From List By Value    //*[@id="AccountFrm_country_id"]    230
    Sleep    2s
    Select From List By Value    //*[@id="AccountFrm_zone_id"]    3780
    Input Text    //*[@id="AccountFrm_postcode"]    70000
    Input Text    //*[@id="AccountFrm_loginname"]    MộngTrinh
    Input Password    //*[@id="AccountFrm_password"]    Trinh@2003
    Input Password    //*[@id="AccountFrm_confirm"]    Trinh@2003
    Click Element    //*[@id="AccountFrm_newsletter1"]
    Click Element    //*[@id="AccountFrm_agree"]
    #Nhấn Đăng ký
    Click Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    2s
    #get text Error empty
    ${err_account}    Get Text    xpath=//div[@class="alert alert-error alert-danger"]
    ${Login_name}    Get Text    //*[@id="AccountFrm"]/div[3]/fieldset/div[1]/span
    
    Should Contain    ${err_account}    Login name must be alphanumeric only and between 5 and 64 characters!
    Should Be Equal    ${Login_name}    Login name must be alphanumeric only and between 5 and 64 characters!
    #Get text err field
    ${First_Name_field}    Get Value    //*[@id="AccountFrm_firstname"]
    ${Last_Name_field}    Get Value    //*[@id="AccountFrm_lastname"]
    ${E_Mail_field}    Get Value    //*[@id="AccountFrm_email"]
    ${Telephone_field}    Get Value    //*[@id="AccountFrm_telephone"]
    ${Fax_field}    Get Value    //*[@id="AccountFrm_fax"]
    ${Company_field}    Get Value    //*[@id="AccountFrm_company"]
    ${Address_1_field}    Get Value    //*[@id="AccountFrm_address_1"]
    ${Address_2_field}    Get Value    //*[@id="AccountFrm_address_2"]
    ${City_field}    Get Value    //*[@id="AccountFrm_city"]
    ${Region_tate_field}    Get Value    //*[@id="AccountFrm_zone_id"]
    ${ZIP_Code_field}    Get Value    //*[@id="AccountFrm_postcode"]
    ${Country_field}    Get Value    //*[@id="AccountFrm_country_id"]
    ${Login_name_field}    Get Value    //*[@id="AccountFrm_loginname"]
    Click Element    //*[@id="AccountFrm_newsletter1"]
    ${Password_field}    Get Value    //*[@id="AccountFrm_password"]
    Click Element    //*[@id="AccountFrm_agree"]
    ${Password_Confirm_field}    Get Value    //*[@id="AccountFrm_confirm"]
    #Kiểm tra các trường đã được điền chưa
    Should Be Equal    ${First_Name_field}    Huynh
    Should Be Equal As Strings    ${Last_Name_field}    Trinh
    Should Be Equal    ${E_Mail_field}    trinhtrinhhuynh4huynh2003@gmail.com
    Should Be Equal    ${Telephone_field}    0344171672
    Should Be Equal    ${Fax_field}    + 84 (8) 24567889
    Should Be Equal    ${Company_field}    Baa Baby
    Should Be Equal    ${Address_1_field}    Ấp Tân Thông 4, Xã Thanh Tân, Huyện Mỏ Cày Bắc, Tỉnh Bến Tre
    Should Be Equal    ${Address_2_field}    Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh
    Should Be Equal    ${City_field}    Hồ Chí Minh
    Should Be Equal    ${Region_tate_field}    3780
    Should Be Equal    ${ZIP_Code_field}    70000
    Should Be Equal    ${Country_field}    230
    Should Be Equal    ${Login_name_field}    MộngTrinh
    Should Be Equal    ${Password_field}    ${EMPTY}
    Should Be Equal    ${Password_Confirm_field}    ${EMPTY}
    Close Browser
TC31: Nhập Password dưới 4 ký tự
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Click Element   ${Login_or_register} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Click Element   ${Continue}  
    Location Should Be    https://automationteststore.com/index.php?rt=account/create
     #Kiểm tra trường dữ liệu
    Page Should Contain Element    //*[@id="AccountFrm_firstname"]
    Page Should Contain Element    //*[@id="AccountFrm_lastname"]
    Page Should Contain Element    //*[@id="AccountFrm_email"]
    Page Should Contain Element    //*[@id="AccountFrm_fax"]
    Page Should Contain Element    //*[@id="AccountFrm_company"]
    Page Should Contain Element    //*[@id="AccountFrm_address_1"]
    Page Should Contain Element    //*[@id="AccountFrm_address_2"]
    Page Should Contain Element    //*[@id="AccountFrm_city"]
    Page Should Contain Element    //*[@id="AccountFrm_country_id"]
    Page Should Contain Element    //*[@id="AccountFrm_zone_id"]
    Page Should Contain Element    //*[@id="AccountFrm_postcode"]
    Page Should Contain Element    //*[@id="AccountFrm_loginname"]
    Page Should Contain Element    //*[@id="AccountFrm_password"]
    Page Should Contain Element    //*[@id="AccountFrm_confirm"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter1"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter0"]
    Page Should Contain Element    //*[@id="AccountFrm_agree"]
    Page Should Contain Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    #Nhập dữ liệu
    Input Text    //*[@id="AccountFrm_firstname"]    Huynh
    Input Text    //*[@id="AccountFrm_lastname"]    Trinh
    Input Text    //*[@id="AccountFrm_email"]    trinhtrinhhuynh4huynh2003@gmail.com
    Input Text    //*[@id="AccountFrm_telephone"]    0344171672
    Input Text    //*[@id="AccountFrm_fax"]    + 84 (8) 24567889
    Input Text    //*[@id="AccountFrm_company"]    Baa Baby
    Input Text    //*[@id="AccountFrm_address_1"]    Ấp Tân Thông 4, Xã Thanh Tân, Huyện Mỏ Cày Bắc, Tỉnh Bến Tre
    Input Text    //*[@id="AccountFrm_address_2"]    Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh
    Input Text    //*[@id="AccountFrm_city"]    Hồ Chí Minh
    Select From List By Value    //*[@id="AccountFrm_country_id"]    230
    Sleep    2s
    Select From List By Value    //*[@id="AccountFrm_zone_id"]    3780
    Input Text    //*[@id="AccountFrm_postcode"]    70000
    Input Text    //*[@id="AccountFrm_loginname"]    trinhtrinhhuynh4
    Input Password    //*[@id="AccountFrm_password"]    tri
    Input Password    //*[@id="AccountFrm_confirm"]    tri
    Click Element    //*[@id="AccountFrm_newsletter1"]
    Click Element    //*[@id="AccountFrm_agree"]
    #Nhấn Đăng ký
    Click Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    2s
    #get text Error empty
    ${err_account}    Get Text    xpath=//div[@class="alert alert-error alert-danger"]
    ${Password}    Get Text    //*[@id="AccountFrm"]/div[3]/fieldset/div[2]/span
    
    Should Contain    ${err_account}    Password must be between 4 and 20 characters!
    Should Be Equal    ${Password}    Password must be between 4 and 20 characters!
    #Get text err field
    ${First_Name_field}    Get Value    //*[@id="AccountFrm_firstname"]
    ${Last_Name_field}    Get Value    //*[@id="AccountFrm_lastname"]
    ${E_Mail_field}    Get Value    //*[@id="AccountFrm_email"]
    ${Telephone_field}    Get Value    //*[@id="AccountFrm_telephone"]
    ${Fax_field}    Get Value    //*[@id="AccountFrm_fax"]
    ${Company_field}    Get Value    //*[@id="AccountFrm_company"]
    ${Address_1_field}    Get Value    //*[@id="AccountFrm_address_1"]
    ${Address_2_field}    Get Value    //*[@id="AccountFrm_address_2"]
    ${City_field}    Get Value    //*[@id="AccountFrm_city"]
    ${Region_tate_field}    Get Value    //*[@id="AccountFrm_zone_id"]
    ${ZIP_Code_field}    Get Value    //*[@id="AccountFrm_postcode"]
    ${Country_field}    Get Value    //*[@id="AccountFrm_country_id"]
    ${Login_name_field}    Get Value    //*[@id="AccountFrm_loginname"]
    ${Password_field}    Get Value    //*[@id="AccountFrm_password"]
    ${Password_Confirm_field}    Get Value    //*[@id="AccountFrm_confirm"]
    #Kiểm tra các trường đã được điền chưa
    Should Be Equal    ${First_Name_field}    Huynh
    Should Be Equal As Strings    ${Last_Name_field}    Trinh
    Should Be Equal    ${E_Mail_field}    trinhtrinhhuynh4huynh2003@gmail.com
    Should Be Equal    ${Telephone_field}    0344171672
    Should Be Equal    ${Fax_field}    + 84 (8) 24567889
    Should Be Equal    ${Company_field}    Baa Baby
    Should Be Equal    ${Address_1_field}    Ấp Tân Thông 4, Xã Thanh Tân, Huyện Mỏ Cày Bắc, Tỉnh Bến Tre
    Should Be Equal    ${Address_2_field}    Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh
    Should Be Equal    ${City_field}    Hồ Chí Minh
    Should Be Equal    ${Region_tate_field}    3780
    Should Be Equal    ${ZIP_Code_field}    70000
    Should Be Equal    ${Country_field}    230
    Should Be Equal    ${Login_name_field}    trinhtrinhhuynh4
    Should Be Equal    ${Password_field}    ${EMPTY}
    Should Be Equal    ${Password_Confirm_field}    ${EMPTY}
    Close Browser
TC32: Nhập Password trên 20 ký tự
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Click Element   ${Login_or_register} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Click Element   ${Continue}  
    Location Should Be    https://automationteststore.com/index.php?rt=account/create
     #Kiểm tra trường dữ liệu
    Page Should Contain Element    //*[@id="AccountFrm_firstname"]
    Page Should Contain Element    //*[@id="AccountFrm_lastname"]
    Page Should Contain Element    //*[@id="AccountFrm_email"]
    Page Should Contain Element    //*[@id="AccountFrm_fax"]
    Page Should Contain Element    //*[@id="AccountFrm_company"]
    Page Should Contain Element    //*[@id="AccountFrm_address_1"]
    Page Should Contain Element    //*[@id="AccountFrm_address_2"]
    Page Should Contain Element    //*[@id="AccountFrm_city"]
    Page Should Contain Element    //*[@id="AccountFrm_country_id"]
    Page Should Contain Element    //*[@id="AccountFrm_zone_id"]
    Page Should Contain Element    //*[@id="AccountFrm_postcode"]
    Page Should Contain Element    //*[@id="AccountFrm_loginname"]
    Page Should Contain Element    //*[@id="AccountFrm_password"]
    Page Should Contain Element    //*[@id="AccountFrm_confirm"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter1"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter0"]
    Page Should Contain Element    //*[@id="AccountFrm_agree"]
    Page Should Contain Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    #Nhập dữ liệu
    Input Text    //*[@id="AccountFrm_firstname"]    Huynh
    Input Text    //*[@id="AccountFrm_lastname"]    Trinh
    Input Text    //*[@id="AccountFrm_email"]    trinhtrinhhuynh4huynh2003@gmail.com
    Input Text    //*[@id="AccountFrm_telephone"]    0344171672
    Input Text    //*[@id="AccountFrm_fax"]    + 84 (8) 24567889
    Input Text    //*[@id="AccountFrm_company"]    Baa Baby
    Input Text    //*[@id="AccountFrm_address_1"]    Ấp Tân Thông 4, Xã Thanh Tân, Huyện Mỏ Cày Bắc, Tỉnh Bến Tre
    Input Text    //*[@id="AccountFrm_address_2"]    Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh
    Input Text    //*[@id="AccountFrm_city"]    Hồ Chí Minh
    Select From List By Value    //*[@id="AccountFrm_country_id"]    230
    Sleep    2s
    Select From List By Value    //*[@id="AccountFrm_zone_id"]    3780
    Input Text    //*[@id="AccountFrm_postcode"]    70000
    Input Text    //*[@id="AccountFrm_loginname"]    trinhtrinhhuynh4
    Input Password    //*[@id="AccountFrm_password"]    trinhhuynhhuynhuynhhuynhhuynhhhhhhhhhhh
    Input Password    //*[@id="AccountFrm_confirm"]    trinhhuynhhuynhuynhhuynhhuynhhhhhhhhhhh
    Click Element    //*[@id="AccountFrm_newsletter1"]
    Click Element    //*[@id="AccountFrm_agree"]
    #Nhấn Đăng ký
    Click Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    2s
    #get text Error empty
    ${err_account}    Get Text    xpath=//div[@class="alert alert-error alert-danger"]
    ${Password}    Get Text    //*[@id="AccountFrm"]/div[3]/fieldset/div[2]/span
    
    Should Contain    ${err_account}    Password must be between 4 and 20 characters!
    Should Be Equal    ${Password}    Password must be between 4 and 20 characters!
    #Get text err field
    ${First_Name_field}    Get Value    //*[@id="AccountFrm_firstname"]
    ${Last_Name_field}    Get Value    //*[@id="AccountFrm_lastname"]
    ${E_Mail_field}    Get Value    //*[@id="AccountFrm_email"]
    ${Telephone_field}    Get Value    //*[@id="AccountFrm_telephone"]
    ${Fax_field}    Get Value    //*[@id="AccountFrm_fax"]
    ${Company_field}    Get Value    //*[@id="AccountFrm_company"]
    ${Address_1_field}    Get Value    //*[@id="AccountFrm_address_1"]
    ${Address_2_field}    Get Value    //*[@id="AccountFrm_address_2"]
    ${City_field}    Get Value    //*[@id="AccountFrm_city"]
    ${Region_tate_field}    Get Value    //*[@id="AccountFrm_zone_id"]
    ${ZIP_Code_field}    Get Value    //*[@id="AccountFrm_postcode"]
    ${Country_field}    Get Value    //*[@id="AccountFrm_country_id"]
    ${Login_name_field}    Get Value    //*[@id="AccountFrm_loginname"]
    ${Password_field}    Get Value    //*[@id="AccountFrm_password"]
    ${Password_Confirm_field}    Get Value    //*[@id="AccountFrm_confirm"]
    #Kiểm tra các trường đã được điền chưa
    Should Be Equal    ${First_Name_field}    Huynh
    Should Be Equal As Strings    ${Last_Name_field}    Trinh
    Should Be Equal    ${E_Mail_field}    trinhtrinhhuynh4huynh2003@gmail.com
    Should Be Equal    ${Telephone_field}    0344171672
    Should Be Equal    ${Fax_field}    + 84 (8) 24567889
    Should Be Equal    ${Company_field}    Baa Baby
    Should Be Equal    ${Address_1_field}    Ấp Tân Thông 4, Xã Thanh Tân, Huyện Mỏ Cày Bắc, Tỉnh Bến Tre
    Should Be Equal    ${Address_2_field}    Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh
    Should Be Equal    ${City_field}    Hồ Chí Minh
    Should Be Equal    ${Region_tate_field}    3780
    Should Be Equal    ${ZIP_Code_field}    70000
    Should Be Equal    ${Country_field}    230
    Should Be Equal    ${Login_name_field}    trinhtrinhhuynh4
    Should Be Equal    ${Password_field}    ${EMPTY}
    Should Be Equal    ${Password_Confirm_field}    ${EMPTY}
    Close Browser
TC33: Nhập Nhập Password Confirm không khớp với mật khẩu
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Click Element   ${Login_or_register} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Click Element   ${Continue}  
    Location Should Be    https://automationteststore.com/index.php?rt=account/create
     #Kiểm tra trường dữ liệu
    Page Should Contain Element    //*[@id="AccountFrm_firstname"]
    Page Should Contain Element    //*[@id="AccountFrm_lastname"]
    Page Should Contain Element    //*[@id="AccountFrm_email"]
    Page Should Contain Element    //*[@id="AccountFrm_fax"]
    Page Should Contain Element    //*[@id="AccountFrm_company"]
    Page Should Contain Element    //*[@id="AccountFrm_address_1"]
    Page Should Contain Element    //*[@id="AccountFrm_address_2"]
    Page Should Contain Element    //*[@id="AccountFrm_city"]
    Page Should Contain Element    //*[@id="AccountFrm_country_id"]
    Page Should Contain Element    //*[@id="AccountFrm_zone_id"]
    Page Should Contain Element    //*[@id="AccountFrm_postcode"]
    Page Should Contain Element    //*[@id="AccountFrm_loginname"]
    Page Should Contain Element    //*[@id="AccountFrm_password"]
    Page Should Contain Element    //*[@id="AccountFrm_confirm"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter1"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter0"]
    Page Should Contain Element    //*[@id="AccountFrm_agree"]
    Page Should Contain Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    #Nhập dữ liệu
    Input Text    //*[@id="AccountFrm_firstname"]    Huynh
    Input Text    //*[@id="AccountFrm_lastname"]    Trinh
    Input Text    //*[@id="AccountFrm_email"]    trinhtrinhhuynh4huynh2003@gmail.com
    Input Text    //*[@id="AccountFrm_telephone"]            0344171672
    Input Text    //*[@id="AccountFrm_fax"]    + 84 (8) 24567889
    Input Text    //*[@id="AccountFrm_company"]    Baa Baby
    Input Text    //*[@id="AccountFrm_address_1"]    Ấp Tân Thông 4, Xã Thanh Tân, Huyện Mỏ Cày Bắc, Tỉnh Bến Tre
    Input Text    //*[@id="AccountFrm_address_2"]    Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh
    Input Text    //*[@id="AccountFrm_city"]    Hồ Chí Minh
    Select From List By Value    //*[@id="AccountFrm_country_id"]    230
    Sleep    2s
    Select From List By Value    //*[@id="AccountFrm_zone_id"]    3780
    Input Text    //*[@id="AccountFrm_postcode"]    70000
    Input Text    //*[@id="AccountFrm_loginname"]    trinhtrinhhuynh4
    Input Password    //*[@id="AccountFrm_password"]    trinhhuynh
    Input Password    //*[@id="AccountFrm_confirm"]    trinh1234
    Click Element    //*[@id="AccountFrm_agree"]
    #Nhấn Đăng ký
    Click Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    2s
    #get text Error empty
    ${err_account}    Get Text    xpath=//div[@class="alert alert-error alert-danger"]
    ${Password_Confirm}    Get Text    //*[@id="AccountFrm"]/div[3]/fieldset/div[3]/span
    
    Should Contain    ${err_account}    Password confirmation does not match password!
    Should Be Equal    ${Password_Confirm}    Password confirmation does not match password!
    #Get text err field
    ${First_Name_field}    Get Value    //*[@id="AccountFrm_firstname"]
    ${Last_Name_field}    Get Value    //*[@id="AccountFrm_lastname"]
    ${E_Mail_field}    Get Value    //*[@id="AccountFrm_email"]
    ${Telephone_field}    Get Value    //*[@id="AccountFrm_telephone"]
    ${Fax_field}    Get Value    //*[@id="AccountFrm_fax"]
    ${Company_field}    Get Value    //*[@id="AccountFrm_company"]
    ${Address_1_field}    Get Value    //*[@id="AccountFrm_address_1"]
    ${Address_2_field}    Get Value    //*[@id="AccountFrm_address_2"]
    ${City_field}    Get Value    //*[@id="AccountFrm_city"]
    ${Region_tate_field}    Get Value    //*[@id="AccountFrm_zone_id"]
    ${ZIP_Code_field}    Get Value    //*[@id="AccountFrm_postcode"]
    ${Country_field}    Get Value    //*[@id="AccountFrm_country_id"]
    ${Login_name_field}    Get Value    //*[@id="AccountFrm_loginname"]
    ${Password_field}    Get Value    //*[@id="AccountFrm_password"]
    ${Password_Confirm_field}    Get Value    //*[@id="AccountFrm_confirm"]
    #Kiểm tra các trường đã được điền chưa
    Should Be Equal    ${First_Name_field}    Huynh
    Should Be Equal As Strings    ${Last_Name_field}    Trinh
    Should Be Equal    ${E_Mail_field}    trinhtrinhhuynh4huynh2003@gmail.com
    Should Be Equal    ${Telephone_field}    0344171672
    Should Be Equal    ${Fax_field}    + 84 (8) 24567889
    Should Be Equal    ${Company_field}    Baa Baby
    Should Be Equal    ${Address_1_field}    Ấp Tân Thông 4, Xã Thanh Tân, Huyện Mỏ Cày Bắc, Tỉnh Bến Tre
    Should Be Equal    ${Address_2_field}    Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh
    Should Be Equal    ${City_field}    Hồ Chí Minh
    Should Be Equal    ${Region_tate_field}    3780
    Should Be Equal    ${ZIP_Code_field}    70000
    Should Be Equal    ${Country_field}    230
    Should Be Equal    ${Login_name_field}    trinhtrinhhuynh4
    Should Be Equal    ${Password_field}    ${EMPTY}
    Should Be Equal    ${Password_Confirm_field}    ${EMPTY}
    Close Browser
TC34: nhập First Name là số
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Click Element   ${Login_or_register} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Click Element   ${Continue}  
    Location Should Be    https://automationteststore.com/index.php?rt=account/create
    #Kiểm tra trường dữ liệu
    Page Should Contain Element    //*[@id="AccountFrm_firstname"]
    Page Should Contain Element    //*[@id="AccountFrm_lastname"]
    Page Should Contain Element    //*[@id="AccountFrm_email"]
    Page Should Contain Element    //*[@id="AccountFrm_fax"]
    Page Should Contain Element    //*[@id="AccountFrm_company"]
    Page Should Contain Element    //*[@id="AccountFrm_address_1"]
    Page Should Contain Element    //*[@id="AccountFrm_address_2"]
    Page Should Contain Element    //*[@id="AccountFrm_city"]
    Page Should Contain Element    //*[@id="AccountFrm_country_id"]
    Page Should Contain Element    //*[@id="AccountFrm_zone_id"]
    Page Should Contain Element    //*[@id="AccountFrm_postcode"]
    Page Should Contain Element    //*[@id="AccountFrm_loginname"]
    Page Should Contain Element    //*[@id="AccountFrm_password"]
    Page Should Contain Element    //*[@id="AccountFrm_confirm"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter1"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter0"]
    Page Should Contain Element    //*[@id="AccountFrm_agree"]
    Page Should Contain Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    

    #Nhập dữ liệu
    Input Text    //*[@id="AccountFrm_firstname"]    3645724
    Input Text    //*[@id="AccountFrm_lastname"]    Tiêu
    Input Text    //*[@id="AccountFrm_email"]    trinhtieu1234@gmail.com
    Input Text    //*[@id="AccountFrm_telephone"]    0394583345
    Input Text    //*[@id="AccountFrm_fax"]    + 84 (8) 3434545
    Input Text    //*[@id="AccountFrm_company"]    ABC
    Input Text    //*[@id="AccountFrm_address_1"]    Long An
    Input Text    //*[@id="AccountFrm_address_2"]    Long An
    Input Text    //*[@id="AccountFrm_city"]    Bình Thuận
    Select From List By Value    //*[@id="AccountFrm_country_id"]    230
    Sleep    2s
    Select From List By Value    //*[@id="AccountFrm_zone_id"]    3761
    Input Text    //*[@id="AccountFrm_postcode"]    934857
    Input Text    //*[@id="AccountFrm_loginname"]    trinhtieu1
    Input Password    //*[@id="AccountFrm_password"]    hahahaha
    Input Password    //*[@id="AccountFrm_confirm"]    hahahaha
    Click Element    //*[@id="AccountFrm_newsletter1"]
    Click Element    //*[@id="AccountFrm_agree"]
    #Nhấn Đăng ký
    Click Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    2s
    Location Should Be    https://automationteststore.com/index.php?rt=account/success
    Close Browser
TC35: Nhập sai định dạng số điện thoại
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Click Element   ${Login_or_register} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Click Element   ${Continue}  
    Location Should Be    https://automationteststore.com/index.php?rt=account/create
    #Kiểm tra trường dữ liệu
    Page Should Contain Element    //*[@id="AccountFrm_firstname"]
    Page Should Contain Element    //*[@id="AccountFrm_lastname"]
    Page Should Contain Element    //*[@id="AccountFrm_email"]
    Page Should Contain Element    //*[@id="AccountFrm_fax"]
    Page Should Contain Element    //*[@id="AccountFrm_company"]
    Page Should Contain Element    //*[@id="AccountFrm_address_1"]
    Page Should Contain Element    //*[@id="AccountFrm_address_2"]
    Page Should Contain Element    //*[@id="AccountFrm_city"]
    Page Should Contain Element    //*[@id="AccountFrm_country_id"]
    Page Should Contain Element    //*[@id="AccountFrm_zone_id"]
    Page Should Contain Element    //*[@id="AccountFrm_postcode"]
    Page Should Contain Element    //*[@id="AccountFrm_loginname"]
    Page Should Contain Element    //*[@id="AccountFrm_password"]
    Page Should Contain Element    //*[@id="AccountFrm_confirm"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter1"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter0"]
    Page Should Contain Element    //*[@id="AccountFrm_agree"]
    Page Should Contain Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    

    #Nhập dữ liệu
    Input Text    //*[@id="AccountFrm_firstname"]    Dinh
    Input Text    //*[@id="AccountFrm_lastname"]    Tinh
    Input Text    //*[@id="AccountFrm_email"]    dinhthitinh20051@gmail.com
    Input Text    //*[@id="AccountFrm_telephone"]    71672
    Input Text    //*[@id="AccountFrm_fax"]    + 84 (8) 24567889
    Input Text    //*[@id="AccountFrm_company"]    BIDV
    Input Text    //*[@id="AccountFrm_address_1"]    Bạc Liêu
    Input Text    //*[@id="AccountFrm_address_2"]    Hậu Giang
    Input Text    //*[@id="AccountFrm_city"]    Hồ Chí Minh
    Select From List By Value    //*[@id="AccountFrm_country_id"]    230
    Sleep    2s
    Select From List By Value    //*[@id="AccountFrm_zone_id"]    3781
    Input Text    //*[@id="AccountFrm_postcode"]    70000
    Input Text    //*[@id="AccountFrm_loginname"]    dinhtinh1
    Input Password    //*[@id="AccountFrm_password"]    123456
    Input Password    //*[@id="AccountFrm_confirm"]    123456
    Click Element    //*[@id="AccountFrm_newsletter1"]
    Click Element    //*[@id="AccountFrm_agree"]
    #Nhấn Đăng ký
    Click Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    2s
    Location Should Be    https://automationteststore.com/index.php?rt=account/success
    Close Browser
TC36: Nhập số điện thoại là chữ
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Click Element   ${Login_or_register} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Click Element   ${Continue}  
    Location Should Be    https://automationteststore.com/index.php?rt=account/create
    #Kiểm tra trường dữ liệu
    Page Should Contain Element    //*[@id="AccountFrm_firstname"]
    Page Should Contain Element    //*[@id="AccountFrm_lastname"]
    Page Should Contain Element    //*[@id="AccountFrm_email"]
    Page Should Contain Element    //*[@id="AccountFrm_fax"]
    Page Should Contain Element    //*[@id="AccountFrm_company"]
    Page Should Contain Element    //*[@id="AccountFrm_address_1"]
    Page Should Contain Element    //*[@id="AccountFrm_address_2"]
    Page Should Contain Element    //*[@id="AccountFrm_city"]
    Page Should Contain Element    //*[@id="AccountFrm_country_id"]
    Page Should Contain Element    //*[@id="AccountFrm_zone_id"]
    Page Should Contain Element    //*[@id="AccountFrm_postcode"]
    Page Should Contain Element    //*[@id="AccountFrm_loginname"]
    Page Should Contain Element    //*[@id="AccountFrm_password"]
    Page Should Contain Element    //*[@id="AccountFrm_confirm"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter1"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter0"]
    Page Should Contain Element    //*[@id="AccountFrm_agree"]
    Page Should Contain Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    

    #Nhập dữ liệu
    Input Text    //*[@id="AccountFrm_firstname"]    Tung
    Input Text    //*[@id="AccountFrm_lastname"]    Duong
    Input Text    //*[@id="AccountFrm_email"]    tungduong2331@gmail.com
    Input Text    //*[@id="AccountFrm_telephone"]    sdfhsdfkkjf
    Input Text    //*[@id="AccountFrm_fax"]    + 84 (8) 3874575
    Input Text    //*[@id="AccountFrm_company"]    NIKE
    Input Text    //*[@id="AccountFrm_address_1"]    Trà Vinh
    Input Text    //*[@id="AccountFrm_address_2"]    Vĩnh Long
    Input Text    //*[@id="AccountFrm_city"]    Hồ Chí Minh
    Select From List By Value    //*[@id="AccountFrm_country_id"]    230
    Sleep    2s
    Select From List By Value    //*[@id="AccountFrm_zone_id"]    3780
    Input Text    //*[@id="AccountFrm_postcode"]    70000
    Input Text    //*[@id="AccountFrm_loginname"]    tungduong38431
    Input Password    //*[@id="AccountFrm_password"]    bahahaha
    Input Password    //*[@id="AccountFrm_confirm"]    bahahaha
    Click Element    //*[@id="AccountFrm_newsletter1"]
    Click Element    //*[@id="AccountFrm_agree"]
    #Nhấn Đăng ký
    Click Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    2s
    Location Should Be    https://automationteststore.com/index.php?rt=account/success
    Close Browser
TC37: Nhập địa chỉ 1 là số
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Click Element   ${Login_or_register} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Click Element   ${Continue}  
    Location Should Be    https://automationteststore.com/index.php?rt=account/create
    #Kiểm tra trường dữ liệu
    Page Should Contain Element    //*[@id="AccountFrm_firstname"]
    Page Should Contain Element    //*[@id="AccountFrm_lastname"]
    Page Should Contain Element    //*[@id="AccountFrm_email"]
    Page Should Contain Element    //*[@id="AccountFrm_fax"]
    Page Should Contain Element    //*[@id="AccountFrm_company"]
    Page Should Contain Element    //*[@id="AccountFrm_address_1"]
    Page Should Contain Element    //*[@id="AccountFrm_address_2"]
    Page Should Contain Element    //*[@id="AccountFrm_city"]
    Page Should Contain Element    //*[@id="AccountFrm_country_id"]
    Page Should Contain Element    //*[@id="AccountFrm_zone_id"]
    Page Should Contain Element    //*[@id="AccountFrm_postcode"]
    Page Should Contain Element    //*[@id="AccountFrm_loginname"]
    Page Should Contain Element    //*[@id="AccountFrm_password"]
    Page Should Contain Element    //*[@id="AccountFrm_confirm"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter1"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter0"]
    Page Should Contain Element    //*[@id="AccountFrm_agree"]
    Page Should Contain Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    

    #Nhập dữ liệu
    Input Text    //*[@id="AccountFrm_firstname"]    Võ
    Input Text    //*[@id="AccountFrm_lastname"]    Thiên
    Input Text    //*[@id="AccountFrm_email"]    vophungthien17111@gmail.com
    Input Text    //*[@id="AccountFrm_telephone"]    0344171672
    Input Text    //*[@id="AccountFrm_fax"]    + 84 (8) 24567889
    Input Text    //*[@id="AccountFrm_company"]    Adidas
    Input Text    //*[@id="AccountFrm_address_1"]    11111111111111111111111111111
    Input Text    //*[@id="AccountFrm_address_2"]    Hồ Chí Minh
    Input Text    //*[@id="AccountFrm_city"]    Hồ Chí Minh
    Select From List By Value    //*[@id="AccountFrm_country_id"]    230
    Sleep    2s
    Select From List By Value    //*[@id="AccountFrm_zone_id"]    3780
    Input Text    //*[@id="AccountFrm_postcode"]    70000
    Input Text    //*[@id="AccountFrm_loginname"]    thienvo17111
    Input Password    //*[@id="AccountFrm_password"]    thienvo#1711
    Input Password    //*[@id="AccountFrm_confirm"]    thienvo#1711
    Click Element    //*[@id="AccountFrm_newsletter1"]
    Click Element    //*[@id="AccountFrm_agree"]
    #Nhấn Đăng ký
    Click Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    2s
    Location Should Be    https://automationteststore.com/index.php?rt=account/success
    Close Browser
TC38: Nhập City là số
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Click Element   ${Login_or_register} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Click Element   ${Continue}  
    Location Should Be    https://automationteststore.com/index.php?rt=account/create
    #Kiểm tra trường dữ liệu
    Page Should Contain Element    //*[@id="AccountFrm_firstname"]
    Page Should Contain Element    //*[@id="AccountFrm_lastname"]
    Page Should Contain Element    //*[@id="AccountFrm_email"]
    Page Should Contain Element    //*[@id="AccountFrm_fax"]
    Page Should Contain Element    //*[@id="AccountFrm_company"]
    Page Should Contain Element    //*[@id="AccountFrm_address_1"]
    Page Should Contain Element    //*[@id="AccountFrm_address_2"]
    Page Should Contain Element    //*[@id="AccountFrm_city"]
    Page Should Contain Element    //*[@id="AccountFrm_country_id"]
    Page Should Contain Element    //*[@id="AccountFrm_zone_id"]
    Page Should Contain Element    //*[@id="AccountFrm_postcode"]
    Page Should Contain Element    //*[@id="AccountFrm_loginname"]
    Page Should Contain Element    //*[@id="AccountFrm_password"]
    Page Should Contain Element    //*[@id="AccountFrm_confirm"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter1"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter0"]
    Page Should Contain Element    //*[@id="AccountFrm_agree"]
    Page Should Contain Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    #Nhập dữ liệu
    Input Text    //*[@id="AccountFrm_firstname"]    Cao
    Input Text    //*[@id="AccountFrm_lastname"]    Chau
    Input Text    //*[@id="AccountFrm_email"]    caothiminhchau17011@gmail.com
    Input Text    //*[@id="AccountFrm_telephone"]    0344171672
    Input Text    //*[@id="AccountFrm_fax"]    + 84 (8) 24567889
    Input Text    //*[@id="AccountFrm_company"]    Baa Baby
    Input Text    //*[@id="AccountFrm_address_1"]    Hưng Yên
    Input Text    //*[@id="AccountFrm_address_2"]    Thành phố Hồ Chí Minh
    Input Text    //*[@id="AccountFrm_city"]    1111111111
    Select From List By Value    //*[@id="AccountFrm_country_id"]    230
    Sleep    2s
    Select From List By Value    //*[@id="AccountFrm_zone_id"]    3782
    Input Text    //*[@id="AccountFrm_postcode"]    70000
    Input Text    //*[@id="AccountFrm_loginname"]    chaucao17011
    Input Password    //*[@id="AccountFrm_password"]    chaucao
    Input Password    //*[@id="AccountFrm_confirm"]    chaucao
    Click Element    //*[@id="AccountFrm_newsletter1"]
    Click Element    //*[@id="AccountFrm_agree"]
    #Nhấn Đăng ký
    Click Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    2s
    Location Should Be    https://automationteststore.com/index.php?rt=account/success
    Close Browser
TC39: Nhập City không tồn tại
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Click Element   ${Login_or_register} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Click Element   ${Continue}  
    Location Should Be    https://automationteststore.com/index.php?rt=account/create
    #Kiểm tra trường dữ liệu
    Page Should Contain Element    //*[@id="AccountFrm_firstname"]
    Page Should Contain Element    //*[@id="AccountFrm_lastname"]
    Page Should Contain Element    //*[@id="AccountFrm_email"]
    Page Should Contain Element    //*[@id="AccountFrm_fax"]
    Page Should Contain Element    //*[@id="AccountFrm_company"]
    Page Should Contain Element    //*[@id="AccountFrm_address_1"]
    Page Should Contain Element    //*[@id="AccountFrm_address_2"]
    Page Should Contain Element    //*[@id="AccountFrm_city"]
    Page Should Contain Element    //*[@id="AccountFrm_country_id"]
    Page Should Contain Element    //*[@id="AccountFrm_zone_id"]
    Page Should Contain Element    //*[@id="AccountFrm_postcode"]
    Page Should Contain Element    //*[@id="AccountFrm_loginname"]
    Page Should Contain Element    //*[@id="AccountFrm_password"]
    Page Should Contain Element    //*[@id="AccountFrm_confirm"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter1"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter0"]
    Page Should Contain Element    //*[@id="AccountFrm_agree"]
    Page Should Contain Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    

    #Nhập dữ liệu
    Input Text    //*[@id="AccountFrm_firstname"]    Huynh
    Input Text    //*[@id="AccountFrm_lastname"]    Trinh
    Input Text    //*[@id="AccountFrm_email"]    ttrinhtrinhhuynh311huynh2003@gmail.com
    Input Text    //*[@id="AccountFrm_telephone"]    0344171672
    Input Text    //*[@id="AccountFrm_fax"]    + 84 (8) 24567889
    Input Text    //*[@id="AccountFrm_company"]    Baa Baby
    Input Text    //*[@id="AccountFrm_address_1"]    Ấp Tân Thông 4, Xã Thanh Tân, Huyện Mỏ Cày Bắc, Tỉnh Bến Tre
    Input Text    //*[@id="AccountFrm_address_2"]    Đường Lê Thị Kỉnh, Ấp 3, Xã Phước Kiển, Huyện Nhà Bè, Thành phố Hồ Chí Minh
    Input Text    //*[@id="AccountFrm_city"]    heheehe
    Select From List By Value    //*[@id="AccountFrm_country_id"]    230
    Sleep    2s
    Select From List By Value    //*[@id="AccountFrm_zone_id"]    3780
    Input Text    //*[@id="AccountFrm_postcode"]    70000
    Input Text    //*[@id="AccountFrm_loginname"]    ttrinhtrinhhuynh311
    Input Password    //*[@id="AccountFrm_password"]    Trinh@2003
    Input Password    //*[@id="AccountFrm_confirm"]    Trinh@2003
    Click Element    //*[@id="AccountFrm_newsletter1"]
    Click Element    //*[@id="AccountFrm_agree"]
    #Nhấn Đăng ký
    Click Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    2s
    Location Should Be    https://automationteststore.com/index.php?rt=account/success
    Close Browser
TC40: Chọn Khác tỉnh nhưng để ZIP code HCM
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Click Element   ${Login_or_register} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Click Element   ${Continue}  
    Location Should Be    https://automationteststore.com/index.php?rt=account/create
    #Kiểm tra trường dữ liệu
    Page Should Contain Element    //*[@id="AccountFrm_firstname"]
    Page Should Contain Element    //*[@id="AccountFrm_lastname"]
    Page Should Contain Element    //*[@id="AccountFrm_email"]
    Page Should Contain Element    //*[@id="AccountFrm_fax"]
    Page Should Contain Element    //*[@id="AccountFrm_company"]
    Page Should Contain Element    //*[@id="AccountFrm_address_1"]
    Page Should Contain Element    //*[@id="AccountFrm_address_2"]
    Page Should Contain Element    //*[@id="AccountFrm_city"]
    Page Should Contain Element    //*[@id="AccountFrm_country_id"]
    Page Should Contain Element    //*[@id="AccountFrm_zone_id"]
    Page Should Contain Element    //*[@id="AccountFrm_postcode"]
    Page Should Contain Element    //*[@id="AccountFrm_loginname"]
    Page Should Contain Element    //*[@id="AccountFrm_password"]
    Page Should Contain Element    //*[@id="AccountFrm_confirm"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter1"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter0"]
    Page Should Contain Element    //*[@id="AccountFrm_agree"]
    Page Should Contain Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    

    #Nhập dữ liệu
    Input Text    //*[@id="AccountFrm_firstname"]    Huỳnh
    Input Text    //*[@id="AccountFrm_lastname"]    Trinh
    Input Text    //*[@id="AccountFrm_email"]    huynhthimongtrinh09871@gmail.com
    Input Text    //*[@id="AccountFrm_telephone"]    09458345
    Input Text    //*[@id="AccountFrm_fax"]    + 84 (8) 24567889
    Input Text    //*[@id="AccountFrm_company"]    Chanel
    Input Text    //*[@id="AccountFrm_address_1"]    Vũng Tàu
    Input Text    //*[@id="AccountFrm_address_2"]    Hòa Bình
    Input Text    //*[@id="AccountFrm_city"]    Hồ Chí Minh
    Select From List By Value    //*[@id="AccountFrm_country_id"]    230
    Sleep    2s
    Select From List By Value    //*[@id="AccountFrm_zone_id"]    3779
    Input Text    //*[@id="AccountFrm_postcode"]    847534
    Input Text    //*[@id="AccountFrm_loginname"]    trinhhuynh0981
    Input Password    //*[@id="AccountFrm_password"]    trinhhehe
    Input Password    //*[@id="AccountFrm_confirm"]    trinhhehe
    Click Element    //*[@id="AccountFrm_newsletter1"]
    Click Element    //*[@id="AccountFrm_agree"]
    #Nhấn Đăng ký
    Click Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    2s
    Location Should Be    https://automationteststore.com/index.php?rt=account/success
    Close Browser
TC41: Chọn Hồ CHí Minh nhưng để sai ZIP Code
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Click Element   ${Login_or_register} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Click Element   ${Continue}  
    Location Should Be    https://automationteststore.com/index.php?rt=account/create
    #Kiểm tra trường dữ liệu
    Page Should Contain Element    //*[@id="AccountFrm_firstname"]
    Page Should Contain Element    //*[@id="AccountFrm_lastname"]
    Page Should Contain Element    //*[@id="AccountFrm_email"]
    Page Should Contain Element    //*[@id="AccountFrm_fax"]
    Page Should Contain Element    //*[@id="AccountFrm_company"]
    Page Should Contain Element    //*[@id="AccountFrm_address_1"]
    Page Should Contain Element    //*[@id="AccountFrm_address_2"]
    Page Should Contain Element    //*[@id="AccountFrm_city"]
    Page Should Contain Element    //*[@id="AccountFrm_country_id"]
    Page Should Contain Element    //*[@id="AccountFrm_zone_id"]
    Page Should Contain Element    //*[@id="AccountFrm_postcode"]
    Page Should Contain Element    //*[@id="AccountFrm_loginname"]
    Page Should Contain Element    //*[@id="AccountFrm_password"]
    Page Should Contain Element    //*[@id="AccountFrm_confirm"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter1"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter0"]
    Page Should Contain Element    //*[@id="AccountFrm_agree"]
    Page Should Contain Element    //*[@id="AccountFrm"]/div[5]/div/div/button

    #Nhập dữ liệu
    Input Text    //*[@id="AccountFrm_firstname"]    Tiêu
    Input Text    //*[@id="AccountFrm_lastname"]    Chiến
    Input Text    //*[@id="AccountFrm_email"]    tieuchien81@gmail.com
    Input Text    //*[@id="AccountFrm_telephone"]    093546433
    Input Text    //*[@id="AccountFrm_fax"]    + 84 (8) 4573645
    Input Text    //*[@id="AccountFrm_company"]    Gucci
    Input Text    //*[@id="AccountFrm_address_1"]    Bến Tre
    Input Text    //*[@id="AccountFrm_address_2"]    Hồ Chí Minh
    Input Text    //*[@id="AccountFrm_city"]    Hồ Chí Minh
    Select From List By Value    //*[@id="AccountFrm_country_id"]    230
    Sleep    2s
    Select From List By Value    //*[@id="AccountFrm_zone_id"]    3780
    Input Text    //*[@id="AccountFrm_postcode"]    356238
    Input Text    //*[@id="AccountFrm_loginname"]    tieuchienn
    Input Password    //*[@id="AccountFrm_password"]    tieuchien$1981
    Input Password    //*[@id="AccountFrm_confirm"]    tieuchien$1981
    Click Element    //*[@id="AccountFrm_newsletter1"]
    Click Element    //*[@id="AccountFrm_agree"]
    #Nhấn Đăng ký
    Click Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    2s
    Location Should Be    https://automationteststore.com/index.php?rt=account/success
    Close Browser
TC42: Nhập Login name với số
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Click Element   ${Login_or_register} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Click Element   ${Continue}  
    Location Should Be    https://automationteststore.com/index.php?rt=account/create
    #Kiểm tra trường dữ liệu
    Page Should Contain Element    //*[@id="AccountFrm_firstname"]
    Page Should Contain Element    //*[@id="AccountFrm_lastname"]
    Page Should Contain Element    //*[@id="AccountFrm_email"]
    Page Should Contain Element    //*[@id="AccountFrm_fax"]
    Page Should Contain Element    //*[@id="AccountFrm_company"]
    Page Should Contain Element    //*[@id="AccountFrm_address_1"]
    Page Should Contain Element    //*[@id="AccountFrm_address_2"]
    Page Should Contain Element    //*[@id="AccountFrm_city"]
    Page Should Contain Element    //*[@id="AccountFrm_country_id"]
    Page Should Contain Element    //*[@id="AccountFrm_zone_id"]
    Page Should Contain Element    //*[@id="AccountFrm_postcode"]
    Page Should Contain Element    //*[@id="AccountFrm_loginname"]
    Page Should Contain Element    //*[@id="AccountFrm_password"]
    Page Should Contain Element    //*[@id="AccountFrm_confirm"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter1"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter0"]
    Page Should Contain Element    //*[@id="AccountFrm_agree"]
    Page Should Contain Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    

    #Nhập dữ liệu
    Input Text    //*[@id="AccountFrm_firstname"]    Cây
    Input Text    //*[@id="AccountFrm_lastname"]    Dừa
    Input Text    //*[@id="AccountFrm_email"]    caydua2002@gmail.com
    Input Text    //*[@id="AccountFrm_telephone"]    0358475
    Input Text    //*[@id="AccountFrm_fax"]    + 84 (8) 8457835
    Input Text    //*[@id="AccountFrm_company"]    Baa Baby
    Input Text    //*[@id="AccountFrm_address_1"]    Cao Bằng
    Input Text    //*[@id="AccountFrm_address_2"]    Bình Định
    Input Text    //*[@id="AccountFrm_city"]    Bình Định
    Select From List By Value    //*[@id="AccountFrm_country_id"]    230
    Sleep    2s
    Select From List By Value    //*[@id="AccountFrm_zone_id"]    3758
    Input Text    //*[@id="AccountFrm_postcode"]    70000
    Input Text    //*[@id="AccountFrm_loginname"]    46346563
    Input Password    //*[@id="AccountFrm_password"]    caydua@2003
    Input Password    //*[@id="AccountFrm_confirm"]    caydua@2003
    Click Element    //*[@id="AccountFrm_newsletter1"]
    Click Element    //*[@id="AccountFrm_agree"]
    #Nhấn Đăng ký
    Click Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    2s
    Location Should Be    https://automationteststore.com/index.php?rt=account/success
    Close Browser
TC43: đăng ký với kích thước màn hìinh tự do
    Open Browser    ${URL}    Chrome
    #Maximize Browser Window
    Click Element   ${Login_or_register} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Click Element   ${Continue}  
    Location Should Be    https://automationteststore.com/index.php?rt=account/create
    #Kiểm tra trường dữ liệu
    Page Should Contain Element    //*[@id="AccountFrm_firstname"]
    Page Should Contain Element    //*[@id="AccountFrm_lastname"]
    Page Should Contain Element    //*[@id="AccountFrm_email"]
    Page Should Contain Element    //*[@id="AccountFrm_fax"]
    Page Should Contain Element    //*[@id="AccountFrm_company"]
    Page Should Contain Element    //*[@id="AccountFrm_address_1"]
    Page Should Contain Element    //*[@id="AccountFrm_address_2"]
    Page Should Contain Element    //*[@id="AccountFrm_city"]
    Page Should Contain Element    //*[@id="AccountFrm_country_id"]
    Page Should Contain Element    //*[@id="AccountFrm_zone_id"]
    Page Should Contain Element    //*[@id="AccountFrm_postcode"]
    Page Should Contain Element    //*[@id="AccountFrm_loginname"]
    Page Should Contain Element    //*[@id="AccountFrm_password"]
    Page Should Contain Element    //*[@id="AccountFrm_confirm"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter1"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter0"]
    Page Should Contain Element    //*[@id="AccountFrm_agree"]
    Page Should Contain Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    

    #Nhập dữ liệu
    Input Text    //*[@id="AccountFrm_firstname"]    Lê
    Input Text    //*[@id="AccountFrm_lastname"]    Trinh
    Input Text    //*[@id="AccountFrm_email"]    motngayvuivee@gmail.com
    Input Text    //*[@id="AccountFrm_telephone"]    0344171672
    Input Text    //*[@id="AccountFrm_fax"]    + 84 (8) 24567889
    Input Text    //*[@id="AccountFrm_company"]    Baa Baby
    Input Text    //*[@id="AccountFrm_address_1"]    Bắc Kạn
    Input Text    //*[@id="AccountFrm_address_2"]    Hải Phòng
    Input Text    //*[@id="AccountFrm_city"]    Cần Thơ
    Select From List By Value    //*[@id="AccountFrm_country_id"]    230
    Sleep    2s
    Select From List By Value    //*[@id="AccountFrm_zone_id"]    3763
    Input Text    //*[@id="AccountFrm_postcode"]    62548
    Input Text    //*[@id="AccountFrm_loginname"]    motngayvuivee
    Input Password    //*[@id="AccountFrm_password"]    vuivequa*#
    Input Password    //*[@id="AccountFrm_confirm"]    vuivequa*#
    Click Element    //*[@id="AccountFrm_newsletter1"]
    Click Element    //*[@id="AccountFrm_agree"]
    #Nhấn Đăng ký
    Click Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    2s
    Location Should Be    https://automationteststore.com/index.php?rt=account/success
    Close Browser

TC44: Đăng ký với fname và lname có ký tự đặc biệt và có khoản trắng 
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Click Element   ${Login_or_register} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Click Element   ${Continue}  
    Location Should Be    https://automationteststore.com/index.php?rt=account/create
    #Kiểm tra trường dữ liệu
    Page Should Contain Element    //*[@id="AccountFrm_firstname"]
    Page Should Contain Element    //*[@id="AccountFrm_lastname"]
    Page Should Contain Element    //*[@id="AccountFrm_email"]
    Page Should Contain Element    //*[@id="AccountFrm_fax"]
    Page Should Contain Element    //*[@id="AccountFrm_company"]
    Page Should Contain Element    //*[@id="AccountFrm_address_1"]
    Page Should Contain Element    //*[@id="AccountFrm_address_2"]
    Page Should Contain Element    //*[@id="AccountFrm_city"]
    Page Should Contain Element    //*[@id="AccountFrm_country_id"]
    Page Should Contain Element    //*[@id="AccountFrm_zone_id"]
    Page Should Contain Element    //*[@id="AccountFrm_postcode"]
    Page Should Contain Element    //*[@id="AccountFrm_loginname"]
    Page Should Contain Element    //*[@id="AccountFrm_password"]
    Page Should Contain Element    //*[@id="AccountFrm_confirm"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter1"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter0"]
    Page Should Contain Element    //*[@id="AccountFrm_agree"]
    Page Should Contain Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    

    #Nhập dữ liệu
    Input Text    //*[@id="AccountFrm_firstname"]    bonghoa          @
    Input Text    //*[@id="AccountFrm_lastname"]     &  vuive
    Input Text    //*[@id="AccountFrm_email"]    bonghoavuivee@gmail.com
    Input Text    //*[@id="AccountFrm_telephone"]    03454835
    Input Text    //*[@id="AccountFrm_fax"]    + 84 (8) 7357672
    Input Text    //*[@id="AccountFrm_company"]    YSL
    Input Text    //*[@id="AccountFrm_address_1"]    Hà Giang
    Input Text    //*[@id="AccountFrm_address_2"]    Đà Nẵng
    Input Text    //*[@id="AccountFrm_city"]    Đà Nẵng
    Select From List By Value    //*[@id="AccountFrm_country_id"]    230
    Sleep    2s
    Select From List By Value    //*[@id="AccountFrm_zone_id"]    3756
    Input Text    //*[@id="AccountFrm_postcode"]    70000
    Input Text    //*[@id="AccountFrm_loginname"]    bonghoavuivee
    Input Password    //*[@id="AccountFrm_password"]    bonghoavuive
    Input Password    //*[@id="AccountFrm_confirm"]    bonghoavuive
    Click Element    //*[@id="AccountFrm_newsletter1"]
    Click Element    //*[@id="AccountFrm_agree"]
    #Nhấn Đăng ký
    Click Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    2s
    Location Should Be    https://automationteststore.com/index.php?rt=account/success
    Close Browser
TC45: Đăng kí với fname và lname là chữ có dấu 
    Open Browser    ${URL}    Chrome
    Maximize Browser Window
    Click Element   ${Login_or_register} 
    Location Should Be    https://automationteststore.com/index.php?rt=account/login
    Click Element   ${Continue}  
    Location Should Be    https://automationteststore.com/index.php?rt=account/create
    #Kiểm tra trường dữ liệu
    Page Should Contain Element    //*[@id="AccountFrm_firstname"]
    Page Should Contain Element    //*[@id="AccountFrm_lastname"]
    Page Should Contain Element    //*[@id="AccountFrm_email"]
    Page Should Contain Element    //*[@id="AccountFrm_fax"]
    Page Should Contain Element    //*[@id="AccountFrm_company"]
    Page Should Contain Element    //*[@id="AccountFrm_address_1"]
    Page Should Contain Element    //*[@id="AccountFrm_address_2"]
    Page Should Contain Element    //*[@id="AccountFrm_city"]
    Page Should Contain Element    //*[@id="AccountFrm_country_id"]
    Page Should Contain Element    //*[@id="AccountFrm_zone_id"]
    Page Should Contain Element    //*[@id="AccountFrm_postcode"]
    Page Should Contain Element    //*[@id="AccountFrm_loginname"]
    Page Should Contain Element    //*[@id="AccountFrm_password"]
    Page Should Contain Element    //*[@id="AccountFrm_confirm"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter1"]
    Page Should Contain Element    //*[@id="AccountFrm_newsletter0"]
    Page Should Contain Element    //*[@id="AccountFrm_agree"]
    Page Should Contain Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    

    #Nhập dữ liệu
    Input Text    //*[@id="AccountFrm_firstname"]    Huỳnh
    Input Text    //*[@id="AccountFrm_lastname"]    An
    Input Text    //*[@id="AccountFrm_email"]    huynhann@gmail.com
    Input Text    //*[@id="AccountFrm_telephone"]    03753855
    Input Text    //*[@id="AccountFrm_fax"]    + 84 (8) 634826574
    Input Text    //*[@id="AccountFrm_company"]    NABS
    Input Text    //*[@id="AccountFrm_address_1"]    Cà Mau
    Input Text    //*[@id="AccountFrm_address_2"]    Hà Nội
    Input Text    //*[@id="AccountFrm_city"]    Hồ Chí Minh
    Select From List By Value    //*[@id="AccountFrm_country_id"]    230
    Sleep    2s
    Select From List By Value    //*[@id="AccountFrm_zone_id"]    3751
    Input Text    //*[@id="AccountFrm_postcode"]    6374
    Input Text    //*[@id="AccountFrm_loginname"]    huynhann
    Input Password    //*[@id="AccountFrm_password"]    mongtrinh
    Input Password    //*[@id="AccountFrm_confirm"]    mongtrinh
    Click Element    //*[@id="AccountFrm_newsletter1"]
    Click Element    //*[@id="AccountFrm_agree"]
    #Nhấn Đăng ký
    Click Element    //*[@id="AccountFrm"]/div[5]/div/div/button
    Sleep    2s
    Location Should Be    https://automationteststore.com/index.php?rt=account/success
    Close Browser


