Feature: Obter a lista de usuarios

  Background: Definir a url base
    Given url 'https://reqres.in/api'
    And def byIdSchema = read('schemas/ReqresInApiId.json')
    And def dataSchema = read('schemas/ReqresInApiUsersData.json')
    And def supportSchema = read('schemas/ReqresInApiSupport.json')
    And def rootSchema = read('schemas/ReqresInApi.json')
    And def faker = Java.type('com.github.javafaker.Faker')
    And def fakerObj =  new faker()
    And def firstName = fakerObj.name().firstName()
    And def job = fakerObj.job().title()
    And def randomId = fakerObj.number().numberBetween(1, 12)
    And header Host = 'reqres.in'
    And header Accept = 'application/json'
    And header Connection = 'keep-alive'
    And header 'User-Agent' = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.90 Safari/537.36'

  @regressive @acceptance @development @users
  Scenario: Obter a lista de usuarios
    And path '/users'
    When method GET
    Then assert responseStatus == 200
    And assert responseType == 'json'
    And match response == '##(rootSchema)'

  @regressive @acceptance @development @users
  Scenario: Obter usuario pelo ID
    And path '/users/' + randomId
    When method GET
    Then assert responseStatus == 200
    And assert responseType == 'json'
    And match response == '##(byIdSchema)'
    And print response

  @regressive @acceptance @development @users
  Scenario: Cadastrar novo usuario
    When path '/users'
    And def requestBody = read('schemas/UserPOSTRequestBody.json')
    And def responseBody = read('schemas/UserPOSTResponseBody.json')
    And method POST
    Then assert responseStatus == 201
    And print requestBody
    And assert responseType == 'json'
    And match response == '##(responseBody)'

  @regressive @acceptance @development @users
  Scenario: Alterar dados do usuario
    When path '/users/' + randomId
    And def requestBody = read('schemas/UserPOSTRequestBody.json')
    And def responseBody = read('schemas/UserPUTResponseBody.json')
    And method PUT
    Then assert responseStatus == 200
    And print requestBody
    And assert responseType == 'json'
    And match response == '##(responseBody)'
    And print response

  @regressive @acceptance @development @users
  Scenario: Excluir dados do usuario
    When path '/users/' + randomId
    And method DELETE
    Then assert responseStatus == 204
    And assert responseType == 'string'
    And print response