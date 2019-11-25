# typed: ignore

# List of todos
class Todos
  # @todos = []
  # def todos
  #   @todos.map {|todo| {title: todo.title}}
  # end
  attr_reader :todos
  def initialize todos
    @todos = todos
  end
  # sig {params(todo: Todo).returns(nil?)}
  def add(todo)
    @todos.push(todo)
  end
end

# to-do representation
class Todo
  attr_reader :title, :description
  def initialize(title='Untitled', description='TODO')
    @title = title
    @description = description
  end
end

# require 'json'
# puts JSON.parse('{"a": 123w}')
#
# my_hash = {:hello => "goodbye"}
# puts JSON.generate(my_hash) => "{\"hello\":\"goodbye\"}"
#
