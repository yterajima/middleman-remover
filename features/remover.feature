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

  Scenario: Removed Message
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

  Scenario: File not exist Message
    Given a fixture app "basic-app"
    And a file named "config.rb" with:
      """
      configure :build do
        activate :remover, :target => %w(empty)
      end
      """
    And a successfully built app at "basic-app"
    When I cd to "build"
    Then a file named "empty" should not exist
    And the output should contain "middleman-remover:"
    And the output should contain "is not exist"

  Scenario: Directory not exist Message
    Given a fixture app "basic-app"
    And a file named "config.rb" with:
      """
      configure :build do
        activate :remover, :target => %w(empty_dir)
      end
      """
    And a successfully built app at "basic-app"
    When I cd to "build"
    Then a file named "empty" should not exist
    And the output should contain "middleman-remover:"
    And the output should contain "is not exist"

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

  Scenario: Remove file with WILDCARD
    Given a fixture app "basic-app"
    And a file named "config.rb" with:
      """
      configure :build do
        activate :remover, :target => %w(empty_dir/*)
      end
      """
    And a directory named "source/empty_dir"
    And a file named "source/empty_dir/empty" with:
      """
      """
    And a file named "source/empty_dir/something.html" with:
      """
      <html><head><title>something</title></head><body></body></html>
      """
    And a successfully built app at "basic-app"
    When I cd to "build"
    Then a directory named "empty_dir" should exist
    And a file named "empty_dir/empty" should not exist
    And a file named "empty_dir/something.html" should not exist

  Scenario: Remove file with WILDCARD and extension
    Given a fixture app "basic-app"
    And a file named "config.rb" with:
      """
      configure :build do
        activate :remover, :target => %w(empty_dir/*.html)
      end
      """
    And a directory named "source/empty_dir"
    And a file named "source/empty_dir/empty" with:
      """
      """
    And a file named "source/empty_dir/something.html" with:
      """
      <html><head><title>something</title></head><body></body></html>
      """
    And a successfully built app at "basic-app"
    When I cd to "build"
    Then a directory named "empty_dir" should exist
    And a file named "empty_dir/empty" should exist
    And a file named "empty_dir/something.html" should not exist

