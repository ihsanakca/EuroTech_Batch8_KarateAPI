Feature: Register a new user and get token

  Background:
    * def kraftBaseURL = "https://www.krafttechexlab.com/sw/api/v1"

    Scenario: Create a new user with Java and get token
      * def KDG = Java.type("utilities.KraftDataGenerator")
      * def newUser = KDG.createUser()

      #request
      Given url kraftBaseURL
      * path "allusers/register"
      * request newUser
      When method POST
      #response
      Then status 200
      Then match newUser.name == response.name
      * match response.id == '#number'
      * match response.id == '#present'
      #get token
      * def userToken = response.token
      * print userToken

