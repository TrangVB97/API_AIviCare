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
${authorization}    eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImtpZCI6Ilg1ZVhrNHh5b2pORnVtMWtsMll0djhkbE5QNC1jNTdkTzZRR1RWQndhTmsifQ.eyJpc3MiOiJodHRwczovL3ZidmFsLmIyY2xvZ2luLmNvbS82M2UxNzMzNy1iNmQ0LTQ4MDYtYjg1OS0zYmE4ZWM3YmY4OWMvdjIuMC8iLCJleHAiOjE2NjQ5NTUxOTcsIm5iZiI6MTY2NDg2ODc5NywiYXVkIjoiMjYzY2I4MzMtZjQxMy00ZDNlLTk4YjYtNTMzY2E0NzIzMTMzIiwib2lkIjoiOWVhNTI2MGEtZTUwMS00ZWRkLWI0MGUtNTI1MzZlMWI5ZjI0Iiwic3ViIjoiOWVhNTI2MGEtZTUwMS00ZWRkLWI0MGUtNTI1MzZlMWI5ZjI0IiwibmFtZSI6IlF14bqjbiBsw70gVkIiLCJnaXZlbl9uYW1lIjoiVkIiLCJlbWFpbHMiOlsidmIucWx5LnZhbEBtYWlsaW5hdG9yLmNvbSJdLCJ0ZnAiOiJCMkNfMV92Ym1kYS1zaWduaW4tdjItdmFsIiwibm9uY2UiOiI5YzI5MDUwNy00YWMwLTQwNjMtYjkzYy05Y2U2ODE4OGU1NGYiLCJzY3AiOiJ2Ym1kYS5yZWFkIiwiYXpwIjoiMjYzY2I4MzMtZjQxMy00ZDNlLTk4YjYtNTMzY2E0NzIzMTMzIiwidmVyIjoiMS4wIiwiaWF0IjoxNjY0ODY4Nzk3fQ.UvCkZ1L0i6aUQHNrQc0dmq1Ll68Pb2IQv41J3COffel-sOjdNyGzIwHssBLeRo3ERu6BWiec9NvO7fFcE9du06iHjG2MLQkIxF1f0TaB4MsGKHjCEZwHC8X29rPgKb3p_oJB6zJBBVbJ7x6UBAm8E1Y040CcbzdLv_ebV9ePPAl69u9ItJVmrtwlPR5X3FDz7MdQ0UAMz7ByDkdTwXoxUyxo8hI9ZRimO_RuIlNDTyhC6otNQA0oGQ9QJyrIG1K-wWi5h0cxp_pRSULRkfMPZp1yv4eM6Z3cEZaK5Wck_PIL7D3vP3QYs6IR1jrN8C3PtgbKjjYv0EoPv-fyNVxYcQ

*** Keywords ***
Get CUDIR
    ${cur_dir}  set variable    ${CURDIR}
    [Return]    ${cur_dir}

Get URL
    [Arguments]    ${service}
    [Return]    ${schemes}://${host}/${service}${basePath}
