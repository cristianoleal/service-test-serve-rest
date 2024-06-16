***Settings***
Documentation    Testes da api de login

Resource    ${EXECDIR}/resources/base.robot

***Test Cases***
Deve Realizar Login Com Sucesso
    [Tags]    SmokeTest
    ${email}       Set Variable     fulano@qa.com
    ${password}    Set Variable     teste
    ${payload}     Payload Login    ${email}           ${password}

    ${response}    Post Login    ${payload}

    Status Should Be    200                                  ${response}
    Should Be Equal     ${response.json()}[message]          Login realizado com sucesso
    Length Should Be    ${response.json()}[authorization]    192

Não Deve Realizar Login Com Usuario Inválido
    [Tags]    SmokeTest
    ${email}       Set Variable     email@invalido.com
    ${password}    Set Variable     invalido
    ${payload}     Payload Login    ${email}              ${password}

    ${response}    Post Login    ${payload}

    Status Should Be    401                            ${response}
    Should Be Equal     ${response.json()}[message]    Email e/ou senha inválidos