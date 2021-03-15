require "byebug"
require_relative 'tic_tac_toe'

class TicTacToeNode

  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    # debugger
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
    @parent = nil
  end


  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    childs = []
    if next_mover_mark == :x
      move = :o
    else
      move = :x
    end
    (0..2).each do |idx1|
      (0..2).each do |idx2|
        pos = [idx1, idx2]

        child_board = board.dup
        if child_board.empty?(pos)
          child_board[pos] = next_mover_mark
          childs << TicTacToeNode.new(child_board, move, pos)
        end
      end
    
    end
    return childs
  end
end
