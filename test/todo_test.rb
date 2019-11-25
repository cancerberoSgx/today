# typed: true
require 'test/unit'
# require 'test/unit/assertions'
include Test::Unit::Assertions
require_relative 'today_test'

class TodoTest < Test::Unit::TestCase
  def test_add
    todos = TodayTest.empty.todos
    assert_instance_of Todos, todos
    assert_empty todos.todos
    todo = Todo.new 'test1', 'test1 description'
    assert_equal todo.title, 'test1'
    assert_equal todo.description, 'test1 description'
    todos.add(todo)
    assert_not_empty todos.todos
    assert_equal todos.todos[0], todo
  end
end
