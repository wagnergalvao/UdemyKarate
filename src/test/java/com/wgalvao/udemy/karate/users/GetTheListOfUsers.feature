Feature: Obter a lista de usuarios

    Scenario: Obter a primeira pagina da lista de usuarios
        Given que tenho a URL da API userś 'https://reqres.in/api/users?page=1'
        When eu faco uma requisicao GET
        Then a resposta deve retornar status code "200"