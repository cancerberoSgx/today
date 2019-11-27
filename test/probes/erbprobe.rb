# require 'erb'
# Book     = Struct.new(:title, :author)
# template = ERB.new(File.read('template.erb'))
# template.result_with_hash(books: [Book.new("test"), Book.new("abc")])

require 'erb'

todos=[
  {title: 'first', checked: false},
  {title: 'second', checked: true}
]
template = %q{
  % todos.each do |todo|
   <%= todo[:checked] ? '✓' : 'x' %> <%= todo[:title] %>
  % end
}.gsub(/^  /, '')

message = ERB.new(template, trim_mode: "%<>")

puts message.result.chomp