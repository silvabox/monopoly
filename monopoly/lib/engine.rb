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
            player.receive_funds(200)
            puts "#{player.name} passes Go and receives 200"
          end
        end

        tile = player.tile

        puts "#{player.name} moves #{dice.total} to #{tile.name}"

        begin
          tile.rule.apply(player)

        rescue RuntimeError => e
          puts e.message
        end
        
        player = player.next
      end
      nil
    end
    puts "#{winner.name} wins" if winner
  end
end