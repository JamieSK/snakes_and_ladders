class Board
  attr_reader :board
  def initialize
    @board = Array.new(100, [])

    # Add ladders.
    add_to_square(4, Mover.new(14))
    add_to_square(9, Mover.new(31))
    add_to_square(20, Mover.new(38))
    add_to_square(28, Mover.new(84))
    add_to_square(40, Mover.new(59))
    add_to_square(51, Mover.new(67))
    add_to_square(63, Mover.new(81))
    add_to_square(71, Mover.new(91))

    # Add snakes.
    add_to_square(17, Mover.new(7))
    add_to_square(54, Mover.new(34))
    add_to_square(62, Mover.new(19))
    add_to_square(64, Mover.new(60))
    add_to_square(87, Mover.new(24))
    add_to_square(93, Mover.new(73))
    add_to_square(95, Mover.new(75))
    add_to_square(99, Mover.new(78))
  end

  def square_contents(square)
    @board[square]
  end

  def remove_from_square(square, content)
    @board[square] -= [content]
  end

  def add_to_square(square, content)
    @board[square] += [content]
  end

  def move_from_to(from, to, content)
    remove_from_square(from, content)
    add_to_square(to, content)
  end
end
