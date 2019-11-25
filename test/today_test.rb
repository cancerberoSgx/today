require "test/unit"
require_relative '../src/today'

include Test::Unit::Assertions

class HelloTest < Test::Unit::TestCase
  def test_world
    assert_equal '/Users/wyeworks/.today'.end_with?, Today.today_folder, "Today.today_folder"
  end

#   def test_flunk
#     flunk "You shall not pass"
#   end
end