require "byebug"
require_relative 'tic_tac_toe'

class TicTacToeNode

  attr_reader :board, :next_mover_mark

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    # debugger
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
    @children = []
    @parent = nil
  end


  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    debugger
    board.each_with_index do |row, idx1|
      row.each_with_index do |tile, idx2|
        child_board = board.dup.map { |subArr| subArr.dup.map { |el| el.dup}}
        self.children << TicTacToeNode.new(board,)
      end


    end
  end
end
