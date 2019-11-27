require_relative 'renderer'
require 'erb'
require 'ansi/code'

class CoolRenderer < DefaultRenderer
  def render_todos(todos)
    template = %q{
<% todos.each {|t| %>
 <%= t.checked ? "#{ANSI.green{'✔'}}" : "#{ANSI.red{'✖'}}" %> <%= t.title %>  <% } %>
}
    message = ERB.new(template)
    [" #{message.result(binding).strip}"]
  end  
  def id
    'cool'
  end
end
