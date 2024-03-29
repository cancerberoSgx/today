# responsible of interpret the cmds, and render Today to stdout

require_relative 'parse_args'
require_relative 'today'
require_relative 'todo'
require_relative 'util'
require_relative 'calendar'
require_relative 'month'
require_relative 'renderer'
 
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
  elsif cmd[:cmd] == 'help'
    help
  elsif cmd[:cmd] == 'month'
    month
  elsif cmd[:cmd] == 'year'
    month true
  elsif cmd[:cmd] == 'calendar'
    calendar
  elsif cmd[:cmd] == 'renderer'
    renderer cmd[:id]
  else
    print 'Error'
  end
end

def list_todos
  today = Today.new
  print_string today.todos.print 
end

def renderer(id)
  today = Today.new
  today.renderer=renderer_named id
  today.todos.renderer=today.renderer
  print_string today.todos.print
  today.save
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

def help
  print "
today: manage personal TODO lists and check google calendar with the command line

Usage examples: 

  today               # list todos
  today add
  today add 'task 1'
  today check
  today check 0
  today calendar
  today month
  today year
  today reset
  today renderer cool
  today help
"
end

def calendar
  today = Today.new
  calendar = Calendar.new
  print_string today.todos.renderer.render_events calendar.next_events
end

def month(year=false)
  print_string Month.render year
end