***Settings***
Library    DateTime
Library    RequestsLibrary
Library    Browser
Library    String
Library    OperatingSystem
Library    Collections
Library    factories/login.py

Resource    routes/login.robot
Resource    helpers.robot

***Variables***

${base_url}    ${localhost}

${localhost}    http://localhost:3000
