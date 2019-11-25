# typed: ignore

require 'fileutils'
require_relative 'util'
require_relative 'todo'

# TODO
class Today

  def initialize
    Today.initialize
    s = File.open(Today.file, 'r').read
    @data = JSONParse(s)
  end

  def data
    @data
  end

  def todos
    Todos.new @data['todos'].map {|todo| Todo.new todo.title, todo.description}
  end

  def self.initialize
    FileUtils.mkdir_p folder unless File.directory?(folder)
    s = JSONStringify(initial_state)
    File.open(file, 'w') { |f| f.puts(s) } unless File.exist? file
  end

  def self.initial_state
    {
      session: 'default',
      todos: []
    }
  end

  def self.folder
    File.join ENV['HOME'], '.today'
  end

  def self.file
    File.join folder, "#{today_id}.json"
  end

  def self.today_id
    Time.now.strftime('%Y-%m-%d')
  end
end
