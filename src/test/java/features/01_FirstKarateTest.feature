@firstLesson
Feature: Welcome to Karate

  Scenario: How to print
    Given print "Hello world!!"
    When print 'Hello Karate'
    Then print 2+2

  Scenario: More Printing
    Given print "some words to print"
    * print "my name is" + ' karate kid'
    * print "my name is" , 'karate kid'

  Scenario: variables
    * def name = 'Ahmet'
    * print "my name is", name
    * def age = 20
    * print name,'is',age,"years old."
@wip
  Scenario: Different objects (json object)
    * def student = {"name":"Onur","lastName":"Arikan","owes_tuition":false}
    * print student
    * print student.name
    * print student.lastName
    * print student.owes_tuition

    Scenario: json object - 2
      * def SDET =
      """
      {
      "firstName":"Lale",
      "lastName":"Ortaca",
      "salary":50000
      }
      """
      * print SDET
      * print SDET.firstName
      * print SDET.lastName
      * print SDET.salary

  Scenario: json object - 3
    * def SDETs =
      """
      [
      {
      "firstName":"Lale",
      "lastName":"Ortaca",
      "salary":50000
      },
       {
      "firstName":"Mehmet",
      "lastName":"Kaya",
      "salary":40000
      },
       {
      "firstName":"Selim",
      "lastName":"Gezer",
      "salary":60000
      }
      ]
      """
    * print SDETs
    * print SDETs[0].firstName
    * print SDETs[1].lastName
    * print SDETs[2].salary

  Scenario: json object - 4
    * def students = [{"name":"Onur","lastName":"Arikan","owes_tuition":false},{"name":"Sevgi","lastName":"Sevencan","owes_tuition":true}]
    * print students
    * print students[0].name
    * print students[1].lastName
    * print students[1].owes_tuition
