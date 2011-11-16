# SlowTestFinder - finding the source of pain in your test suite

SlowTestFinder is a library that logs the time each test took to run, and outputs the
top 25 (or all tests if you have <25) in orderof most pain.  It was designed to help
ease the pain of slow Test::Unit suites in legacy projects.

This library is still in early development, and currently only works for Rails 3.0.x
but this is going to change very quickly.

## Installation

First, install with `gem install slow_test_finder` or add it to your Gemfile.

Then, add `require 'slow_test_finder'` to your test_helper.rb

## Usage

add the `SLOW_TESTS=true` env flag when running your test suite.


## TODO

 * Remove coupling with ActiveSupport::TestCase
 * Add rake task that ignores the results of the tests and only outputs the slow tests
 * Tests (Yes, I know the humor in a test library with no tests)

