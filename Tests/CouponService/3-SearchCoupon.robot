*** Settings ***
Documentation    Verify Search Coupon.
Resource    ../../BasePage.robot
Resource    ../../Resources/CouponService/CouponResource.robot
Suite Setup    Connect to Database  psycopg2  ${dbName}  ${dbUsername}  ${dbPassword}  ${dbHost}  ${dbPort}

*** Variables ***
${dbName}    promotion-service
${dbHost}    vbmda-val.postgres.database.azure.com
${dbPort}     5432
${dbUsername}    promotion-service@vbmda-val
${dbPassword}    XC5Fr8sryRn4B9j5TrtU

*** Test Cases ***
Search Coupon With Blank Code Coupon
    [Documentation]    Return all coupons.
    [Tags]    empty
    ${response}=    Get Coupon By Keyword
    ${total}=   set variable    ${response.json()}[total]

    @{result}=   Query   SELECT Count(*) FROM coupon
    ${column 1}    Evaluate    [x[0] for x in $result]
    should be equal as integers   ${total}  ${column 1}[0]

Search Coupon With Existing Code Coupon
    [Documentation]   Return coupons contain code coupon.
    ...    check 'couponCode' key contain 'coupon2209' value.
    [Tags]    existing
    ${response}=    Get Coupon By Keyword   keyword=coupon2209
    ${total}=   set variable    ${response.json()}[total]

    @{result}=  Query    select count(*) from coupon where coupon_code like '%coupon2209%'
    ${column 1}     evaluate    [x[0] for x in $result]
    should be equal as integers    ${total}  ${column 1}[0]

    ${total}=   evaluate    ${total} - 1
    FOR    ${i}    IN    0    ${total}
        should contain    ${response.json()}[coupons][${i}][couponCode]     coupon2209
    END

Search Coupon With Not Existing Code Coupon
    [Documentation]    Return no coupon.
    [Tags]    not_existing
    ${response}=    Get Coupon By Keyword  keyword=testnega123
    should be equal as strings   ${response.json()}[total]    0

Filter Coupons By Hospital Criteria
    [Documentation]    Return coupons contain correct hospital criteria.
    [Tags]    filter_hospital
    ${response}=     Get Coupon By Keyword    organizationCode=BVTNHN    200
    ${coupons}=  Get Value From Json  ${response.json()}    coupons
    ${total}=   set variable    ${response.json()}[total]
    ${total}=   evaluate    ${total} - 1
    FOR    ${i}    IN    0  ${total}
        ${convert}=     convert json to string    ${response.json()}[coupons][${i}][providerCriteria]
        should contain   ${convert}    "code": "BVTNHN"
    END

Filter Coupons By Specialist Criteria
   [Documentation]    Return coupons contain correct specialist criteria.
   [Tags]    filter_specialist
   ${response}=     Get Coupon By Keyword    specialtyCode=SP002    200
   ${total}=   set variable    ${response.json()}[total]
   ${total}=    evaluate    ${total} - 1
   FOR    ${i}    IN    0    ${total}
        ${convert}=     convert json to string    ${response.json()}[coupons][${i}][providerCriteria]
        should contain any    ${convert}    "code": "SP002"
   END

Filter Coupons By Package Type Criteria
    [Documentation]    Return coupons contain correct package type criteria.
    [Tags]    filter_package
    ${response}=     Get Coupon By Keyword  packageCode=GB-CON-87064   200
    ${total}=   set variable    ${response.json()}[total]
    ${total}=   evaluate    ${total} - 1
    FOR    ${i}    IN    0    ${total}
        ${convert}=     convert json to string    ${response.json()}[coupons][${i}]
        should contain any    ${convert}    "code": "GB-CON-87064"
    END

Filter Coupons By Country Criteria
    [Documentation]    Return coupons contain correct country criteria.
    [Tags]    filter_country
    ${response}=     Get Coupon By Keyword  countryCode=VN   200
    ${total}=   set variable    ${response.json()}[total]
    ${total}=   evaluate    ${total} - 1
    FOR    ${i}    IN    0    ${total}
        ${convert}=     convert json to string    ${response.json()}[coupons][${i}]
        should contain any    ${convert}    VN
    END

Filter Coupons By Combined Hospital and Specialist Criteria
   [Documentation]    Return coupons contain correct hospital and specialist criteria.
   [Tags]    filter_combine
   ${response}=     Get Coupon By Keyword  specialtyCode=SP002&organizationCode=PKDK_MINHKHAI_Q3_HCM   200
   ${total}=   set variable    ${response.json()}[total]
   ${total}=    evaluate    ${total} - 1
   FOR    ${i}    IN    0    ${total}
        ${convert}=     convert json to string    ${response.json()}[coupons][${i}]
        should contain    ${convert}    "code": "SP002"
        should contain    ${convert}    "code": "PKDK_MINHKHAI_Q3_HCM"
   END
