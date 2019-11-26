# typed: true
require 'test/unit'
include Test::Unit::Assertions

class TodoTest < Test::Unit::TestCase
  def test_add
    todos = Today.resetAndCreate.todos
    assert_instance_of Todos, todos
    assert_empty todos.todos
    todo = Todo.new 'test1', 'test1 description'
    assert_equal todo.title, 'test1'
    assert_equal todo.description, 'test1 description'
    todos.add(todo)
    assert_not_empty todos.todos
    assert_equal todos.todos[0], todo
  end
  # tests againts the default TodoRenderer
  def test_renderer
    todos = Today.resetAndCreate.todos
    assert_include(todos.print, 'No tasks')
    todos.add(Todo.new 'test_renderer1', 'test_renderer1 description')
    assert_include(todos.print, '[ ] test_renderer1')
    todos.add(Todo.new 'test_renderer2', 'test_renderer2 description')
    assert_include(todos.print, '[ ] test_renderer2')
  end
end
