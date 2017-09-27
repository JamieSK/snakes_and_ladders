require 'minitest/autorun'
require 'minitest/rg'

require_relative '../game'

# Tests the snakes and ladders game class.
class TestBoard < MiniTest::Test
  def setup
    @s_and_l = Game.new
  end
end
