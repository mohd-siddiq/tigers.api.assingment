Feature: Authentication Smoke Test
@Smoke
  Scenario: Generate token with username and password
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token"
    And request
      """
      {
        "username": "supervisor",
        "password": "tek_supervisor"
      }
      """
    When method post
    Then status 200
    And print response
@Smoke
  Scenario: Generate token with invalid username and valid password
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token"
    And request
      """
      {
        "username": "suppervisor",
        "password": "tek_supervisor"
      }
      """
    When method post
    Then status 404
    And print response
    * def errorMessage = response.errorMessage
    And assert errorMessage == "USER_NOT_FOUND"