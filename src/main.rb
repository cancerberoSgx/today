# typed: strict

# responsible of interpret the cmds, and render Today to stdout

require_relative "parse_args"
require_relative "today"
require_relative "todo"
 
def main
  cmd = parseArgs(ARGV)
  if cmd[:cmd] == 'list_todos'
    list_todos    
  elsif cmd[:cmd] == 'add_todo'
    add_todo cmd[:title] || 'Unammed task'
  else
    print 'Error'
  end
end

def list_todos
  today = Today.new
  printString today.todos.print 
end

# TODO: hack because \n chars are not printed with puts or print:
def printString(s)
  s.split('\n').map {|s| puts s || ''}
end

def add_todo(title)
  today = Today.new
  today.todos.add Todo.new title
  printString today.todos.print
  today.save
end