***Settings***
Documentation    Implementação da rota /Login

Resource    ${EXECDIR}/resources/base.robot

***Keywords***
Post Login
    [Arguments]    ${payload}

    ${response}    POST
    ...            ${base_url}/login
    ...            json=${payload}
    ...            expected_status=any

    RETURN    ${response}