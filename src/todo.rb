# typed: ignore

# List of todos
class Todos
  attr_reader :todos
  def initialize todos
    @todos = todos
  end
  def add(todo)
    @todos.push(todo)
  end
  def check(index)
    @todos[index].checked = true
  end
  def serialize
    @todos.map {|todo| todo.serialize}
  end
  # sig {params(todo: Todo).returns(nil?)}
  # @todos = []
  # def todos
  #   @todos.map {|todo| {title: todo.title}}
  # end
end

# to-do representation
class Todo
  attr_reader :title, :description, :checked
  def initialize(title='Untitled', description='TODO', checked= false)
    @title = title
    @description = description
    @checked = checked
  end
  def serialize
    {title: @title, description: @description, checked: @checked}
  end
end

# require 'json'
# puts JSON.parse('{"a": 123w}')
#
# my_hash = {:hello => "goodbye"}
# puts JSON.generate(my_hash) => "{\"hello\":\"goodbye\"}"
#
