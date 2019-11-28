require 'fileutils'
require_relative 'util'
require_relative 'todo'
require_relative 'renderer'

# responsible of data store in file system
class Today
  attr_accessor :todos, :session, :renderer
  def initialize(session=Today.initial_state['session'])
    Today.initialize
    s = File.open(Today.file, 'r').read
    data = JSONParse(s)
    @renderer = renderer_named data['renderer']
    @todos = Todos.new data['todos'].map {|todo| Todo.new todo['title'], todo['description'], todo['checked']}
    @todos.renderer=@renderer
    @session = data['session']
  end
  def serialize
    {
      session: @session,
      todos: @todos.serialize,
      renderer: @renderer.id
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
      todos: [],
      renderer: 'default'
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
    today = Today.new
    today.todos.renderer = DefaultRenderer.new
    today
  end
end
