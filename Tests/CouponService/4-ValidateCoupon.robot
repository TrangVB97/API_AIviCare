*** Settings ***
Documentation    Validate Coupon.
Resource    ../../BasePage.robot
Resource    ../../Resources/CouponService/CouponResource.robot

*** Test Cases ***
Validate Active Coupon
    [Documentation]   Validate active coupon successful.
    [Tags]    active
    ${response}=    Validate Coupon    couponCode=coupon22091410&couponType=APPOINTMENT&phoneNumber=     200

Validate Inactive Coupon
    [Documentation]   Validate inactive coupon fail.
    [Tags]    inactive
    ${response}=    Validate Coupon    couponCode=coupon22091415&couponType=APPOINTMENT&phoneNumber=    400
    should contain    ${response.json()}[error]    in active

Validate Expired Coupon
    [Documentation]   Validate expired coupon fail.
    [Tags]    expired
    ${response}=    Validate Coupon    couponCode=coupon22091420&couponType=APPOINTMENT&phoneNumber=    400
    should contain    ${response.json()}[error]    expired

Validate Run Out Coupon
    [Documentation]   Validate run out coupon fail.
    [Tags]    run_out
    ${response}=    Validate Coupon    couponCode=coupon22090922&couponType=APPOINTMENT&phoneNumber=    400
    should contain    ${response.json()}[error]    run out

Validate Resumed Coupon
    [Documentation]   Validate resumed coupon fail.
    [Tags]    resumed
    ${response}=    Validate Coupon    couponCode=coupon22091405&couponType=APPOINTMENT&phoneNumber=0333912220    400
    should contain    ${response.json()}[error]    used

Validate Not Started Coupon
    [Documentation]   Validate not started coupon fail.
    [Tags]    not_started
    ${response}=    Validate Coupon   couponCode=coupon22090930&couponType=APPOINTMENT&phoneNumber=    400
    should contain    ${response.json()}[error]    not started

Validate Resumed Private Coupon
    [Documentation]   Validate resumed private coupon fail.
    [Tags]    private_resumed
    ${response}=    Validate Coupon   couponCode=coupon22090935&couponType=APPOINTMENT&phoneNumber=0333912220    400
    should contain    ${response.json()}[error]    used

Validate Expired Private Coupon
    [Documentation]   Validate expired private coupon fail.
    [Tags]    private_expired
    ${response}=    Validate Coupon   couponCode=coupon22090940&couponType=APPOINTMENT&phoneNumber=0333912220    400
    should contain    ${response.json()}[error]    expired

Validate Not Started Private Coupon
    [Documentation]   Validate not started private coupon fail.
    [Tags]    private_not_started
    ${response}=    Validate Coupon   couponCode=coupon01111110&couponType=APPOINTMENT&phoneNumber=0333912220    400
    should contain    ${response.json()}[error]    not started

Validate Valid Private Coupon
    [Documentation]   Validate valid private coupon successful.
    [Tags]    private_valid
    ${response}=    Validate Coupon   couponCode=coupon22090945&couponType=APPOINTMENT&phoneNumber=0333912220    200

Validate Run Out Private Coupon
    [Documentation]   Validate run out private coupon fail.
    [Tags]    private_run_out
    ${response}=    Validate Coupon   couponCode=coupon22090950&couponType=APPOINTMENT&phoneNumber=0333912220    400
    should contain    ${response.json()}[error]     run out

Validate Coupon By Specialist
    [Documentation]   Validate coupon by speacialist successful.
    [Tags]    valid_specialist
    ${response}=    Validate Coupon   couponCode=coupon22091000&couponType=APPOINTMENT&phoneNumber=&specialtyCode=SP008    200

Validate Coupon By Specialist
    [Documentation]   Validate coupon by specialist fail.
    [Tags]    invalid_specialist
    ${response}=    Validate Coupon   couponCode=coupon22091000&couponType=APPOINTMENT&phoneNumber=&specialtyCode=SP002    400
    should contain    ${response.json()}[error]    invalid

Validate Coupon By Package
    [Documentation]   Validate coupon by package successful.
    [Tags]    valid_package
    ${response}=    Validate Coupon   couponCode=coupon22091010&couponType=PACKAGE&phoneNumber=&packageCode=GB-CON-87064    200

Validate Coupon By Package
    [Documentation]   Validate coupon by package fail.
    [Tags]    invalid_package
    ${response}=    Validate Coupon   couponCode=coupon22091010&couponType=PACKAGE&phoneNumber=&packageCode=GB-CON-18724    400
    should contain    ${response.json()}[error]    invalid

Validate Private Coupon By Package
    [Documentation]   Validate private coupon by package successful.
    [Tags]    private_package
    ${response}=    Validate Coupon   couponCode=coupon22091025&couponType=PACKAGE&phoneNumber=0333912220&packageCode=GB-CON-87064    200

Validate Coupon With Package Price Is Greater Than Minimum Purchase Amount
    [Documentation]   Validate coupon with package price is greater than minimum purchase amount successful.
    [Tags]    correct_minimum_purchase
    ${response}=    Validate Coupon   couponCode=coupon22091035&couponType=PACKAGE&phoneNumber=&packageCode=GB-CON-87064    200

Validate Coupon With Package Price Is Less Than Minimum Purchase Amount
    [Documentation]   Validate coupon with package price is less than minimum purchase amount fail.
    [Tags]    wrong_minimum_purchase
    ${response}=    Validate Coupon   couponCode=coupon22091035&couponType=PACKAGE&phoneNumber=&packageCode=GB-CON-HPTL-44784    400
    should contain    ${response.json()}[error]    invalid

Validate Coupon Without End Date
    [Documentation]    Validate coupon without end date successful.
    [Tags]    without_end_date
    ${response}=    Validate Coupon    couponCode=28091735&couponType=APPOINTMENT&phoneNumber=    200