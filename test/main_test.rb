require "test/unit"
include Test::Unit::Assertions
require_relative '../src/today'
require_relative '../src/todo'
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
    assert_include `ruby exe/today add first`, '[ ] first', 'should add'
    assert_include `ruby exe/today check 0`, '[x] first', 'should check'
    assert_include `ruby exe/today check 0`, '[ ] first', 'should uncheck'
  end
  def test_reset
    Today.resetAndCreate
    assert_include `ruby exe/today`, 'No tasks', 'should print no-tasks message'
    assert_include `ruby exe/today add first`, '[ ] first', 'should add'
    assert_include `ruby exe/today reset`, 'No tasks', 'should reset'
  end   
  def test_help
    Today.resetAndCreate
    assert_include `ruby exe/today help`, 'Usage', 'should print help message and exit'
  end 
  def test_renderer
    Today.resetAndCreate
    assert_include `ruby exe/today add first`, '[ ] first', 'should print default by default'
    assert_include `ruby exe/today renderer cool`, " \e[31m✖\e[0m first", 'should print cool'
    assert_include `ruby exe/today add second`, " \e[31m✖\e[0m second", 'should print cool next time'
  end 
end
 