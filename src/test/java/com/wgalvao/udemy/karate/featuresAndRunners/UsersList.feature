Feature: Obter a lista de usuarios

  Background: Definir a url base
    Given url 'https://reqres.in/api'
    * def byIdSchema = read('schemas/ReqresInApiId.json')
    * def dataSchema = read('schemas/ReqresInApiUsersData.json')
    * def supportSchema = read('schemas/ReqresInApiSupport.json')
    * def rootSchema = read('schemas/ReqresInApi.json')
    * def faker = Java.type('com.github.javafaker.Faker')
    * def fakerObj =  new faker()
    * def firstName = fakerObj.name().firstName()
    * def job = fakerObj.job().title()
    * def randomId = fakerObj.number().numberBetween(1, 12)

  @regressive @acceptance @development @users
  Scenario: Obter a lista de usuarios
    And path '/users'
    When method GET
    Then assert responseStatus == 200
    * assert responseType == 'json'
    * match response == '##(rootSchema)'

  @regressive @acceptance @development @users
  Scenario: Obter usuario pelo ID
    And path '/users/' + randomId
    When method GET
    Then assert responseStatus == 200
    * assert responseType == 'json'
    * match response == '##(byIdSchema)'
    * print response

  @regressive @acceptance @development @users
  Scenario: Cadastrar novo usuario
    When path '/users'
    And def requestBody = read('schemas/UserPOSTRequestBody.json')
    And def responseBody = read('schemas/UserPOSTResponseBody.json')
    And method POST
    Then assert responseStatus == 201
    * print requestBody
    * assert responseType == 'json'
    * match response == '##(responseBody)'

  @regressive @acceptance @development @users
  Scenario: Alterar dados do usuario
    When path '/users/' + randomId
    And def requestBody = read('schemas/UserPOSTRequestBody.json')
    And def responseBody = read('schemas/UserPUTResponseBody.json')
    And method PUT
    Then assert responseStatus == 200
    * print requestBody
    * assert responseType == 'json'
    * match response == '##(responseBody)'
    * print response
