require 'erb'

# default Todo renderer (command line strings)
# subclass it to customize checkboxes, labels, etc
class DefaultRenderer
  def todo(todo)
    " #{todo_checked(todo)} #{todo_title(todo)}"
  end
  def todo_checked(todo)
    "#{todo.checked ? '[x]' : '[ ]'}"
  end
  def todo_title(todo)
    "#{todo.title}"
  end
  # render a list of todos
  def render_todos(todos)
    todos.map {|todo| todo(todo)}
  end
  # no-tasks message
  def todo_empty
    'No tasks'
  end
  def id
    'default'
  end
  def render_events(items)
    today = Today.new
    if items.empty?
      'No events for today'
    else
      sep = '\n * '
      "Today's events:#{sep}#{(items.map {|event| "#{event.summary} (#{event.start.date || event.start.date_time})"}).join(sep)}"
    end
  end
end
