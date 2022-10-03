*** Settings ***
Resource    ../../BasePage.robot
Resource    ../../Resources/CouponService/CouponResource.robot
Resource    ../../Datas/CouponService/GenerateCoupon.robot
Test Setup    Sleep    1

*** Test Cases ***
Create Valid Promotion
    [Documentation]    Create promotion with valid data successful.
    [Tags]    valid
    ${response}=    Create Promotion Data Format   validPromotion    200
    log to console    ${response.json()}

Create Promotion With Blank Type User
    [Documentation]    Not allow to create promotion with blank type user.
    [Tags]    blank_type_user

Create Promotion With Start Date After End Date
    [Documentation]    Not allow to create promotion with start date after end date.
    [Tags]    error_date_1

Create Promotion With Start Date Before Now
    [Documentation]    Not allow to create promotion with start date before now.
    [Tags]    error_date_2

Create Promtion With End Date Before Now
    [Documentation]    Not allow to create promotion with end date before now.
    [Tags]    error_date_3

Create Promotion With Start Date Equal End Date
    [Documentation]    Not allow to create promorion with start date equal end date.
    [Tags]    error_date_4

Create Promotion With Code Coupon Contain Special Character
    [Documentation]    Not allow to create promotion with code coupon contain special character.
    [Tags]    special_character

Create Promotion With Code Coupon Contain White Space
    [Documentation]    Not allow to create promotion with code coupon contain white space.
    [Tags]    white_space

Create Promotion With Count of Coupon Less Than Zero
    [Documentation]    Not allow to create promotion with count of counpon less than zero.
    [Tags]    count_coupon

Create Promotion With Discount Less Than Zero
    [Documentation]    Not allow to create promotion with discount off less than zero.
    [Tags]    discount_off_1

Create Promotion With Discount Equal Zero
    [Documentation]    Not allow to create promotion with dicount equal zero.
    [Tags]    discount_off_2

Create Promotion Percent Off Greater Than 100%
    [Documentation]    Not allow to create promotion with percent off greater than 100%.
    [Tags]    percent_off