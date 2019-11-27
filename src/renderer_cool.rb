require_relative 'renderer'
require 'erb'
require 'ansi/code'

class CoolRenderer < DefaultRenderer
  def render_todos(todos)
    template = %q{
<% todos.each {|t| %>
 <%= t.checked ? "#{ANSI.green{'✓'}}" : "#{ANSI.red{'x'}}" %> <%= t.title %>  <% } %>
}
    message = ERB.new(template)
    [" #{message.result(binding).strip}"]
    # template = %q{
    #   % todos.each do |tt|
    #   <%= tt[:checked] ? '✓' : 'x' %> <%= tt[:title] %>
    #   % end
    # }.gsub(/^  /, '')
#     x = 42
# template = ERB.new <<-EOF
#   The value of x is: <%= x %>
#   bye
# EOF
# [template.result(binding)]
  # print template
  # <%= todo[:checked] ? '✓' : 'x' %> <%= todo[:title] %>
# print binding.inspect
# message = ERB.new(template)
# message.
    # print message.result(binding) 
    # []
  end  
  def id
    'cool'
  end
end
