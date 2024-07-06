Feature: Obter dados de um usuario

  Scenario: Obter os dados do usuario
    Given url 'https://reqres.in/api/users/1'
    When method GET
    Then status 200

  Scenario: Obter os dados do usuario vazio
    Given url 'https://reqres.in/api/users/99'
    When method GET
    Then status 404