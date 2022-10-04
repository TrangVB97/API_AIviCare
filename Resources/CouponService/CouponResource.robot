*** Settings ***
Resource    ../../BasePage.robot

*** Keywords ***
Get URL Coupon Service
    ${url}=    Get URL  promotion-service
    [Return]    ${url}

Create Coupon Not By Json File
    [Arguments]   ${data}  ${expected_status}=None
    ${root}     Get CUDIR
    ${url}=      Get URL Coupon Service
    ${header}=  Create Dictionary  Content-Type=application/json   Authorization=${authorization}
    Create Session  createCoupon  ${url}/coupons  headers=${header}    verify=True
    ${response}=  POST On Session  createCoupon  url=${url}/coupons    data=${data}  headers=${header}   expected_status=${expected_status}
    [Return]    ${response}

Get Coupon By Keyword
    [Arguments]    ${params}=None    ${expected_status}=200
    ${root}     Get CUDIR
    ${url}=      Get URL Coupon Service
    ${header}=  Create Dictionary  Content-Type=application/json   Authorization=${authorization}
    Create Session  searchCoupon  ${url}/coupons  headers=${header}    verify=True
    ${response}=  GET On Session  searchCoupon  url=${url}/coupons  params=${params}  headers=${header}  expected_status=${expected_status}
    [Return]    ${response}

Validate Coupon
    [Arguments]    ${params}=None  ${expected_status}=None
    ${root}     Get CUDIR
    ${url}=      Get URL Coupon Service
    ${header}=  Create Dictionary  Content-Type=application/json   Authorization=${authorization}
    Create Session  validateCoupon  ${url}/coupon-instances/validate  headers=${header}    verify=True
    ${response}=  GET On Session  validateCoupon  url=${url}/coupon-instances/validate   params=${params}
                  ...    headers=${header}    expected_status=${expected_status}
    [Return]    ${response}

Create Coupon By Request
    [Arguments]   ${json_file}=None    ${expected_status}=None
    ${root}     Get CUDIR
    ${url}=      Get URL Coupon Service
    ${header}=  Create Dictionary  Content-Type=application/json   Authorization=${authorization}
    ${json}=    Load JSON From File    ${root}/Datas/CouponService/${json_file}.json
    Create Session  createCoupon  ${url}/coupons  headers=${header}    verify=True
    ${response}=  POST On Session  createCoupon  url=${url}/coupons    json=${json}  headers=${header}   expected_status=${expected_status}
    [Return]    ${response}

Create Coupon
    [Arguments]   ${data}=None    ${expected_status}=None
    ${root}     Get CUDIR
    ${url}=      Get URL Coupon Service
    ${header}=  Create Dictionary  Content-Type=application/json   Authorization=${authorization}
    Create Session  createCoupon  ${url}/coupons  headers=${header}    verify=True
    ${response}=  POST On Session  createCoupon  url=${url}/coupons    data=${data}  headers=${header}   expected_status=${expected_status}
    [Return]    ${response}

Update Coupon
    [Arguments]   ${couponId}   ${json_file}=None    ${expected_status}=None
    ${root}     Get CUDIR
    ${url}=      Get URL Coupon Service
    ${header}=  Create Dictionary  Content-Type=application/json   Authorization=${authorization}
    ${json}=    Load JSON From File    ${root}/Datas/CouponService/${json_file}.json
    Create Session  updateCoupon  ${url}  headers=${header}    verify=True
    ${response}=  PUT On Session  updateCoupon  url=${url}/coupons/${couponId}  json=${json}  headers=${header}    expected_status=${expected_status}
    [Return]    ${response}

Update Coupon By Request
    [Arguments]   ${couponId}  ${data}   ${expected_status}
    ${root}     Get CUDIR
    ${url}=      Get URL Coupon Service
    ${header}=  Create Dictionary  Content-Type=application/json   Authorization=${authorization}
    Create Session  updateCoupon  ${url}/coupons  headers=${header}    verify=True
    ${response}=  PUT On Session  updateCoupon  url=${url}/coupons/${couponId}  data=${data}  headers=${header}    expected_status=${expected_status}
    [Return]    ${response}

Change Status Coupon
    [Arguments]    ${couponId}    ${status}
    ${root}     Get CUDIR
    ${url}=      Get URL Coupon Service
    ${header}=  Create Dictionary  Content-Type=application/json   Authorization=${authorization}
    Create Session  changeStatus  ${url}  headers=${header}    verify=True
    ${response}=  PUT On Session  changeStatus  url=${url}/coupons/${couponId}/status/${status}  headers=${header}
    [Return]    ${response}

Get Status Coupon By Id
    [Arguments]    ${couponId}
    ${root}     Get CUDIR
    ${url}=      Get URL Coupon Service
    ${header}=  Create Dictionary  Content-Type=application/json   Authorization=${authorization}
    Create Session  getCoupon  ${url}  headers=${header}    verify=True
    ${response}=  GET On Session  getCoupon  url=${url}/coupons/${couponId}  headers=${header}
    [Return]    ${response}

Get Coupon Instances
    ${root}=    Get CUDIR
    ${url}=    Get URL Coupon Service
    ${header}=  Create Dictionary  Content-Type=application/json   Authorization=${authorization}
    Create Session  getCouponInstances  ${url}  headers=${header}    verify=True
    ${response}=  GET On Session  getCouponInstances  url=${url}/coupon-instances   headers=${header}
    [Return]    ${response}

Create Promotion Data Format
    [Arguments]   ${json_file}  ${expected_status}=None
    ${root}     Get CUDIR
    ${url}=      Get URL Coupon Service
    ${header}=  Create Dictionary   Content-Type=multipart/form-data   Authorization=${authorization}
    ${data}=    Load JSON From File    ${root}/Datas/CouponService/${json_file}.json
    ${form_data}=   evaluate    {'data=': (${data})}
    Create Session  createPromotion  ${url}/promotions  headers=${header}    verify=True
    ${response}=  POST On Session  createPromotion  url=${url}/promotions   data=${data}  headers=${header}   expected_status=${expected_status}
    [Return]    ${response}