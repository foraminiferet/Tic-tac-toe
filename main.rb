# frozen_string_literal: true

require_relative "lib/board"
require_relative "lib/player"
require_relative "lib/display"
require_relative "lib/game"

def play_game
  game = Game.new
  game.play
end

play_game
