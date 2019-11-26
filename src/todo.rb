# typed: ignore

require_relative 'todo_renderer'

# List of todos. delegates rendering to @renderer (TodoRenderer)
class Todos
  attr_reader :todos
  attr_writer :renderer
  def initialize todos
    @todos = todos
    @renderer = TodoRenderer.new
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
      @renderer.empty
    else
      todos = @renderer.list(@todos)
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
  # def print
  #   "#{@checked ? '[x]' : '[ ]'} #{@title}"
  # end
end

# # default Todo renderer (command line strings). subclass it to customize checkboxes, labels, etc
# class TodoRenderer
#   def render(todo)
#     " #{checked(todo)} #{title(todo)}"
#   end
#   def checked(todo)
#     "#{todo.checked ? '[x]' : '[ ]'}"
#   end
#   def title(todo)
#     "#{todo.title}"
#   end
#   # render a list of todos
#   def list(todos)
#     todos.map {|todo| render(todo)}
#   end
#   # no-tasks message
#   def empty
#     'No tasks'
#   end
# end


# # require 'json'
# # puts JSON.parse('{"a": 123w}')
# #
# # my_hash = {:hello => "goodbye"}
# # puts JSON.generate(my_hash) => "{\"hello\":\"goodbye\"}"
# #
