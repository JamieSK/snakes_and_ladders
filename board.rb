# A snakes and ladder board class.
class Board
  def initialize
    @board = [0, 1, 2, 3, '14ladder', 5, 6, 7, 8, '31ladder', 10, 11, 12, 13,
              14, 15, 16, '7snake', 18, 19, '38ladder', 21, 22, 23, 24, 25, 26,
              27, '84ladder', 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39,
              '59ladder', 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, '67ladder',
              52, 53, '34snake', 55, 56, 57, 58, 59, 60, 61, '19snake',
              '81ladder', '60snake', 65, 66, 67, 68, 69, 70, '91ladder', 72,
              73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, '24snake',
              88, 89, 90, 91, 92, '73snake', 94, '75snake', 96, 97, 98,
              '78snake', 100, '99bounce-back', '98bounce-back',
              '97bounce-back', '96bounce-back', '95bounce-back']
  end

  def square_contents(square)
    @board[square]
  end
end
