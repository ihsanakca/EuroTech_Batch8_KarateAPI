Feature: Login and get token

  Background:
    * def kraftBaseURL = "https://www.krafttechexlab.com/sw/api/v1"

    Scenario: Login and get token - 1
      Given url kraftBaseURL+'/allusers/login'
      And multipart field email = "mgezer@gmail.com"
      And multipart field password = "Mg12345678"
      When method post
      #response
      Then status 200
      Then match response.token == '#present'
      * def userToken = response.token
      * print response


# üstteki senaryonun görevini yapar...
#  Scenario: Login and get token - 2
#    Given url kraftBaseURL+'/allusers/login'
#    And form field email = "mgezer@gmail.com"
#    And form field password = "Mg12345678"
#    When method post
#      #response
#    Then status 200
#    Then match response.token == '#present'
#    * def userToken = response.token
#    * print response