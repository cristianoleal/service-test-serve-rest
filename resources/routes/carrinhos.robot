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