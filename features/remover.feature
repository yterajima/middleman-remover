Feature: Middleman-Remover

  Scenario: Remover dosn't delete file
    Given a fixture app "basic-app"
    And a file named ".DS_Store" with:
      """
      """
    And a file named "config.rb" with:
      """
      configure :build do
        activate :remover
      end
      """
    And a successfully built app at "basic-app"
    When I cd to "build"
    Then a file named ".DS_Store" should exist
