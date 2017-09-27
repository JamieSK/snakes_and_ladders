require 'minitest/autorun'
require 'minitest/rg'

require_relative '../die_six'
require_relative '../player'

class TestPlayer < MiniTest::Test
  def setup
    @die = DieSix.new
    @player = Player.new('Dave')
  end

  def test_take_turn
    assert((1..6).include?(@player.take_turn(@die)))
  end
end
