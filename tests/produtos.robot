***Settings***
Documentation    Testes da api de produtos

Resource    ${EXECDIR}/resources/base.robot

***Test Cases***
Deve Criar Um Novo Produto
    [Tags]    SmokeTest
    ${nome_prod}     Set Variable    Samsung Eletro
    ${preco_prod}    Set Variable    1000
    ${desc_prod}     Set Variable    TV
    ${quant_prod}    Set Variable    100

    ${headers}     Login With              fulano@qa.com    teste
    ${payload}     Payload Novo Produto    ${nome_prod}     ${preco_prod}    ${desc_prod}    ${quant_prod}
    ${response}    Post Produto            ${payload}       ${headers}

    Status Should Be    201                            ${response}
    Should Be Equal     ${response.json()}[message]    Cadastro realizado com sucesso
Deve Retornar Todos Os Produto
    [Tags]    SmokeTest
    ${response}         Get Produtos
    Status Should Be    200                                   ${response}
    Should Be True      ${response.json()}[quantidade] > 0

Deve Retornar Produto Por Id
    [Tags]    SmokeTest
    ${nome_prod}     Set Variable    Get Produto
    ${preco_prod}    Set Variable    5000
    ${desc_prod}     Set Variable    Get Id
    ${quant_prod}    Set Variable    500

    ${headers}          Login With              fulano@qa.com                   teste
    ${payload}          Payload Novo Produto    ${nome_prod}                    ${preco_prod}    ${desc_prod}    ${quant_prod}
    ${post_response}    Post Produto            ${payload}                      ${headers}
    ${response}         Get Produtos Por Id     ${post_response.json()}[_id]

    Status Should Be    200                                   ${response}
    Should Be True      ${response.json()}[quantidade] > 0

Deve Deletar Um Produto
    [Tags]    SmokeTest
    ${nome_prod}     Set Variable    Delete Produto
    ${preco_prod}    Set Variable    1000
    ${desc_prod}     Set Variable    Delete
    ${quant_prod}    Set Variable    100

    ${headers}          Login With              fulano@qa.com                   teste
    ${payload}          Payload Novo Produto    ${nome_prod}                    ${preco_prod}    ${desc_prod}    ${quant_prod}
    ${post_response}    Post Produto            ${payload}                      ${headers}
    ${response}         Delete Produto          ${post_response.json()}[_id]    ${headers}

    Status Should Be    200                            ${response}
    Should Be Equal     ${response.json()}[message]    Registro excluído com sucesso

Deve Alterar Um Produto
    [Tags]    SmokeTest
    ${nome_prod}     Set Variable    Produto Novo
    ${preco_prod}    Set Variable    1000
    ${desc_prod}     Set Variable    descricao
    ${quant_prod}    Set Variable    100

    ${headers}          Login With              fulano@qa.com    teste
    ${payload}          Payload Novo Produto    ${nome_prod}     ${preco_prod}    ${desc_prod}    ${quant_prod}
    ${post_response}    Post Produto            ${payload}       ${headers}

    ${novo_nome}     Set Variable            Nome Alterado
    ${novo_preco}    Set Variable            2000
    ${novo_desc}     Set Variable            Desc Alterado
    ${novo_quant}    Set Variable            500
    ${payload}       Payload Novo Produto    ${novo_nome}                    ${novo_preco}    ${novo_desc}    ${novo_quant}
    ${response}      Alterar Produto         ${post_response.json()}[_id]    ${payload}       ${headers}

    Status Should Be    200                            ${response}
    Should Be Equal     ${response.json()}[message]    Registro alterado com sucesso