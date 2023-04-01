*** Settings ***
Documentation    Test cases for validating API test
Library               RequestsLibrary

*** Test Cases ***

Quick Get Request Test
    ${response}=    GET  https://moc-noc-api.deta.dev/moc-noc/v1/network/corp

# Following code check 200 response code for corp
Positive Test case for corp
    ${response}=    GET  https://moc-noc-api.deta.dev/moc-noc/v1/network/corp  params=query=ciao  expected_status=200

Negative Test case for corp
    ${response}=    GET  https://moc-noc-api.deta.dev/moc-noc/v1/network/corp2  params=query=ciao  expected_status=500

# Following code check 200 response code for guest
Positive Test case for quest
    ${response}=    GET  https://moc-noc-api.deta.dev/moc-noc/v1/network/guest  params=query=ciao  expected_status=200

Negative Test case for guest
    ${response}=    GET  https://moc-noc-api.deta.dev/moc-noc/v1/network/guest2  params=query=ciao  expected_status=500