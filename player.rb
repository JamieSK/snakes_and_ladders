# A player for snakes and ladders class.
class Player
  attr_accessor :square
  attr_reader :name

  def initialize(name)
    @name = name
    @square = 0
  end

  def take_turn(die)
    die.roll
  end
end
