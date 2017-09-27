require 'minitest/autorun'
require 'minitest/rg'

require_relative '../movers'
require_relative '../player'
require_relative '../board'
require_relative '../game'
require_relative '../die_six'

class TestBoard < MiniTest::Test
  def setup
    @s_and_l = Game.new
  end

  def test_inspect_square
    assert_equal(1, @s_and_l.inspect_square(4).length)
  end

  def test_move_player
    @s_and_l.move_player(@s_and_l.jamie)
  end
end
