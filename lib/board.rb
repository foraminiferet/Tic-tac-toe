# frozen_string_literal: true

# Tic-Tac-Toe board
class Board
  attr_reader :board

  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  WINNING_CONDITION = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6],
    [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]
  ].freeze

  def display_board # rubocop:disable Metrics/AbcSize
    puts <<-HEREDOC
      #{board[0]} | #{board[1]} | #{board[2]}
     ---+---+---
      #{board[3]} | #{board[4]} | #{board[5]}
     ---+---+---
      #{board[6]} | #{board[7]} | #{board[8]}
    HEREDOC
  end

  def update_board(position, symbol)
    board[position - 1] = symbol
  end

  def board_full?
    board.all? { |cell| cell.to_s =~ /[^0-9]/ }
  end

  def valid_move?(position)
    board[position - 1].is_a?(Integer)
  end

  def game_over?
    WINNING_CONDITION.any? do |combination|
      [board[combination[0]], board[combination[1]], board[combination[2]]].uniq.length == 1
    end
  end
end
