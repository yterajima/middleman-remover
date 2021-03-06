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
        activate :remover, :paths => %w(empty)
      end
      """
    And a file named "source/empty" with:
      """
      """
    And a successfully built app at "basic-app"
    When I cd to "build"
    Then a file named "empty" should not exist
    And the output should contain "== middleman-remover:"
    And the output should contain "is removed =="

  Scenario: Removed Message using block
    Given a fixture app "basic-app"
    And a file named "config.rb" with:
      """
      configure :build do
        activate :remover do |r|
          r.paths = %w(empty)
        end
      end
      """
    And a file named "source/empty" with:
      """
      """
    And a successfully built app at "basic-app"
    When I cd to "build"
    Then a file named "empty" should not exist
    And the output should contain "== middleman-remover:"
    And the output should contain "is removed =="

  Scenario: File not exist Message
    Given a fixture app "basic-app"
    And a file named "config.rb" with:
      """
      configure :build do
        activate :remover, :paths => %w(empty)
      end
      """
    And a successfully built app at "basic-app"
    When I cd to "build"
    Then the output should contain "== middleman-remover:"
    And the output should contain "is not exist =="

  Scenario: Directory not exist Message
    Given a fixture app "basic-app"
    And a file named "config.rb" with:
      """
      configure :build do
        activate :remover, :paths => %w(dir)
      end
      """
    And a successfully built app at "basic-app"
    When I cd to "build"
    Then the output should contain "== middleman-remover:"
    And the output should contain "is not exist =="

  Scenario: Remove file
    Given a fixture app "basic-app"
    And a file named "config.rb" with:
      """
      configure :build do
        activate :remover, :paths => %w(empty)
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
        activate :remover, :paths => %w(dir)
      end
      """
    And a directory named "source/dir"
    And a file named "source/dir/empty" with:
      """
      """
    And a successfully built app at "basic-app"
    When I cd to "build"
    Then a directory named "dir" should not exist

  @v3
  Scenario: Remove file with WILDCARD
    Given a fixture app "basic-app"
    And a file named "config.rb" with:
      """
      configure :build do
        activate :remover, :paths => %w(dir/*)
      end
      """
    And a directory named "source/dir"
    And a file named "source/dir/empty" with:
      """
      """
    And a file named "source/dir/something.html" with:
      """
      <html><head><title>something</title></head><body></body></html>
      """
    And a successfully built app at "basic-app"
    When I cd to "build"
    Then a directory named "dir" should exist
    And a file named "dir/empty" should not exist
    And a file named "dir/something.html" should not exist

  @v4
  Scenario: Remove file with WILDCARD
    Given a fixture app "basic-app"
    And a file named "config.rb" with:
      """
      configure :build do
        activate :remover, :paths => %w(dir/*)
      end
      """
    And a directory named "source/dir"
    And a file named "source/dir/empty" with:
      """
      """
    And a file named "source/dir/something.html" with:
      """
      <html><head><title>something</title></head><body></body></html>
      """
    And a successfully built app at "basic-app"
    When I cd to "build"
    Then a directory named "dir" should not exist
    And a file named "dir/empty" should not exist
    And a file named "dir/something.html" should not exist

  Scenario: Remove file with WILDCARD and extension
    Given a fixture app "basic-app"
    And a file named "config.rb" with:
      """
      configure :build do
        activate :remover, :paths => %w(dir/*.html)
      end
      """
    And a directory named "source/dir"
    And a file named "source/dir/empty" with:
      """
      """
    And a file named "source/dir/something.html" with:
      """
      <html><head><title>something</title></head><body></body></html>
      """
    And a successfully built app at "basic-app"
    When I cd to "build"
    Then a directory named "dir" should exist
    And a file named "dir/empty" should exist
    And a file named "dir/something.html" should not exist

  @v3
  Scenario: Remove Some files/Directories
    Given a fixture app "basic-app"
    And a file named "config.rb" with:
      """
      configure :build do
        activate :remover, :paths => %w(dir1/*.html dir2/*.dat /dir3)
      end
      """
    And a directory named "source/dir1"
    And a directory named "source/dir2"
    And a directory named "source/dir3"
    And a file named "source/dir1/empty" with:
      """
      """
    And a file named "source/dir1/something.html" with:
      """
      <html><head><title>something</title></head><body></body></html>
      """
    And a file named "source/dir2/sample.dat" with:
      """
      sample
      """
    And a file named "source/dir3/empty" with:
      """
      """
    And a successfully built app at "basic-app"
    When I cd to "build"
    Then a directory named "dir1" should exist
    And a directory named "dir2" should exist
    And a directory named "dir3" should not exist
    And a file named "dir1/empty" should exist
    And a file named "dir1/something.html" should not exist
    And a file named "dir2/sample.dat" should not exist

  @v4
  Scenario: Remove Some files/Directories
    Given a fixture app "basic-app"
    And a file named "config.rb" with:
      """
      configure :build do
        activate :remover, :paths => %w(dir1/*.html dir2/*.dat /dir3)
      end
      """
    And a directory named "source/dir1"
    And a directory named "source/dir2"
    And a directory named "source/dir3"
    And a file named "source/dir1/empty" with:
      """
      """
    And a file named "source/dir1/something.html" with:
      """
      <html><head><title>something</title></head><body></body></html>
      """
    And a file named "source/dir2/sample.dat" with:
      """
      sample
      """
    And a file named "source/dir3/empty" with:
      """
      """
    And a successfully built app at "basic-app"
    When I cd to "build"
    Then a directory named "dir1" should exist
    And a directory named "dir2" should not exist
    And a directory named "dir3" should not exist
    And a file named "dir1/empty" should exist
    And a file named "dir1/something.html" should not exist
    And a file named "dir2/sample.dat" should not exist

