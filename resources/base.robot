***Settings***
Library    DateTime
Library    RequestsLibrary
Library    Browser
Library    String
Library    OperatingSystem
Library    Collections
Library    factories/login.py
Library    factories/usuarios.py
Library    factories/produtos.py
Library    factories/carrinhos.py

Resource    routes/login.robot
Resource    routes/usuarios.robot
Resource    routes/produtos.robot
Resource    routes/carrinhos.robot
Resource    helpers.robot

***Variables***

${base_url}    ${localhost}

${localhost}    http://localhost:3000
