Feature: Parameter Examples

  Background:
    * def kraftBaseURL = "https://www.krafttechexlab.com/sw/api/v1"
    * def bookstoreBaseURL = "https://bookstore.toolsqa.com"

  Scenario: Path parameter with kraft -1
      #request
    Given url kraftBaseURL+"/allusers/getbyid"
    And path "allusers/getbyid"
    And path "5"
    When method GET
      #response
    Then status 200

  Scenario: Path parameter with kraft -2  (Endpointi path keywordü ile de kullanabiliriz.)
      #request
    Given url kraftBaseURL
    And path "allusers/getbyid"
    And path "5"
    When method GET
      #response
    Then status 200

    Scenario: Verify response body for 5th user
      * def expectedUser =
      """
      [
    {
        "id": 5,
        "name": "isa akyuz",
        "email": "isaakyuz0811@gmail.com",
        "password": "$2y$10$1l5GsACOln7MYqZLM.OyEuK.BQtI4iU8nBlkXTerzGrSYf8S.1oN6",
        "about": null,
        "terms": "1",
        "date": "2022-09-12 20:50:38",
        "job": null,
        "company": null,
        "website": null,
        "location": null,
        "skills": [],
        "github": null,
        "twitter": null,
        "facebook": null,
        "youtube": null,
        "linkedin": null,
        "instagram": null,
        "avatar": "1",
        "admin": "1",
        "education": [],
        "experience": []
    }
]
      """
      Given url kraftBaseURL+"/allusers/getbyid"
      And path '5'
      When method GET
      Then status 200
      And match response == expectedUser

      Scenario: query parameters - 1
        * def endPoint = "/allusers/alluser"
        #request
        Given url kraftBaseURL+endPoint
        And param page = 1
        And param pagesize = 10
        When method get
        #response
        Then status 200
        Then match header Content-Type == "application/json; charset=UTF-8"
        Then match response[4].id == 33
        Then match response[4].name == "Sebastian"

  Scenario: query parameters - 2
    * def endPoint = "/allusers/alluser"
        #request
    Given url kraftBaseURL+endPoint
    And param page = 1
    And param pagesize = 5
    And param skills = "PHP"
    When method get
        #response
    Then status 200
    Then match header Content-Type == "application/json; charset=UTF-8"
    * print response[0].name
    * print response[0].skills

    #verify skills for the first user ["PHP","Java"]
    Then match response[0].skills == ["PHP","Java"]

    #verify each id is a number
    Then match each response[*].id == '#number'

    #verify ids
  * def ids = get response[*].id
    Then match ids == [1,102,110,111,122]

    #how to make a verification with a loop (bookstore)
  Scenario: verification with loop
    Given url bookstoreBaseURL+'/BookStore/v1/Books'
    When method get
    Then status 200
    #verify that all isbns are string
    And match each response.books[*].isbn == '#string'

