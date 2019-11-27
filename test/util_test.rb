require "test/unit"
include Test::Unit::Assertions
require_relative '../src/util'

class UtilTest < Test::Unit::TestCase
  def test_today_zero_hour
    assert_true today_zero_hour != nil
  end  
end
 