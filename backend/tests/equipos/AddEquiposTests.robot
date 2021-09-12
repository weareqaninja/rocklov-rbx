*Settings*
Documentation    Add Equipos Tests

Resource    ${EXECDIR}/resources/Base.robot

*Test Cases*
Add New Equipo

    ${token}      Get token    sambora@bonjovi.com    pwd123
    ${equipo}     Get Json     equipos                fender.json

    Remove Equipo    ${equipo}[payload][name]

    ${response}    POST Equipo    ${equipo}    ${token}

    Status Should Be    200    ${response}