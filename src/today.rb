require 'fileutils'
require_relative 'util'
require_relative 'todo'

# responsible of data store in file system
class Today
  attr_reader :todos, :session
  def initialize(session=Today.initial_state['session'])
    Today.initialize
    s = File.open(Today.file, 'r').read
    data = JSONParse(s)
    @todos = Todos.new data['todos'].map {|todo| Todo.new todo['title'], todo['description'], todo['checked']}
    @session = data['session']
  end
  def serialize
    {
      session: @session,
      todos: @todos.serialize
    }
  end
  def save
    File.open(Today.file, 'w') { |f| f.puts JSONStringify(serialize) } 
  end
  def self.initialize(session='default')
    FileUtils.mkdir_p folder unless File.directory?(folder)
    File.open(file, 'w') { |f| f.puts JSONStringify(initial_state session) } unless File.exist? file
  end
  def self.initial_state(session='default')
    {
      session: session,
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
  def self.reset
    FileUtils.rm_rf Today.folder
  end
  def self.resetAndCreate
    reset
    Today.new
  end
end
