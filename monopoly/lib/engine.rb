class Engine

  def self.run(game)
    winner = false
    dice = Dice.new(2)
    player = game.first_player

    100.times do

      dice.roll!
      turn = Turn.new(player, game.players, dice)

      unless player.bankrupt?
        turn.advance(dice.total)

        tile = player.tile
        puts "#{player.name} moves #{dice.total} to #{tile.name}; balance #{player.balance}"

        tile.rule.apply(turn)
      end

      if player.bankrupt?
        game.remove_player player
      end

      if dice.double? && !player.bankrupt?
        # do not move to next player as player replays
        puts "#{player.name} rolled a double"
      else
        player = player.next
      end

      if game.player_count == 1
        winner = game.first_player
        break
      end
    end

    puts winner ? "#{game.first_player} wins" : "No winner found"
  end
end
