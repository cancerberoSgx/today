# typed: true
require "test/unit"
include Test::Unit::Assertions
require_relative '../src/today'
require_relative '../src/todo'
require_relative 'today_test'
require 'fileutils'

class MainTest < Test::Unit::TestCase
  def test_todo_add
    Today.resetAndCreate
    assert_match /No\stasks/, `ruby exe/today`, 'should show no-tasks msg first time'
    assert_match /No\stasks/, `ruby exe/today`, 'should show no-tasks msg second time'
    assert_match /task\s1/, `ruby exe/today add "task 1"`, 'should show added task'
    assert_not_match /No\stasks/, `ruby exe/today`, 'should hide no-tasks msg'
    assert_match /task\s1/, `ruby exe/today`, 'should show added task'
    assert_match /task\s2/, `ruby exe/today add "task 2"`, 'should show added task'
    assert_match /task\s1/, `ruby exe/today`, 'should list'
    assert_match /task\s2/, `ruby exe/today`, 'should list'
  end  
  def test_todo_error
    Today.resetAndCreate
    assert_match /Error/, `ruby exe/today notrecognized`, 'should show error msg'
  end  
  def test_todo_check
    Today.resetAndCreate
    assert_include  `ruby exe/today add first`, '[ ] first', 'should add'
    assert_include `ruby exe/today check 0`, '[x] first', 'should check'
    assert_include `ruby exe/today check 0`, '[ ] first', 'should uncheck'
  end  
  def test_reset
    Today.resetAndCreate
    assert_include  `ruby exe/today`, 'No tasks', 'No tasks'
    assert_include  `ruby exe/today add first`, '[ ] first', 'should add'
    assert_include  `ruby exe/today reset`, 'No tasks', 'should reset'
  end 
end
 