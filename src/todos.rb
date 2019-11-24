# List of todos
class Todos
  def initialize
    @list = []
  end

  # @param [Todo] todo
  def add(todo)
    1
  end
end

# TODO representation
class Todo
  def initialize
    @title = 'Unnamed TODO'
    @description = 'TODO'
  end
end

# require 'json'
# puts JSON.parse('{"a": 123w}')
#
# my_hash = {:hello => "goodbye"}
# puts JSON.generate(my_hash) => "{\"hello\":\"goodbye\"}"
#
