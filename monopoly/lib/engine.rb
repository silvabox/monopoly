class Engine

  def self.run(game)
    winner = false
    dice = Dice.new(2)
    player = game.first_player

    1000.times do

      dice.roll!

      player.advance(dice.total) do |tile|
        if tile.name == Board::START_TILE_NAME
          player.receive 200
          puts "#{player.name} passes Go and receives 200"
        end
      end

      tile = player.tile
      puts "#{player.name} moves #{dice.total} to #{tile.name}; balance #{player.balance}"
      turn = Turn.new(player, game.players, dice)

      bankrupted_player = catch :bankrupt do
        tile.rule.apply(turn)

        if dice.double?
          puts "#{player.name} rolled a double"
        else
          player = player.next
        end
        nil
      end

      game.remove_player bankrupted_player if bankrupted_player

      if game.player_count == 1
        winner = game.first_player
        break
      end
    end

    puts winner ? "#{game.first_player} wins" : "No winner found"
  end
end
