# frozen_string_literal: true
# Describes knight piece and it's possible moves
class Knight
  attr_accessor :location, :moves, :dist

  MOVES = [
    [-1, 2], [1, 2], [-1, -2], [1, -2], [-2, 1], [2, 1], [-2, -1], [2, -1]
  ]

  def initialize(location, dist = 0)
    @location = location
    @dist = dist
    @moves = possible_moves(location)
  end

  # Determine the possible moves of the knight object based on it's location on the board
  def possible_moves(location, result = [])
    MOVES.each do |move|
      x = location[0] + move[0]
      y = location[1] + move[1]
      result << [x, y] if x.between?(0, 7) && y.between?(0, 7)
    end
    result
  end
end
