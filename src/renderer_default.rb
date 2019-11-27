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
    if response.items.empty?
      'No events for today'
    else
      sep = '\n * '
      "Today's events:#{sep}#{(items.map {|event|event.summary}).join(sep)}"
    end
    # template = %q{
    #   Upcoming events:
    #   <%= items.empty? ? 'No upcoming events found' : ''%>
    #   % items.each do |event|
    #   <%= "- #{event.summary} (#{event.start.date || event.start.date_time})" %>
    #   % end
    # }.gsub(/^  /, '')
    # message = ERB.new(template, trim_mode: "%<>")
    # message.result.chomp

    # template = %q{
    #   % items.each do |todo|
    #   <%= todo.summary %>
    #   % end
    # }.gsub(/^  /, '')
    # message = ERB.new(template, trim_mode: "%<>")
    # message.result.chomp

    # calendar = Calendar.new
    # print_string today.todos.renderer.render_events calendar.next_events
    # events = [{summary: 'hello'}] 
    # s
    # s = today.todos.renderer.render_events 


        # puts "Upcoming events:"
    # puts "No upcoming events found" if response.items.empty?
    # response.items.each do |event|
    #   start = event.start.date || event.start.date_time
    #   puts "- #{event.summary} (#{start})"
  end
end
