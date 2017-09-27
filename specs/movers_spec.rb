require 'minitest/autorun'
require 'minitest/rg'

require_relative '../movers'

class TestMover < MiniTest::Test
  def setup
    @mover = Mover.new(47)
  end

  def test_get_finish
    assert_equal(47, @mover.finish)
  end
end
