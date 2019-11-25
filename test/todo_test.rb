# typed: true
require 'test/unit/assertions'
include Test::Unit::Assertions
require_relative './today_test'

class TodoTest < Test::Unit::TestCase
  def test_add
    todos = TodayTest.empty.todos
    assert_instance_of Todos, todos
    assert_empty todos.todos
  end
end
