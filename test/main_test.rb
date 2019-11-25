# typed: true
require "test/unit"
include Test::Unit::Assertions
require_relative '../src/today'
require_relative '../src/todo'
require 'fileutils'

class MainTest < Test::Unit::TestCase
  def test_init
    Today.initialize
    assert_equal `ruby exe/today`.strip, 'No tasks'
    assert_match /No\stasks/, `ruby exe/today`
    
    assert_match /task\s1/, `ruby exe/today add "task 1"`
  end
end
 