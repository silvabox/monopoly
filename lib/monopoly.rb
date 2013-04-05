require './lib/dice'
require './lib/tile'
require './lib/rule'
require './lib/penalty_rule'
require './lib/bonus_rule'
require './lib/land_group'
require './lib/land'
require './lib/land_rule'
require './lib/property'
require './lib/station'
require './lib/board'
require './lib/card_draw'
require './lib/community_chest'
require './lib/london_board'
require './lib/player'
require './lib/turn'
require './lib/game'
require './lib/engine'

game = Game.new(LondonBoard.new)

game.player "Ben", 1500
game.player "Leo", 1500
game.player "Zahid", 1500

Engine.run(game)