# typed: true
# default Todo renderer (command line strings)
# subclass it to customize checkboxes, labels, etc
class TodoRenderer
  def render(todo)
    " #{checked(todo)} #{title(todo)}"
  end
  def checked(todo)
    "#{todo.checked ? '[x]' : '[ ]'}"
  end
  def title(todo)
    "#{todo.title}"
  end
  # render a list of todos
  def list(todos)
    todos.map {|todo| render(todo)}
  end
  # no-tasks message
  def empty
    'No tasks'
  end
end

