Feature: Karate UI Test

  Scenario: Login test
    * configure driver = {type:'chromedriver', executable:'C:\\Users\\ihsan\\Downloads\\chromedriver-win64\\chromedriver.exe'}
    Given driver "https://www.krafttechexlab.com/login"
    * maximize()
    * input("#email","mgezer@gmail.com")
    * input("#yourPassword","Mg12345678")
    * click("//button[@type='submit']")
    Then waitForUrl("https://www.krafttechexlab.com/index")
    Then match driver.url == "https://www.krafttechexlab.com/index"
    * delay(2000)



