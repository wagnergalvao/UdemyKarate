Feature: Obter a lista completa de cores

  Background: Definir a url base
    Given url 'https://reqres.in/api'
    * def dataSchema = read('classpath:schemas/ReqresInApiUnknownData.json')
    * def supportSchema = read('classpath:schemas/ReqresInApiSupport.json')

  Scenario: Obter a lista de cores
    And path '/unknown'
    When method GET
    Then assert responseStatus == 200
    * assert responseType == 'json'
    * def rootSchema = read('classpath:schemas/ReqresInApi.json')
    * match response == '##(rootSchema)'

  Scenario: Obter cor pelo ID
    And path '/unknown/1'
    When method GET
    Then assert responseStatus == 200
    * assert responseType == 'json'
    * def colorSchema = read('classpath:schemas/ReqresInApiUnknownId.json')
    * match response == '##(colorSchema)'
