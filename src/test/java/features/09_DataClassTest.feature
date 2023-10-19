Feature: Data Test

  Background:
    * def kraftBaseURL = "https://www.krafttechexlab.com/sw/api/v1"

    Scenario: get all user info with kraft
      Given url kraftBaseURL+"/allusers/alluser"
      And param page = 1
      And param pagesize = 10
      When method get
      * def expectedInfo = read("data/users.json")
      Then match response == expectedInfo