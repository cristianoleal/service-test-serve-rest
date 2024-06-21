***Settings***
Documentation    Testes da api de carrinhos

Resource    ${EXECDIR}/resources/base.robot

***Test Cases***
Deve Criar Um Novo Carrinho Com Um Produto
    [Tags]      SmokeTest
    ${headers}    Login With    fulano@qa.com    teste

    ${produto}     Criar Produto            Orange        5000          Smartphone    50    ${headers}
    ${payload}     Payload Novo Carrinho    ${produto}    30
    ${response}    Post Carrinhos            ${payload}    ${headers}

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