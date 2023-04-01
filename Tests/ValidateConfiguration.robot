*** Settings ***
Documentation    Test cases for validating IP configuration
Library  OperatingSystem
Library  Process

*** Test Cases ***
Validate IP Configuration for corp with Connectivity Issue
    ${result}=  Run Process  ping https://moc-noc-api.deta.dev/moc-noc/v1/network/corp -c 1
    Should Contain  ${result.stderr}  0 packets received
    ${result}=  Run Process  arp -a  shell=True
    ${output}=  Convert To String  ${result.stdout}
    Should Contain  ${output}  10.100.0.1
    ${result}=  Run Process  nslookup 10.100.0.1
    ${output}=  Convert To String  ${result.stdout}
    Should Contain  ${output}  name = https://moc-noc-api.deta.dev/moc-noc/v1/network/corp


Validate IP Configuration for guest with Connectivity Issue
    ${result}=  Run Process  ping https://moc-noc-api.deta.dev/moc-noc/v1/network/guest -c 1
    Should Contain  ${result.stderr}  0 packets received
    ${result}=  Run Process  arp -a  shell=True
    ${output}=  Convert To String  ${result.stdout}
    Should Contain  ${output}  172.16.0.1
    ${result}=  Run Process  nslookup 172.16.0.1
    ${output}=  Convert To String  ${result.stdout}
    Should Contain  ${output}  name = https://moc-noc-api.deta.dev/moc-noc/v1/network/guest

Validate IP Configuration for corp with No Connectivity Issue
    ${result}=  Run Process  ping  10.100.0.1 -c 1
    Should Contain  ${result.stdout}  1 packets received

Validate IP Configuration for guest with No Connectivity Issue
    ${result}=  Run Process  ping   172.16.0.1 -c 1
    Should Contain  ${result.stdout}  1 packets received
