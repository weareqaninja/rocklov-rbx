*Settings*
Documentation    Login Tests

Resource    ${EXECDIR}/resources/Base.robot

Suite Setup      Start Session
Test Teardown    Finish Test

*Test Cases*
User Login
    [Tags]    user_login

    Login With                  rogers@shield.com             pwd123
    User Should Be Logged In
    [Teardown]                  Take Screenshot And Logout

Incorret Password
    [Tags]    attempt_login

    Login With              rogers@shield.com                abc987
    Alert Text Should Be    Usuário e/ou senha inválidos.


User not found
    [Tags]    attempt_login

    Login With              404@yahoo.com                    abc987
    Alert Text Should Be    Usuário e/ou senha inválidos.

Empty email
    [Tags]    attempt_login

    Login With              ${EMPTY}                          abc987
    Alert Text Should Be    Oops. Informe um email válido!

Empty password
    [Tags]    attempt_login

    Login With              404@yahoo.com                       ${EMPTY}
    Alert Text Should Be    Oops. Informe sua senha secreta!

Incorret Email
    [Tags]    attempt_login

    Login With              rogers&shield.com                 abc123
    Alert Text Should Be    Oops. Informe um email válido!
