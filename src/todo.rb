# require_relative 'renderer_default'
# require_relative 'renderer_cool'
require_relative 'renderer'

# List of todos. delegates rendering to @renderer (DefaultRenderer)
class Todos
  attr_accessor :todos, :renderer
  def initialize(todos, id='default')
    @todos = todos
    @renderer = DefaultRenderer.new
    # @renderer = renderer_named id
  end
  def add(todo)
    @todos.push(todo)
  end
  def check(index, checked=true)
    @todos[index].checked = checked
  end
  def serialize
    @todos.map {|todo| todo.serialize}
  end
  def print
    if @todos.empty?
      @renderer.todo_empty
    else
      todos = @renderer.render_todos(@todos)
      todos.join '\n'
    end 
  end
end

# to-do representation
class Todo
  attr_accessor :title, :description, :checked
  def initialize(title='Untitled', description='TODO', checked= false)
    @title = title
    @description = description
    @checked = checked
  end
  def serialize
    { title: @title, description: @description, checked: @checked }
  end
end
