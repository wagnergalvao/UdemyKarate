Feature: Obter a lista completa de cores


  Background: Definir a url base
    Given url 'https://reqres.in/api'
    * def byIdSchema = read('schemas/ReqresInApiId.json')
    * def dataSchema = read('schemas/ReqresInApiUnknownData.json')
    * def supportSchema = read('schemas/ReqresInApiSupport.json')
    * def rootSchema = read('schemas/ReqresInApi.json')

  @regressive @acceptance @development @colors
  Scenario: Obter a lista de cores
    And path '/unknown'
    When method GET
    Then assert responseStatus == 200
    * assert responseType == 'json'
    * match response == '##(rootSchema)'

  @regressive @acceptance @development @colors
  Scenario: Obter cor pelo ID
    And path '/unknown/1'
    When method GET
    Then assert responseStatus == 200
    * assert responseType == 'json'
    * match response == '##(byIdSchema)'
