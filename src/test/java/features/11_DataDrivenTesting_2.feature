Feature: Data Driven Testing - 2

  Background:
    * def kraftBaseUrl = "https://www.krafttechexlab.com/sw/api/v1"

  Scenario Outline:  Login users - 1

    Given url kraftBaseUrl+"/allusers/login"
    * form field email = "<email>"
    * form field password = '<password>'

    When method POST
    * status 200
    * print response

    Examples:
      | email            | password    |
      | mgezer@gmail.com | Mg12345678  |
      | thomas@test.com  | Test123456! |
      | Ramanzi@test.com | Test123456  |
      | user11@test.com  | Test123456  |
      | user22@test.com  | Test123456  |
      | user33@test.com  | Test123456  |
      | user44@test.com  | Test123456  |
      | user55@test.com  | Test123456  |
      | user66@test.com  | Test123456  |

  Scenario Outline: Login Users - 2

    Given url kraftBaseUrl
    * path "/allusers/login"
    * form field email = "<email>"
    * form field password = '<password>'

    When method POST
    * status 200
    * print response

    Examples:
      | read('data/userCredentials.csv') |
