require 'minitest/autorun'
require 'minitest/rg'

require_relative '../movers'
require_relative '../player'
require_relative '../board'

class TestBoard < MiniTest::Test
  def setup
    @board = Board.new
    @player = Player.new('Dave')
    @snake = Mover.new(2)
    @ladder = Mover.new(99)
    
    @board.add_to_square(6, @player)
    @board.add_to_square(80, @snake)
    @board.add_to_square(42, @ladder)
    @board.add_to_square(7, @player)
    @board.add_to_square(7, @ladder)
  end

  def test_square_contents__player
    assert_equal([@player], @board.square_contents(6))
  end

  def test_square_contents__snake
    assert_equal([@snake], @board.square_contents(80))
  end

  def test_square_contents__ladder
    assert_equal([@ladder], @board.square_contents(42))
  end

  def test_square_contents__ladder_and_player
    assert_equal([@player, @ladder], @board.square_contents(7))
  end

  def test_remove_from_square
    @board.remove_from_square(7, @player)
    assert_equal([@ladder], @board.square_contents(7))
  end
end
