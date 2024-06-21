***Settings***
Documentation    KWs helpers

Resource    ${EXECDIR}/resources/base.robot

***Keywords***
Login With
    [Arguments]    ${email}    ${password}
    ${payload_login}     Payload Login    ${email}            ${password}
    ${response_login}    Post Login       ${payload_login}

    &{headers}    Create Dictionary    Authorization=${response_login.json()}[authorization]

    RETURN    &{headers}