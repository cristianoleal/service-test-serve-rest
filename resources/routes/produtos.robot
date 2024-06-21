***Settings***
Documentation    Implementação da rota /Produtos

Resource    ${EXECDIR}/resources/base.robot

***Keywords***
Post Produto
    [Arguments]    ${payload}    ${headers}

    ${response}    POST
    ...            ${base_url}/produtos
    ...            json=${payload}
    ...            headers=${headers}
    ...            expected_status=any

    RETURN    ${response}