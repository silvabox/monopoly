class Engine

  def self.run(game)

    winner=false

    dice = Dice.new(2)

    player = game.first_player

    winner = catch :winner do

      100.times do

        dice.roll!

        player.advance(dice.total) do |tile|
          if tile.name == Board:: START_TILE_NAME
            player.receive 200
            puts "#{player.name} passes Go and receives 200"
          end
        end

        tile = player.tile
        puts "#{player.name} moves #{dice.total} to #{tile.name}; balance #{player.balance}"
        puts "#{player.name} rolled a double" if dice.double?
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
        throw :winner, player if game.player_count == 1
      end
      nil
    end

    puts "#{winner.name} wins" if winner
  end
end