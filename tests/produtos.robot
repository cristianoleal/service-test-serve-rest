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
