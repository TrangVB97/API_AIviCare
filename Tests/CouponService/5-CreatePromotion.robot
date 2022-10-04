*** Settings ***
Documentation    Verify Create Coupon.
Resource    ../../BasePage.robot
Resource    ../../Resources/CouponService/CouponResource.robot
Resource    ../../Datas/CouponService/GenerateCoupon.robot
Test Setup    Sleep    1

*** Test Cases ***
Create Promotion With Valid Data
    ${response}=    Create Promotion Data Format    validPromotion    500
    log to console    ${response.json()}

#Create Promotion With Empty User Type
#
#Create Promotion With Start Date After End Date
#Create Promotion With Start Date Before Now
#Create Promotion With End Date Before Now
#Create Promotion Without Date
#
#Create Promotion With

*** Keywords ***
