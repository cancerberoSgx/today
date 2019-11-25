require "test/unit"
require_relative '../src/today'

include Test::Unit::Assertions
require 'fileutils'

class HelloTest < Test::Unit::TestCase
  def test_folder
    assert_true Today.folder.end_with? '/.today'
  end

  def test_file
    assert_true Today.file.include? '/.today/'
  end

  def test_self_initialize
    FileUtils.rm_rf Today.folder if File.exists? Today.folder
    assert_false File.exists? Today.folder
    Today.initialize
    assert_true File.exists? Today.folder
  end

  def test_initialize
    FileUtils.rm_rf Today.folder
    assert_false File.exists? Today.folder
    today = Today.new
    # puts today.data
    # d = today.data
    # assert_equal 1, 1 
    # puts 1, today.data
    # puts 2, Today.initial_state
    # puts 1, today.data['session']
    # puts 2, Today.initial_state['session']
    # puts 'end'
    assert_equal today.data['session'], Today.initial_state[:session]
    # assert_equal (String today.data), (String Today.initial_state)
  end
end