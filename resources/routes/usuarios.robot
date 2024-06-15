***Settings***
Documentation    Implementação da rota /Usuarios

Resource    ${EXECDIR}/resources/base.robot

***Keywords***
Get Usuarios
    [Arguments]    ${params}

    ${response}    GET
    ...            ${base_url}/usuarios
    ...            params=${params}
    ...            expected_status=any

    RETURN    ${response}

Post Usuarios
    [Arguments]    ${payload}

    ${response}    POST
    ...            ${base_url}/usuarios
    ...            json=${payload}
    ...            expected_status=any

    RETURN    ${response}

Delete Usuarios
    [Arguments]    ${id}

    ${response}    DELETE
    ...            ${base_url}/usuarios/${id}
    ...            expected_status=any

    RETURN    ${response}

Get Usuarios Pelo Id
    [Arguments]    ${id}

    ${response}    GET
    ...            ${base_url}/usuarios/${id}
    ...            expected_status=any

    RETURN    ${response}

Put Usuarios
    [Arguments]    ${id}    ${payload}

    ${response}    PUT
    ...            ${base_url}/usuarios/${id}
    ...            json=${payload}
    ...            expected_status=any

    RETURN    ${response}