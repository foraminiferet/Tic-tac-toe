# frozen_string_literal: true

require_relative "display"

# Contains the logic to play the game
class Game
  include Display
  attr_reader :board, :player1, :player2, :current_player

  def initialize
    @board = Board.new
    @player1 = nil
    @player2 = nil
    @current_player = nil
  end

  def play
    game_setup
    board.display_board
    player_turns
    game_ending
  end

  def create_player(number, symbol_temp = nil)
    puts display_player_create_txt(number)
    name = gets.chomp
    puts display_player_create_symbol
    symbol = input_symbol(symbol_temp)
    Player.new(name, symbol)
  end

  def turn_player(current_player)
    cell = turn_input(current_player)
    board.update_board(cell, current_player.symbol)
    board.display_board
  end

  private

  def game_setup
    puts display_game_setup_text
    @player1 = create_player(1)
    @player2 = create_player(2, player1.symbol)
    @current_player = player1
  end

  def input_symbol(duplicate)
    input = gets.chomp
    return input if input.match?(/[OX]/) && input != duplicate

    puts display_input_warning_txt
    input_symbol(input)
  end

  def switch_player(current_player)
    if current_player == player1
      player2
    else
      player1
    end
  end

  def turn_input(current_player)
    puts display_current_player_input_text
    input_position = gets.chomp.to_i
    return input_position if board.valid_move?(input_position)

    puts display_valid_position_text
    turn_input(current_player)
  end

  def player_turns
    until board.board_full?
      turn_player(current_player)
      break if board.game_over?

      @current_player = switch_player(current_player)
    end
  end

  def game_ending
    if board.game_over?
      puts display_winner(current_player)
    else
      puts display_its_a_tie
    end
  end
end
