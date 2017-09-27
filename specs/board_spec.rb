require 'minitest/autorun'
require 'minitest/rg'

require_relative '../board'

# Tests the snakes and ladders board class.
class TestBoard < MiniTest::Test
  def setup
    @board = Board.new
  end

  def test_square_contents__snake
    assert_equal('7snake', @board.square_contents(17))
  end

  def test_square_contents__ladder
    assert_equal('14ladder', @board.square_contents(4))
  end
end
