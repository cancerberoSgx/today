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
end
