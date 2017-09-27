require 'minitest/autorun'
require 'minitest/rg'

require_relative '../die_six'

class TestDie < MiniTest::Test
  def setup
    @die = DieSix.new
  end

  def test_roll
    assert((1..6).include?(@die.roll))
  end
end
