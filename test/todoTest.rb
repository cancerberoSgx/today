require 'test/unit/assertions'
include Test::Unit::Assertions
require 'fileutils'

def test_today_todos
  FileUtils.rmdir
end


hello = 'world'

assert_equal 'world', hello, "hello function should return 'world'"