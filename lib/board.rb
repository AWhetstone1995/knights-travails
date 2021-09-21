# frozen_string_literal: true

require_relative 'knight'

# Board that simulates finding the shortest path for a knight from one tile to another
class Board
  attr_accessor :path

  def initialize(start_knight, end_pos)
    @path = get_path(start_knight, end_pos)
  end

  # Search method that incorporates Breadth First Search algorithm to determine the shortest path
  def bfs(start_knight, end_pos)
    queue = [start_knight]
    visited_tiles = []
    until queue.empty?
      curr_node = queue.shift
      if curr_node.moves.include?(end_pos)
        @path.unshift(Knight.new(end_pos, curr_node.dist + 1))
        return curr_node
      end
      visited_tiles.push(curr_node.location)
      curr_node.moves.each do |move|
        queue.push(Knight.new(move, curr_node.dist + 1)) unless visited_tiles.include?(move)
      end
    end
  end

  # Method that builds the array to print out the path taken from start to end
  def get_path(start_knight, end_node)
    self.path = []
    # Loop until we have built the print array to the starting location
    until end_node.location == start_knight.location
      end_node = bfs(start_knight, end_node.location)
      bfs(start_knight, end_node)
    end
    path.unshift(start_knight)
    puts "You reached the tile in #{path.last.dist} moves.\n
Here is your path from #{path[0].location} to #{path.last.location}: \n"
    until path.length == 1
      puts "#{path[0].location} to #{path[1].location}"
      path.shift
    end
  end
end
