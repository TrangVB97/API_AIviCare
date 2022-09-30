*** Settings ***
Documentation    API Testing Coupon Service
Library    Selenium2Library
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections
Library    json

*** Variables ***
${host}    api-staging.draid.ai
${basePath}     /api/v1

${schemes}      https
${authorization}    eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImtpZCI6Ilg1ZVhrNHh5b2pORnVtMWtsMll0djhkbE5QNC1jNTdkTzZRR1RWQndhTmsifQ.eyJpc3MiOiJodHRwczovL3ZidmFsLmIyY2xvZ2luLmNvbS82M2UxNzMzNy1iNmQ0LTQ4MDYtYjg1OS0zYmE4ZWM3YmY4OWMvdjIuMC8iLCJleHAiOjE2NjQ0NDc1MjMsIm5iZiI6MTY2NDM2MTEyMywiYXVkIjoiMjYzY2I4MzMtZjQxMy00ZDNlLTk4YjYtNTMzY2E0NzIzMTMzIiwib2lkIjoiOWVhNTI2MGEtZTUwMS00ZWRkLWI0MGUtNTI1MzZlMWI5ZjI0Iiwic3ViIjoiOWVhNTI2MGEtZTUwMS00ZWRkLWI0MGUtNTI1MzZlMWI5ZjI0IiwibmFtZSI6IlF14bqjbiBsw70gVkIiLCJnaXZlbl9uYW1lIjoiVkIiLCJlbWFpbHMiOlsidmIucWx5LnZhbEBtYWlsaW5hdG9yLmNvbSJdLCJ0ZnAiOiJCMkNfMV92Ym1kYS1zaWduaW4tdjItdmFsIiwibm9uY2UiOiIwNWY5YWI0ZC01MDcxLTRhMmItOWJhNC05ODI0NzJiMmIzNmYiLCJzY3AiOiJ2Ym1kYS5yZWFkIiwiYXpwIjoiMjYzY2I4MzMtZjQxMy00ZDNlLTk4YjYtNTMzY2E0NzIzMTMzIiwidmVyIjoiMS4wIiwiaWF0IjoxNjY0MzYxMTIzfQ.D1RKcNB5_h63HOEAMM4-T97jShJTz92fbzuYtHjDeofu7HzKAXKM1YdjHmrb2WI3b92ZZ8Bq1rFtc2XR3tQPKjo0AUYCIXZ7YeXLoBMMOZ56e4sy7jfmqqciMwUgigGuYM6BvPoWCNuTOlzKxf1xSDAAo7YR0FP3OG0nwffAPJe9T5AGnLdjyYVTyUQrj2PN2I-jcEyXHohY7AonA7uReagf0OKe1_kGfTmJaYhTUBOXRNkd-YoJwOWuunzbycXQKOcUzB_Ym-cACAnSwTQvL4mKnmF5uUIEcldTU90MOgtqs7Kr33RVtyNasmTrk0VzpEqoXcqVlTFCAQouam77rg
*** Keywords ***
Get CUDIR
    ${cur_dir}  set variable    ${CURDIR}
    [Return]    ${cur_dir}

Get URL
    [Arguments]    ${service}
    [Return]    ${schemes}://${host}/${service}${basePath}

