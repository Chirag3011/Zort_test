*** Settings ***
Resource       ${CURDIR}/../../resources/import.robot
Test Teardown  light_portal_common_keywords.Close zortout website

*** Test Cases ***
Test printing quotation A4 size document with tax invoice form
    [Tags]           LIGHT_WEIGHT  TC_UI1  TC_UI_44
    [Documentation]  Test printing quotation A4 size document with tax invoice form
    
    light_portal_common_keywords.Open zortout website
    light_portal_login_features.Login with email  ${public_user['username']}  ${public_user['password']}
    light_portal_home_features.Goto quotation list page
    light_portal_quotation_list_page.Click create quotation
    ${quotation_id}=  light_portal_add_quotation_features.Create quotation  ${tc_44['product_id']}  ${tc_44['contact']}  ${tc_44['saleschannel']}
    light_portal_home_features.Goto quotation list page
    light_portal_quotation_list_page.Click check box  ${quotation_id}
    light_portal_quotation_list_page.Click print quotation
    light_portal_quotation_list_page.Select paper size  ${tc_44['paper_size']}
    light_portal_quotation_list_page.Select format paper  ${tc_44['format_paper']}
    light_portal_quotation_list_page.Click confirm print
    light_portal_print_quotation_features.Verify print quotation tax invoice  ${tc_44['contact']}  ${tc_44['product_id']}