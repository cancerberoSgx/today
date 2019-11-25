require 'fileutils'
# require './util'
require_relative './util'

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

  # @return [String]
  def self.folder
    File.join ENV['HOME'], '.today'
  end

  # @return [String]
  def self.file
    File.join folder, "#{today_id}.json"
  end

  def self.today_id
    Time.now.strftime('%Y-%m-%d')
  end
end
