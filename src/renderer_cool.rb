require_relative 'renderer'
require 'erb'

class CoolRenderer < DefaultRenderer
  def render_todos(todos)
    template = %q{
      % todos.each do |todo|
      <%= todo[:checked] ? '✓' : 'x' %> <%= todo[:title] %>
      % end
    }.gsub(/^  /, '')
    message = ERB.new(template, trim_mode: "%<>")
    message.result.chomp
  end  
  def id
    'cool'
  end
end
