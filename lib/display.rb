# frozen_string_literal: true

module Display # rubocop:disable Style/Documentation
  def display_intro
    "Let's play a simple Tic-Tac-Toe game in the console!"
  end

  def display_game_setup_text
    "Setting up the game: "
  end

  def display_input_warning_txt
    "Input warrning, Wrong input try again."
  end

  def display_player_create_txt(number)
    "Enter player_#{number} name: "
  end

  def display_player_create_symbol
    "Enter player symbol (X or O):"
  end

  def display_current_player_input_text
    "Enter the a position to fill: "
  end

  def dispaly_valid_position_text
    "The position is filled. Please try again."
  end

  def display_winner(current_player)
    "Congradulations #{current_player.name} you Won!"
  end

  def display_its_a_tie
    "Wow it's a tie!"
  end
end
