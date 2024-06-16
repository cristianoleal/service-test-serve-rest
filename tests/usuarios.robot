***Settings***
Documentation    Testes da api de usuarios

Resource    ${EXECDIR}/resources/base.robot

***Test Cases***
Deve Consultar Pelo Nome Usuario
    [Tags]    SmokeTest
    &{params}    Create Dictionary    nome=fulano

    ${response}    Get Usuarios    params=${params}

    Status Should Be              200                                               ${response}
    Should Be Equal As Numbers    ${response.json()}[quantidade]                    1
    Should Be Equal               ${response.json()}[usuarios][0][nome]             Fulano da Silva
    Should Be Equal               ${response.json()}[usuarios][0][email]            Fulano da Silva
    Should Be Equal               ${response.json()}[usuarios][0][password]         teste
    Should Be Equal               ${response.json()}[usuarios][0][administrador]    true
    Should Be Equal               ${response.json()}[usuarios][0][_id]              0uxuPY0cbmQhpEz1

Deve Criar Um Novo Usuario
    [Tags]    SmokeTest
    ${payload}    Payload Novo Usuario

    ${response}    Post Usuarios    ${payload}

    Status Should Be    201                            ${response}
    Should Be Equal     ${response.json()}[message]    Cadastro realizado com sucesso
    Delete Usuarios     ${response.json()}[_id]

Consultar Usuario Pelo Id
    [Tags]    SmokeTest
    ${payload}          Payload Novo Usuario
    ${post_response}    Post Usuarios           ${payload}

    ${response}    Get Usuarios Pelo Id    ${post_response.json()}[_id]

    Status Should Be    200                                  ${response}
    Should Be Equal     ${response.json()}[nome]             Novo Usuario
    Should Be Equal     ${response.json()}[email]            novo@usuario.com
    Should Be Equal     ${response.json()}[password]         senha
    Should Be Equal     ${response.json()}[administrador]    false
    Should Be Equal     ${response.json()}[_id]              ${post_response.json()}[_id]

    Delete Usuarios    ${response.json()}[_id]

Delete Usuario Pelo Id
    [Tags]    SmokeTest
    ${payload}          Payload Novo Usuario
    ${post_response}    Post Usuarios           ${payload}

    ${response}    Delete Usuarios    ${post_response.json()}[_id]

    Status Should Be    200                            ${response}
    Should Be Equal     ${response.json()}[message]    Registro excluído com sucesso

Alterar Usuario Pelo Id
    [Tags]    SmokeTest
    ${payload_novo_usuario}        Payload Novo Usuario
    ${payload_usuario_alterado}    Payload Usuario Alterado
    ${post_response}               Post Usuarios               ${payload_novo_usuario}

    ${response}    Put Usuarios    ${post_response.json()}[_id]    ${payload_usuario_alterado}

    Status Should Be    200                            ${response}
    Should Be Equal     ${response.json()}[message]    Registro alterado com sucesso

    Delete Usuarios    ${post_response.json()}[_id]