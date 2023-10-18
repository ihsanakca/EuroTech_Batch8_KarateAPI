Feature: Assertion by using match keyword

  Scenario: some match example
    * def name = 'Ahmet'
    * match name == "Ahmet"
    * match name != "Mehmet"

  Scenario: more matching example
    * def employee =
      """
      {
      "name":"Hasan",
      "lastName":"Aksaz",
      "salary":25000,
      "active":true
      }
      """
    * print employee
    * match employee.name == 'Hasan'
    * match employee.lastName == 'Aksaz'
    * match employee.salary == 25000
    * match employee.active == true

  Scenario: fuzzy matching
    * def employee =
      """
      {
      "name":"Hasan",
      "lastName":"Aksaz",
      "salary":25000,
      "active":true
      }
      """
    * match employee.name == '#string'
    * match employee.lastName == '#string'
    * match employee.salary == '#number'
    * match employee.active == '#boolean'
    * match employee.active == '#present'
    * match employee.location == '#notpresent'

  Scenario: Contains Matching
    * def employee =
      """
      [
      {
      "name":"Hasan",
      "lastName":"Aksaz",
      "salary":25000,
      "active":true
      },
      {
      "name":"Aylin",
      "lastName":"Kara",
      "salary":35000,
      "active":false
      }
      ]
      """
    * def lengthOfArray = employee.length
    * print lengthOfArray
    * match lengthOfArray == 2
    * print employee
    * match employee contains  {"name":"Hasan","lastName":"Aksaz","salary":25000,"active":true}

    Scenario: Contains Matching - 2
      * def users = ["Ahmet","Mehmet","Esma","Serap"]
      * print users
      * match users contains "Ahmet"
      * def user1 = "Mehmet"
      * match users contains user1
      * match users contains ["Esma",'Ahmet']