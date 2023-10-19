Feature: Post Method + Karate/Java Integration

  Background:
    * def kraftBaseURL = "https://www.krafttechexlab.com/sw/api/v1"

    Scenario: Register a new user with kraft
      Given url kraftBaseURL+"/allusers/register"
      And request
      """
      {
  "name": "Aylin Aka",
  "email": "aylin24@krafttechexlab.com",
  "password": "123467",
  "about": "About Me",
  "terms": "10"
      }
      """
      When method POST
      #response
      Then status 200
      Then print response

      Scenario: Register a new user with the help of java map - 1
        # point the class that we want to run
        #Java.type  --> used for connect to java class

        * def KDG = Java.type("utilities.KraftDataGenerator")
        * def newUser1 = KDG.createUser()

        Given url kraftBaseURL+"/allusers/register"
        And request newUser1
        When method POST
        #response
        Then status 200
        Then print response
        Then match response.name == newUser1.name
        Then match response.email == newUser1.email

  Scenario: Register a new user with the help of java map - 2
        # point the class that we want to run
        #Java.type  --> used for connect to java class

    * def newUser2 = Java.type("utilities.KraftDataGenerator").createUser()

    Given url kraftBaseURL+"/allusers/register"
    And request newUser2
    When method POST
        #response
    Then status 200
    Then print response
    Then match response.name == newUser2.name
    Then match response.email == newUser2.email

    Scenario: Register a new user with the help of json file
      * def newUser3 = read("data/newUser.json")

      Given url kraftBaseURL+"/allusers/register"
      And request newUser3
      When method POST
        #response
      Then status 200
      Then print response
      Then match response.name == newUser3.name
      Then match response.email == newUser3.email