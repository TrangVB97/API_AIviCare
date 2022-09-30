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
${authorization}    eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImtpZCI6Ilg1ZVhrNHh5b2pORnVtMWtsMll0djhkbE5QNC1jNTdkTzZRR1RWQndhTmsifQ.eyJpc3MiOiJodHRwczovL3ZidmFsLmIyY2xvZ2luLmNvbS82M2UxNzMzNy1iNmQ0LTQ4MDYtYjg1OS0zYmE4ZWM3YmY4OWMvdjIuMC8iLCJleHAiOjE2NjQ1OTMxMjQsIm5iZiI6MTY2NDUwNjcyNCwiYXVkIjoiMjYzY2I4MzMtZjQxMy00ZDNlLTk4YjYtNTMzY2E0NzIzMTMzIiwib2lkIjoiZTI1YjQ2M2EtMDQxYy00NGM3LWEwN2EtZDVkNTMzYzhjNzMzIiwic3ViIjoiZTI1YjQ2M2EtMDQxYy00NGM3LWEwN2EtZDVkNTMzYzhjNzMzIiwibmFtZSI6IkJTLiBIdXnhur90IGjhu41jIEJWVE5ITiIsImdpdmVuX25hbWUiOiJIdXnhur90IGjhu41jIEJWVE5ITiIsImVtYWlscyI6WyJic19odXlldGhvY19idnRuaG5fc3RhZ2luZ0BkcmFpZC5haSJdLCJ0ZnAiOiJCMkNfMV92Ym1kYS1zaWduaW4tdjItdmFsIiwibm9uY2UiOiJjNWE3NGJkZi0wOTVmLTQyNDMtOGJlMi01OTBlMzdmNjlmZTkiLCJzY3AiOiJ2Ym1kYS5yZWFkIiwiYXpwIjoiMjYzY2I4MzMtZjQxMy00ZDNlLTk4YjYtNTMzY2E0NzIzMTMzIiwidmVyIjoiMS4wIiwiaWF0IjoxNjY0NTA2NzI0fQ.oRcLkMVsUNjk3HhMaci-ClO2d3J98YbtWydnzw2jZ5qTOgBxdtFz47saICow3Hx8o41xuoY3l1bnlBUJT1jIXBgyouaUp0e6kkp2iprNtz3mZlltpqiujbrnOzvYiZdD7ptPaQqetHhqcybF4n5Dd8Wds2Hy56PvwBEmBA0Vdse0BawnHj81fJZxT0xiHTnbboLtnjv-yrJRyCVzOQMx5M7mMqhpp3MXaLsE4tMd_ttlhBKCh8y58NBIv_NxJnGRKAznw97pjoclKhxrJWNETpuV-aUd3GUDHHpwE3bNqDLtTn1J-ronnlN0Hjjkgg_PRaV0PwoF6ioirlQSzj6Ybg

*** Keywords ***
Get CUDIR
    ${cur_dir}  set variable    ${CURDIR}
    [Return]    ${cur_dir}

Get URL
    [Arguments]    ${service}
    [Return]    ${schemes}://${host}/${service}${basePath}
