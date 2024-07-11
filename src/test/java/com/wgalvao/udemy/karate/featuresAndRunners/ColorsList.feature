Feature: Obter a lista completa de cores


  Background: Definir a url base
    Given url 'https://reqres.in/api'
    And def byIdSchema = read('schemas/ReqresInApiId.json')
    And def dataSchema = read('schemas/ReqresInApiUnknownData.json')
    And def supportSchema = read('schemas/ReqresInApiSupport.json')
    And def rootSchema = read('schemas/ReqresInApi.json')

  @regressive @acceptance @development @colors
  Scenario: Obter a lista de cores
    And path '/unknown'
    When method GET
    Then assert responseStatus == 200
    And assert responseType == 'json'
    And match response == '##(rootSchema)'

  @regressive @acceptance @development @colors
  Scenario: Obter cor pelo ID
    And path '/unknown/1'
    When method GET
    Then assert responseStatus == 200
    And assert responseType == 'json'
    And match response == '##(byIdSchema)'
