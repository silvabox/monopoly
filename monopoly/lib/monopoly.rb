require "./lib/dice.rb"
require "./lib/tile.rb"
require "./lib/land_group.rb"
require "./lib/land.rb"
require "./lib/property.rb"
require "./lib/station.rb"
require "./lib/board.rb"
require "./lib/london_board.rb"
require "./lib/player.rb"
require "./lib/game.rb"
require "./lib/engine.rb"


game = Game.new(LondonBoard.new)

game.player "Ben", 1500
game.player "Leo", 1500

Engine.run(game)