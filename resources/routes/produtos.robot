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

Get Produtos
    ${response}    GET
    ...            ${base_url}/produtos
    ...            expected_status=any

    RETURN    ${response}

Delete Produto
    [Arguments]    ${params}    ${headers}

    ${response}    DELETE
    ...            ${base_url}/produtos/${params}
    ...            headers=${headers}
    ...            expected_status=any

    RETURN    ${response}

Alterar Produto
    [Arguments]    ${params}    ${payload}    ${headers}

    ${response}    PUT
    ...            ${base_url}/produtos/${params}
    ...            json=${payload}
    ...            headers=${headers}
    ...            expected_status=any

    RETURN    ${response}