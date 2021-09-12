*Settings*
Documentation    Get Equipos Tests

Resource    ${EXECDIR}/resources/Base.robot

*Test Cases*
Get Unique

    ${token}     Get token    sambora@bonjovi.com    pwd123
    ${equipo}    Get Json     equipos                piano.json

    Remove Equipo    ${equipo}[payload][name]
    ${result}        POST Equipo                 ${equipo}                ${token}
    ${equipo_id}     Set Variable                ${result.json()}[_id]

    ${response}    GET Unique Equipo    ${token}    ${equipo_id}

    Status Should Be    200    ${response}

    Should Be Equal    ${equipo}[payload][name]        ${response.json()}[name]
    Should Be Equal    ${equipo}[payload][category]    ${response.json()}[category]
    Should Be Equal    ${equipo}[payload][price]       ${response.json()}[price]


Equipo Not Found

    ${equipo_id}    Get Mongo Id

    ${token}    Get Token    sambora@bonjovi.com    pwd123

    ${response}    GET Unique Equipo    ${token}    ${equipo_id}

    Status Should Be    404    ${response}

Get Equipo List

    ${token}    Get Token    rita.lee@yahoo.com    pwd123

    ${list}    Get Json    equipos    list.json

    FOR    ${item}    IN    @{list}
        Remove Equipo    ${item}[payload][name]
        POST Equipo      ${item}    ${token}
    END

    ${response}         GET Equipos    ${token}
    Status Should Be    200            ${response}

    ${total}          Get Length      ${response.json()}
    Should Be True    ${total} > 0
