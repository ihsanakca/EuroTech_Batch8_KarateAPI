Feature: Basic Api Tests

  Scenario: Basic status code validation with bookstore
    #request
    Given url "https://bookstore.toolsqa.com/BookStore/v1/Books"
    When method GET
    #response
    Then status 200

  Scenario: Basic status code validation with kraft
    Given url "https://www.krafttechexlab.com/sw/api/v1/allusers/getbyid/62"
    When method get
    Then status 200

  Scenario: Basic header verification with bookstore
    #request
    Given url "https://bookstore.toolsqa.com/BookStore/v1/Books"
    When method GET
    #response
    Then status 200
    # verify headers
    Then match header Content-Type == "application/json; charset=utf-8"
    Then match header Connection == "keep-alive"
    * match header Date == '#present'

    Scenario: Basic response body verification with bookstore
       #request
      Given url "https://bookstore.toolsqa.com/BookStore/v1/Books"
      When method GET
      #response
      Then status 200
      Then match header Content-Type == "application/json; charset=utf-8"
      # print response body
      And print response
      And match response.books[0].isbn == "9781449325862"
      And match response.books[1].title == "Learning JavaScript Design Patterns"
      And match response.books[2].subTitle == '#present'


