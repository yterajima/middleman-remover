Feature: Middleman-Remover

  Scenario: Remover dosen't delete file
    Given a fixture app "basic-app"
    And a file named "source/empty" with:
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
    Then a file named "empty" should exist

  Scenario: Remove file
    Given a fixture app "basic-app"
    And a file named "source/empty" with:
      """
      """
    And a file named "config.rb" with:
      """
      configure :build do
        activate :remover, :target => %w(empty)
      end
      """
    And a successfully built app at "basic-app"
    When I cd to "build"
    Then a file named "empty" should not exist

