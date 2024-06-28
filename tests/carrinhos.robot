***Settings***
Documentation    Testes da api de carrinhos

Resource    ${EXECDIR}/resources/base.robot

***Test Cases***
Deve Criar Um Carrinho
    [Tags]    SmokeTest
    ${headers}          Login With               fulano@qa.com    teste
    Concluir Compras    ${headers}
    ${produto}          Criar Produto            Produto          5000          Smartphone    50    ${headers}
    ${payload}          Payload Novo Carrinho    ${produto}       30
    ${response}         Post Carrinhos           ${payload}       ${headers}

    Status Should Be    201                            ${response}
    Should Be Equal     ${response.json()}[message]    Cadastro realizado com sucesso

Deve Conultar Um Carrinho
    [Tags]    SmokeTest
    ${headers}          Login With               fulano@qa.com    teste
    Concluir Compras    ${headers}
    ${produto}          Criar Produto            ProdutoGet       5000          Produto    50    ${headers}
    ${payload}          Payload Novo Carrinho    ${produto}       30
    ${post_response}    Post Carrinhos           ${payload}       ${headers}

    ${response}         Get Carrinhos
    Status Should Be    200                                   ${response}
    Should Be True      ${response.json()}[quantidade] > 0

Deve Consultar Um Carrinho Por Id
    [Tags]    SmokeTest
    ${headers}          Login With               fulano@qa.com    teste
    Concluir Compras    ${headers}
    ${produto}          Criar Produto            ProdutoGetId     5000          Produto    50    ${headers}
    ${payload}          Payload Novo Carrinho    ${produto}       30
    ${post_response}    Post Carrinhos           ${payload}       ${headers}

    ${carrinho_id}      Set Variable            ${post_response.json()}[_id]
    ${response}         Get Carrinhos Por Id    ${carrinho_id}
    Status Should Be    200                     ${response}

Concluir Carrinho De Compra
    [Tags]    SmokeTest
    ${headers}          Login With               fulano@qa.com        teste
    Concluir Compras    ${headers}
    ${produto}          Criar Produto            Produto Concluido    5000          Produto    50    ${headers}
    ${payload}          Payload Novo Carrinho    ${produto}           30
    ${post_response}    Post Carrinhos           ${payload}           ${headers}

    ${response}    Concluir Compras    ${headers}

    Status Should Be    200                            ${response}
    Should Be Equal     ${response.json()}[message]    Cadastro realizado com sucesso

Cancelar Carrinho De Compra
    [Tags]    SmokeTest
    ${headers}          Login With               fulano@qa.com        teste
    Concluir Compras    ${headers}
    ${produto}          Criar Produto            Produto Cancelado    5000          Produto    50    ${headers}
    ${payload}          Payload Novo Carrinho    ${produto}           30
    ${post_response}    Post Carrinhos           ${payload}           ${headers}

    ${response}    Cancelar Compras    ${headers}

    Status Should Be    200                            ${response}
    Should Be Equal     ${response.json()}[message]    Registro excluído com sucesso. Estoque dos produtos reabastecido

***Keywords***
Criar Produto
    [Arguments]    ${nome}    ${preco}    ${desc}    ${quant}    ${headers}
    ${nome_prod}     Set Variable    ${nome}
    ${preco_prod}    Set Variable    ${preco}
    ${desc_prod}     Set Variable    ${desc}
    ${quant_prod}    Set Variable    ${quant}

    ${payload}     Payload Novo Produto    ${nome_prod}    ${preco_prod}    ${desc_prod}    ${quant_prod}
    ${response}    Post Produto            ${payload}      ${headers}

    Status Should Be    201    ${response}

    RETURN    ${response.json()}[_id]
