***Settings***
Documentation    Implementação da rota /Carrinhos

Resource    ${EXECDIR}/resources/base.robot

***Keywords***
Post Carrinhos
    [Arguments]    ${payload}    ${headers}

    ${response}    POST
    ...            ${base_url}/carrinhos
    ...            json=${payload}
    ...            headers=${headers}
    ...            expected_status=any

    RETURN    ${response}

Get Carrinhos
    ${response}    GET
    ...            ${base_url}/carrinhos
    ...            expected_status=any

    RETURN    ${response}

Get Carrinhos Por Id
    [Arguments]    ${params}
    ${response}    GET
    ...            ${base_url}/carrinhos/${params}
    ...            expected_status=any

    RETURN    ${response}

Concluir Compras
    [Arguments]    ${headers}
    ${response}    DELETE
    ...            ${base_url}/carrinhos/concluir-compra
    ...            headers=${headers}
    ...            expected_status=any

    RETURN    ${response}

Cancelar Compras
    [Arguments]    ${headers}
    ${response}    DELETE
    ...            ${base_url}/carrinhos/cancelar-compra
    ...            headers=${headers}
    ...            expected_status=any

    RETURN    ${response}