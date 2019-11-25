# typed: strict
require_relative "parse_args"
require_relative "today"
require_relative "todo"

def main
  cmd = parseArgs(ARGV)
  if cmd[:cmd] == 'list_todos'
    list_todos    
  elsif cmd[:cmd] == 'add_todo'
    add_todo cmd[:title]
  else
    print 'Error'
  end
end

def list_todos
  today = Today.new
  puts today.todos.print
end
\
def add_todo(title)
  today = Today.new
  today.todos.add Todo.new title
  puts today.todos.print
end