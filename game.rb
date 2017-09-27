require_relative 'player'
require_relative 'board'
require_relative 'die_six'

# A game of snakes and ladders class.
class Game
  def initialize
    @board = Board.new
    @jamie = Player.new('Jamie')
    @alex = Player.new('Alex')
    @die = DieSix.new
    @players = [@alex, @jamie]
  end

  def move_player(player_index)
    roll_and_move(player_index)

    check_for_redirect(player_index)

    check_for_win_and_puts(player_index)
  end

  def roll_and_move(player_index)
    puts "Roll die #{@players[player_index].name}?"
    gets.chomp

    @roll = @die.roll
    @old_square = @players[player_index].square
    @next_square = @board.square_contents(@old_square + @roll)
  end

  def check_for_redirect(player_index)
    if @next_square.class == Integer
      @players[player_index].square = @old_square + @roll
      @changer = ''
    else
      @players[player_index].square = @next_square.to_i
      up_or_down = @next_square[@players[player_index].square.to_s.length..-1]
      @changer = "(You hit a #{up_or_down}!)"
    end
  end

  def check_for_win_and_puts(player_index)
    if @players[player_index].square == 100
      puts "#{@players[player_index].name}, you rolled a #{@roll}, you won!"
      nil
    else
      puts "#{@players[player_index].name}, you moved #{@roll},"\
           "#{@changer} now you're on square #{@players[player_index].square}!"
      true
    end
  end
end

@snake_and_ladders = Game.new
@not_finished = true

def lets_play_a_game
  while @not_finished
    (0..1).each do |player_index|
      return nil if @snake_and_ladders.move_player(player_index).nil?
    end
  end
end

lets_play_a_game
