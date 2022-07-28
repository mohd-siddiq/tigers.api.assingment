Feature: Review Project

@Smoke
  Scenario: 
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token"
    And request { "username": "supervisor",  "password": "tek_supervisor"}
    When method post
    Then status 200
    * def generatedToken = response.token
    And print generatedToken
    * def generator = Java.type( 'tigers.api.review.data.DataGenerator' )
    * def email = generator.getEmail( )
    * def firstName = generator.getFirstName( )
    * def lastName = generator.getLastName( )
    Given path "/api/accounts/add-primary-account"
    And request
      """
           {
           "email": "#(email)",
           "firstName": "#(firstName)",
           "lastName": "#(lastName)",
           "title": "Mr.",
           "gender": "MALE",
           "maritalStatus": "MARRIED",
           "employmentStatus": "student",
           "dateOfBirth": "1982-07-21",
           "new": true
           }
      """
    And header Authorization = "Bearer " + generatedToken
    When method post
    Then status 201
    * def primaryPersonId = response.id
    And print response
    * def generator = Java.type( 'tigers.api.review.data.DataGenerator' )
    * def addressType = generator.getAddressType( )
    * def streetAddress = generator.getStreetAddress( )
    * def city = generator.getCity( )
    * def state = generator.getState( )
    * def postalCode = generator.getPostalCode( )
    * def countryCode = generator.getCountryCode( )
    Given path "/api/accounts/add-account-address"
    And param primaryPersonId  = primaryPersonId
    And request
      """
      {
      "addressType": "#(addressType)",
      "streetAddress": "#(streetAddress)",
      "city": "#(city)",
      "state": "#(state)",
      "postalCode": "#(postalCode)",
      "countryCode": "#(countryCode)",
      "current": true
      }
      """
    And header Authorization = "Bearer " + generatedToken
    When method post
    Then status 201
    And print response
    * def generator = Java.type( 'tigers.api.review.data.DataGenerator' )
    * def phoneNumber = generator.getPhoneNumber( )
    * def phoneExtension = generator.getPhoneExtension( )
    * def phoneTime = generator.getPhoneTime( )
    * def phoneType = generator.getPhoneType( )
    Given path "/api/accounts/add-account-phone"
    Given param primaryPersonId  = primaryPersonId
    And request
      """
      {
      "phoneNumber": "#(phoneNumber)",
      "phoneExtension": "#(phoneExtension)",
      "phoneTime": "#(phoneTime)",
      "phoneType": "#(phoneType)"
      }
      """
    And header Authorization = "Bearer " + generatedToken
    When method post
    Then status 201
    And print response
    * def generator = Java.type( 'tigers.api.review.data.DataGenerator' )
    * def make = generator.getMake( )
    * def model = generator.getModel( )
    * def year = generator.getYear( )
    * def licensePlate = generator.getLicensePlate( )
    Given path "/api/accounts/add-account-car"
    And param primaryPersonId  = primaryPersonId
    And request
      """
      {
      "make": "#(make)",
      "model": "#(model)",
      "year": "#(year)",
      "licensePlate": "#(licensePlate)"
      }
      """
    And header Authorization = "Bearer " + generatedToken
    When method post
    Then status 201
    And print response
