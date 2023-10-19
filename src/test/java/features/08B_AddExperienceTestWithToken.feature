Feature: Kraft Add Experience Tests


  Background:
    * def kraftBaseURL = "https://www.krafttechexlab.com/sw/api/v1"

    * def authorization = call read("07_LoginAndGetToken.feature")
    * def userTokenLast = authorization.userToken

    Scenario: Adding experience
      Given url kraftBaseURL+'/experience/add'
      And header Authorization = userTokenLast
#      And header token = userTokenLast  üsttekiyle aynı..
      And header Accept = "application/json; charset=UTF-8"
      And request
      """
      {
  "job": "Doctor",
  "company": "Kraft Hospital Inc",
  "location": "Tr",
  "fromdate": "2011-11-20",
  "todate": "2016-02-22",
  "current": "false",
  "description": "First Job"
      }
      """
      When method POST
      Then status 200
      * print response

      Given url kraftBaseURL
      And path "/experience/all"
      And header Accept = "application/json; charset=UTF-8"
      And header token = userTokenLast
      When method get
      Then status 200

      * def expectedInfo = read('classpath:data/newExperience.json')

      Then match response[-1].company == expectedInfo.company
      Then match response[-1].job == expectedInfo.job
      * def experienceId = response[response.length-1].id
      * print experienceId
      
      Given url kraftBaseURL+"/experience/getbyid"
      * path experienceId
      * header token = userTokenLast
      And header Accept = "application/json; charset=UTF-8"
      When method GET
      Then status 200
      * print response

      Then match response.job == expectedInfo.job
      Then match response.company == expectedInfo.company
      Then match response.id == experienceId

