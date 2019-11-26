# default Todo renderer (command line strings)
# subclass it to customize checkboxes, labels, etc
class DefaultRenderer
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
  def id
    'default'
  end
end

def register_renderer(renderer)
  @renderers.push(renderer)
end
def renderer
  @instance 
end

def install_renderer(id)
  found = @renderers.find {|r|r.id==id}
  if found
    @instance = found
  else
    throw "#{id} renderer not found"
  end
end

@renderers = []
@instance=DefaultRenderer.new
def init_renderers
  # init
  register_renderer(@instance)
  register_renderer(@instance)
end
init_renderers
# @instance=nil
# @instance=renderer