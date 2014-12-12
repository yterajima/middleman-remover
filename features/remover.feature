Feature: Middleman-Remover

  Scenario: Remover dosen't delete file
    Given a fixture app "basic-app"
    And a file named "config.rb" with:
      """
      configure :build do
        activate :remover
      end
      """
    And a file named "source/empty" with:
      """
      """
    And a successfully built app at "basic-app"
    When I cd to "build"
    Then a file named "empty" should exist
    And the output should not contain "middleman-remover:"

  Scenario: Remove file
    Given a fixture app "basic-app"
    And a file named "config.rb" with:
      """
      configure :build do
        activate :remover, :target => %w(empty)
      end
      """
    And a file named "source/empty" with:
      """
      """
    And a successfully built app at "basic-app"
    When I cd to "build"
    Then a file named "empty" should not exist
    And the output should contain "middleman-remover:"
    And the output should contain "is removed"

  Scenario: Remove Directory
    Given a fixture app "basic-app"
    And a file named "config.rb" with:
      """
      configure :build do
        activate :remover, :target => %w(empty_dir)
      end
      """
    And a directory named "source/empty_dir"
    And a file named "source/empty_dir/empty" with:
      """
      """
    And a successfully built app at "basic-app"
    When I cd to "build"
    Then a directory named "empty_dir" should not exist
    And a file named "empty_dir/empty" should not exist
    And the output should contain "middleman-remover:"
    And the output should contain "is removed"

