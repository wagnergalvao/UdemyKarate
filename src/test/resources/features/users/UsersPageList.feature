Feature: Obter a lista de usuarios por pagina

  Scenario: Obter a lista de usuarios
    Given url 'https://reqres.in/api/users?page=1'
    When method GET
    Then status 200

  Scenario: Obter a lista de usuarios vazia
    Given url 'https://reqres.in/api/users?page=99'
    When method GET
    Then status 200