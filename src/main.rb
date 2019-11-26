# typed: strict

# responsible of interpret the cmds, and render Today to stdout

require_relative 'parse_args'
require_relative 'today'
require_relative 'todo'
require_relative 'util'
 
def main
  cmd = parseArgs(ARGV)
  if cmd[:cmd] == 'list_todos'
    list_todos    
  elsif cmd[:cmd] == 'add_todo'
    add_todo cmd[:title] || 'Unammed task'
  elsif cmd[:cmd] == 'check_todo'
    check_todo cmd[:index] || 0  
  elsif cmd[:cmd] == 'reset'
    reset
  else
    print 'Error'
  end
end

def list_todos
  today = Today.new
  print_string today.todos.print 
end

def add_todo(title)
  today = Today.new
  today.todos.add Todo.new title
  print_string today.todos.print
  today.save
end
def reset
  Today.reset
  today = Today.new
  print_string today.todos.print
end
def check_todo(index)
  today = Today.new
  # TODO: check out of range / print error
  todo = today.todos.todos[index]
  todo.checked = !todo.checked
  print_string today.todos.print
  today.save
end