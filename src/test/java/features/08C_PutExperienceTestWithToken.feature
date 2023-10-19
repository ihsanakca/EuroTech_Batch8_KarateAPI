Feature: Kraft Update (PUT) Experience Test

  Background:
    * def kraftBaseURL = "https://www.krafttechexlab.com/sw/api/v1"

    * def authorization = call read("07_LoginAndGetToken.feature")
    * def userTokenLast = authorization.userToken

    * def experienceInfo = call read("08B_AddExperienceTestWithToken.feature")
    * def experienceId_Update = experienceInfo.experienceId

    Scenario: Put Experience
      Given url kraftBaseURL+"/experience/updateput"
      And header token = userTokenLast
      And param id = experienceId_Update
      And request
      """
      {
  "job": "Doctor",
  "company": "Peru Hospital Inc",
  "location": "Peru",
  "fromdate": "2011-11-20",
  "todate": "2016-02-22",
  "current": "false",
  "description": "Second Job"
}
      """
      When method PUT
      Then status 200
      * print response

      Given url kraftBaseURL+"/experience/getbyid"
      * path experienceId_Update
      * header token = userTokenLast
      And header Accept = "application/json; charset=UTF-8"
      When method GET
      Then status 200
      * print response
      Then match response.company == "Peru Hospital Inc"