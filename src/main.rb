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
  # TODO: hack because \n chars are not printed with puts or print:
  today.todos.print.split('\n').map {|s| puts s}
end

def add_todo(title)
  today = Today.new
  today.todos.add Todo.new title
  puts today.todos.print
  today.save
end