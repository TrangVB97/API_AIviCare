*** Settings ***
Library    json
Library    DateTime

*** Keywords ***
Generate Code Coupon By Current Date
    ${couponCode}=      get current date     result_format=%d%m%H%M%S
    [Return]    ${couponCode}

Generate Coupon Data
    [Arguments]  ${couponCode}=None  ${totalIssuedCoupon}=50  ${timesForEachCoupon}=1  ${discountType}=PERCENTAGE  ${couponType}=APPOINTMENT
             ...   ${amountOff}=0  ${percentOff}=40   ${couponMode}=PUBLIC    ${startDate}=null    ${endDate}=null
    ${couponCode}=  Generate Code Coupon By Current Date
    ${req_dict}=   Create Dictionary   couponCode=${couponCode}  discountType=${discountType}  amountOff=${amountOff}  percentOff=${percentOff}
                  ...  totalIssuedCoupon=${totalIssuedCoupon}  timesForEachCoupon=${timesForEachCoupon}  couponType=${couponType}  couponMode=${couponMode}
                  ...  startDate=${startDate}    endDate=${endDate}
    ${req_json}=    Json.Dumps    ${req_dict}
    [Return]   ${couponCode}  ${req_json}

Generate Empty Coupon Data
    ${req_dict}=   Create Dictionary   couponCode=""  discountType=""  amountOff=null  percentOff=""
                  ...  totalIssuedCoupon=""  timesForEachCoupon=null  couponType=""  couponMode=""
    ${req_json}=    Json.Dumps    ${req_dict}
    [Return]    ${req_json}

Create Coupon Data
    [Arguments]    ${id}   ${couponCode}  ${totalIssuedCoupon}=50  ${timesForEachCoupon}=1  ${discountType}=PERCENTAGE  ${couponType}=APPOINTMENT
             ...   ${amountOff}=0  ${percentOff}=40   ${couponMode}=PUBLIC    ${startDate}=null    ${endDate}=null
    ${req_dict}=   Create Dictionary  id=${id}  couponCode=${couponCode}  discountType=${discountType}  amountOff=${amountOff}  percentOff=${percentOff}
                  ...  totalIssuedCoupon=${totalIssuedCoupon}  timesForEachCoupon=${timesForEachCoupon}  couponType=${couponType}  couponMode=${couponMode}
                  ...  startDate=${startDate}    endDate=${endDate}
    ${req_json}=    Json.Dumps    ${req_dict}
    [Return]   ${couponCode}  ${req_json}

Generate Promotion Data
    [Arguments]
    [Return]