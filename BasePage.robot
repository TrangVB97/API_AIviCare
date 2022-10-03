*** Settings ***
Documentation    API Testing Coupon Service
Library    Selenium2Library
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections
Library    json
Library    DatabaseLibrary

*** Variables ***
${host}    api-staging.draid.ai
${basePath}     /api/v1

${schemes}      https
${authorization}    eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImtpZCI6Ilg1ZVhrNHh5b2pORnVtMWtsMll0djhkbE5QNC1jNTdkTzZRR1RWQndhTmsifQ.eyJpc3MiOiJodHRwczovL3ZidmFsLmIyY2xvZ2luLmNvbS82M2UxNzMzNy1iNmQ0LTQ4MDYtYjg1OS0zYmE4ZWM3YmY4OWMvdjIuMC8iLCJleHAiOjE2NjQ4NDk0NDksIm5iZiI6MTY2NDc2MzA0OSwiYXVkIjoiMjYzY2I4MzMtZjQxMy00ZDNlLTk4YjYtNTMzY2E0NzIzMTMzIiwib2lkIjoiOWVhNTI2MGEtZTUwMS00ZWRkLWI0MGUtNTI1MzZlMWI5ZjI0Iiwic3ViIjoiOWVhNTI2MGEtZTUwMS00ZWRkLWI0MGUtNTI1MzZlMWI5ZjI0IiwibmFtZSI6IlF14bqjbiBsw70gVkIiLCJnaXZlbl9uYW1lIjoiVkIiLCJlbWFpbHMiOlsidmIucWx5LnZhbEBtYWlsaW5hdG9yLmNvbSJdLCJ0ZnAiOiJCMkNfMV92Ym1kYS1zaWduaW4tdjItdmFsIiwibm9uY2UiOiIxZGJjY2UwZi1lN2Q2LTQ4NGItODYxMy0yMDkwMWEyNmQ1ZjUiLCJzY3AiOiJ2Ym1kYS5yZWFkIiwiYXpwIjoiMjYzY2I4MzMtZjQxMy00ZDNlLTk4YjYtNTMzY2E0NzIzMTMzIiwidmVyIjoiMS4wIiwiaWF0IjoxNjY0NzYzMDQ5fQ.ZgsRWjwoOjWmca0NLc7nhS9plQH0ONVQHe4By30dkHheycvXVpQF8lFBQUd-O4QqFUhlvvl9M9KsU15o6doLVSpHFTl1TiBTJYkSAcSatopanjoKVqoBm34pBCZplyo6GYm4lilrYjgZeiuJ8WOydB9UUF6TxhOABBy4hPdzVHv-pk5Pywlm3RU9aJ9ZBdQ2ampAYZJc_JpZYvlDkqJgfFpA0oWVC-Bvw-d4_hjLV2TiCkPB_ZYd_ZNNd_a4yyr1GHrseYrCG5iGnRI0ndqSv0HpIR6N0SyAgn43O32oJEo-ogZQR4u8y8JJy21axTiZWxp761eFjZ-YjdN2swkz3w

*** Keywords ***
Get CUDIR
    ${cur_dir}  set variable    ${CURDIR}
    [Return]    ${cur_dir}

Get URL
    [Arguments]    ${service}
    [Return]    ${schemes}://${host}/${service}${basePath}
