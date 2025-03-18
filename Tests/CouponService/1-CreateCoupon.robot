*** Settings ***
Documentation    Verify Create Coupon.
Resource    ../../BasePage.robot
Resource    ../../Resources/CouponService/CouponResource.robot
Resource    ../../Datas/CouponService/GenerateCoupon.robot
Test Setup    Sleep    1

*** Test Cases ***
/test1
Create Empty Code Coupon
    [Documentation]    Not allow to create coupon with empty code coupon.
    [Tags]    empty_code
    ${data}=    Generate Empty Coupon Data
    ${response}=    Create Coupon    ${data}    500

Create Coupon Have Code Coupon Greater Than 50 Charaters
    [Documentation]   Length of Code Coupon <= 50
    [Tags]    max_length
    ${couponCode}=  set variable    111111111111111111111111111111111111111111111111111
    ${req_dict}=   Create Dictionary   couponCode=${couponCode}  discountType=PERCENTAGE  amountOff=0  percentOff=40
                  ...  totalIssuedCoupon=50  timesForEachCoupon=1  couponType=APPOINTMENT  couponMode=PUBLIC
    ${data}=    Json.Dumps    ${req_dict}
    ${response}=    Create Coupon    ${data}    400

Create Coupon Have Code Coupon Contain Special Character
    [Documentation]    Not allow to enter code Coupon contain special character.
    [Tags]    wrong_code
    ${couponCode}=  set variable    coupon@123
    ${req_dict}=   Create Dictionary   couponCode=${couponCode}  discountType=PERCENTAGE  amountOff=0  percentOff=40
                  ...  totalIssuedCoupon=30  timesForEachCoupon=1  couponType=APPOINTMENT  couponMode=PUBLIC
    ${data}=    Json.Dumps    ${req_dict}
    ${response}=    Create Coupon    ${data}    400

Create Coupon Have Coupon Count Less Than Zero
    [Documentation]    Total Coupons must be greater than zero.
    [Tags]    negative_count
    ${couponCode}    ${data}=   Generate Coupon Data    totalIssuedCoupon=-50
    ${response}=    Create Coupon    ${data}    400

Create Coupon Have Coupon Count Equal Zero
    [Documentation]    Total Coupons must greater than zero
    [Tags]    zero_count
    ${couponCode}    ${data}=   Generate Coupon Data    totalIssuedCoupon=0
    ${response}=    Create Coupon    ${data}    400

Create Coupon Have Time for Each Coupon Less Than Zero
    [Documentation]    Time for each coupon must be greater than zero.
    [Tags]    negative_time_for_each
    ${couponCode}    ${data}=   Generate Coupon Data   timesForEachCoupon=-1
    ${response}=     Create Coupon    ${data}    400

Create Coupon Have Percent Discount Less Than Zero
    [Documentation]    Percent off must be greater than zero.
    [Tags]    negative_per
    ${couponCode}    ${data}=   Generate Coupon Data    percentOff=-40
    ${response}=    Create Coupon    ${data}    412

Create Coupon Have Start Date Less Than Now
    [Documentation]   Start Date must be earlier than Now.
    [Tags]    start_date
    ${couponCode}    ${data}=   Generate Coupon Data    startDate=1663060860000
    ${response}=    Create Coupon    ${data}    400

Create Coupon Have End Date Less Than Now
    [Documentation]    End Date must be earlier than Now.
    [Tags]    end_date
    ${couponCode}    ${data}=   Generate Coupon Data    endDate=1663555800000
    ${response}=    Create Coupon    ${data}    400

Create Coupon Have Start Date Greater Than End Date
    [Documentation]    Start Date must be earlier than End Date.
    [Tags]    date
    ${couponCode}    ${data}=   Generate Coupon Data    startDate=1663630200000   endDate=1663621200000
    ${response}=    Create Coupon    ${data}    400

Create Coupon Have Coupon Type Is PACKAGE
    [Documentation]    Create coupon with option type is package.
    [Tags]    package
    ${response}=    Create Coupon By Request   packageTypeCoupon   200
    should be equal as strings    ${response.json()}[providerCriteria][packages][0][name]    Chuyên khoa tâm lý
    ${getHeaderValue}=  Get From Dictionary  ${response.headers}  Content-Type
    Should be equal  ${getHeaderValue}  application/json

Create Coupon Have Coupon Type Is APPOITMENT
    [Documentation]   Create coupon with option type is appointment.
    [Tags]    appointment
    ${couponCode}    ${data}=   Generate Coupon Data
    ${response}=    Create Coupon    ${data}    200
    ${code}=  Get Value From Json  ${response.json()}  couponCode
    Should be equal As Strings  ${code}[0]  ${couponCode}

    ${getHeaderValue}=  Get From Dictionary  ${response.headers}  Content-Type
    Should be equal  ${getHeaderValue}  application/json

Create Coupon Have Existed Code Coupon
    [Documentation]    Not allow to create coupon have existed code coupon.
    [Tags]    same_code
    ${req_dict}=   Create Dictionary   couponCode=coupon22091405  discountType=PERCENTAGE  amountOff=0  percentOff=40
                   ...  totalIssuedCoupon=100    timesForEachCoupon=1   couponType=APPOINTMENT   couponMode=PUBLIC
    ${data}=    Json.Dumps    ${req_dict}
    ${response}=    Create Coupon   ${data}    412

