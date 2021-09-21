require_relative 'board'
require_relative 'knight'

start_knight = Knight.new([0, 1])
end_knight = Knight.new([4, 5])
Board.new(start_knight, end_knight)
