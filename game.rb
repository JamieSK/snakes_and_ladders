require_relative 'movers'
require_relative 'player'
require_relative 'board'
require_relative 'die_six'

class Game
  attr_accessor :jamie, :board, :players

  def initialize
    @board = Board.new
    @jamie = Player.new('Jamie')
    @alex = Player.new('Alex')
    @die = DieSix.new
    @players = [@alex, @jamie]
    @board.add_to_square(0, @alex)
    @board.add_to_square(0, @jamie)
  end

  def inspect_square(square)
    @board.square_contents(square)
  end

  def move_player(player)
    obstruction = ''

    puts "Roll die #{player.name}?"
    gets.chomp
    move = turn_taker(player)

    return nil if win_check(move[1], player, move, obstruction)

    @board.move_from_to(move[0], move[1], player)
    player.square = move[1]

    @board.square_contents(move[1]).each { |element|
      if element.class == Mover
        obstruction = check_for_mover(element, player, move, obstruction)
      end
    }

    printout(player, move, obstruction)
    true
  end

  def win_check(new_square, player, move, obstruction)
    if new_square >= 100
      printout(player, move, obstruction)
      endgame(player)
      @not_finished = false
      return true
    end
    false
  end

  def check_for_mover(element, player, move, obstruction)
    move[1] = element.finish
    @board.move_from_to(move[0], move[1], player)
    player.square = move[1]

    return obstruction = snake_or_ladder(move[1], move[0])
  end

  def printout(player, move, obstruction)
    puts "#{player.name}, you moved #{move[2]},#{obstruction} now you're on square #{move[1]}!"
  end

  def turn_taker(player)
    current_square = player.square
    die_roll = player.take_turn(@die)
    new_square = current_square + die_roll
    return [current_square, new_square, die_roll]
  end

  def snake_or_ladder(new_square, current_square)
    if new_square > current_square
      return ' (Hit a ladder!)'
    else
      return' (Hit a snake)'
    end
  end

  def endgame(winner)
    puts "#{winner.name}, you're the winner!!!"
  end
end

@snake_and_ladders = Game.new
@not_finished = true

def lets_play_a_game
  while @not_finished
    @snake_and_ladders.players.each { |player|
      if @snake_and_ladders.move_player(player) == nil
        return nil
      end
    }
  end
end

lets_play_a_game
