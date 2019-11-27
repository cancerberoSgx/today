require "test/unit"
include Test::Unit::Assertions
require_relative '../src/month'

class MonthTest < Test::Unit::TestCase
  def test_month
    assert_include Month.render, 'Tu  W Th  F  S  S  M'
  end  
  def test_year
    assert_include (Month.render true), 'October'
    assert_include (Month.render true), 'Tu  W Th  F  S  S  M'
  end  
end
 