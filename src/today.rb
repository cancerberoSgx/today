require 'fileutils'
# require './util'
require_relative './util'

# TODO
class Today

  def initialize
    Today.initialize
    s = File.open(today_file, 'r').read
    @data = JSONParse(s)
  end

  def self.initialize
    folder = today_folder
    FileUtils.mkdir_p folder unless File.directory?(folder)
    today = today_file
    s = JSONStringify(today_initial_state)
    File.open(today, 'w') { |f| f.puts(s) } unless File.exist? today
  end

  def self.today_initial_state
    {
      session: 'default',
      todos: []
    }
  end

  # @return [String]
  def self.today_folder
    File.join ENV['HOME'], '.today'
  end

  # @return [String]
  def self.today_file
    File.join today_folder, "#{today_id}.json"
  end

  def self.today_id
    Time.now.strftime('%Y-%m-%d')
  end
end
