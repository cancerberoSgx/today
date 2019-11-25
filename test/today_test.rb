require "test/unit"
require_relative '../src/today'

include Test::Unit::Assertions
require 'fileutils'

class HelloTest < Test::Unit::TestCase
  def test_today_folder
    assert_true Today.today_folder.end_with? '/.today'
  end

  def test_today_file
    assert_true Today.today_file.include? '/.today/'
  end

  def test_initialize
    FileUtils.rm_rf Today.today_folder if File.exists? Today.today_folder
    assert_false File.exists? Today.today_folder
    Today.initialize
    assert_true File.exists? Today.today_folder
  end
end