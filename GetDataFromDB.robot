*** Settings ***
Library    DatabaseLibrary

*** Variables ***
${dbName}    promotion-service
${dbHost}    vbmda-val.postgres.database.azure.com
${dbPort}     5432
${dbUsername}    promotion-service@vbmda-val
${dbPassword}    XC5Fr8sryRn4B9j5TrtU

*** Test Cases ***
Check DB Exist
    connect to database    psycopg2    ${dbName}    ${dbUsername}    ${dbPassword}    ${dbHost}    ${dbPort}
    @{result}=   Query    SELECT count(*) FROM coupon

    ${column 1}    Evaluate    [x[0] for x in $result]
    log to console    ${column 1}[0]



