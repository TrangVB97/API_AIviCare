*** Settings ***
Documentation    Verify Update Coupon.
Resource    ../../BasePage.robot
Resource    ../../Resources/CouponService/CouponResource.robot
Resource    ../../Datas/CouponService/GenerateCoupon.robot

*** Variables ***
${coupon0000}     coupon0000
${coupon1111}     coupon1111
${coupon7777}     coupon7777

*** Test Cases ***
Update Coupon With Not Resumed Yet
    [Documentation]   Update coupon with not resumed yet successful.
    [Tags]    valid
    ${oldCoupon}=   Get Coupon By Keyword    keyword=${coupon1111}
    ${id}=  set variable    ${oldCoupon.json()}[coupons][0][id]
    ${totalNumberOfCoupon}=    set variable    ${oldCoupon.json()}[coupons][0][totalNumberOfCoupon]
    ${totalNumberOfCoupon}=     set variable if    ${totalNumberOfCoupon} > 50      41      51
    ${data}=    Create Coupon Data  id=${id}  couponCode=${coupon1111}  totalIssuedCoupon=${totalNumberOfCoupon}

    ${response}=   Update Coupon By Request   ${id}  ${data}[1]    200

    ${couponCode}=  Get Value From Json  ${response.json()}  couponCode
    Should be equal As Strings  ${couponCode}[0]  coupon1111
    ${totalIssuedCoupon}=  Get Value From Json  ${response.json()}  totalIssuedCoupon
    should be equal as strings    ${totalIssuedCoupon}[0]    ${totalNumberOfCoupon}

    ${getHeaderValue}=  Get From Dictionary  ${response.headers}  Content-Type
    Should be equal  ${getHeaderValue}  application/json

Change Status Coupon
    [Documentation]   Change status coupon successful.
    [Tags]    change_status
    ${res}=   Get Status Coupon By Id    328
    should be equal as strings    ${res.json()}[couponCode]    ${coupon0000}
    ${status}=  set variable if    '${res.json()}[couponStatus]'=='ACTIVE'   INACTIVE   ACTIVE

    ${response}=    Change Status Coupon    328    ${status}
    Status Should Be  200  ${response}

    ${res}=   Get Status Coupon By Id    328
    should be equal as strings    ${res.json()}[couponStatus]    ${status}

Update Coupon With Same Code Coupon
    [Documentation]   Update coupon with same code coupon fail.
    [Tags]    same_code
    ${data}=     Create Coupon Data  id=328   couponCode=coupon1111
    ${response}=    Update Coupon By Request    328    ${data}[1]    412
    should contain    ${response.json()}[error]    exists

Update Coupon With Coupon Count Is Less Than Resumed
    [Documentation]    This test case verifies that the response ...
    [Tags]    count
    ${req_dict}=   Create Dictionary  id=294  couponCode=coupon22091400  discountType=PERCENTAGE  amountOff=0  percentOff=40
                  ...  totalIssuedCoupon=1  timesForEachCoupon=1  couponType=APPOINTMENT  couponMode=PUBLIC
    ${req_json}=    Json.Dumps    ${req_dict}
    ${response}=    Update Coupon By Request    294    ${req_json}    400

Update Discount Of Resumed Coupon
    [Documentation]   Update discount of resumed coupon fail.
    [Tags]    resumed
    ${oldCoupon}=   Get Coupon By Keyword    keyword=${coupon7777}
    ${id}=  set variable    ${oldCoupon.json()}[coupons][0][id]
    ${percentOff}=    set variable    ${oldCoupon.json()}[coupons][0][percentOff]
    ${percentOff}=     set variable if    ${percentOff} > 30     27     32
    ${data}=    Create Coupon Data  id=${id}  couponCode=${coupon7777}  percentOff=${percentOff}

    ${response}=    Update Coupon By Request    ${id}    ${data}[1]    400


