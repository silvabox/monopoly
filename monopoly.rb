require "./dice.rb"
require "./property.rb"
require "./station.rb"
require "./land_set.rb"
require "./player.rb"
require "./game.rb"

class Monopoly

 def self.run(game)

  winner=false
  dice = Dice.new(2)

  player = game.first_player

  100.times do
    dice.roll!

    player.tile += dice.total

    tile = player.tile

    puts "#{player.name} moves #{dice.total} to #{tile.name}"

    begin
      if tile.buyable? && tile.available?
        player.buy(tile)

        puts "#{player.name} buys #{tile.name}"
      end

      if tile.
    rescue Exception
      puts Exception
    end
    player = player.next
  end

 end

end

game = Game.new


game.tile "Go"


game.land_set :brown, "Brown"

game.property "Old Kent Road", 60, 2, :brown
game.tile "Community Chest"
game.property "Whitechapel Road", 60, 4, :brown

game.tile "Income Tax"
game.station "King's Cross Station"

game.land_set :blue, "Blue"

game.property "The Angel Islington", 100, 6, :blue
game.tile "Chance"
game.property "Euston Road", 100, 6, :blue
game.property "Pentonville Road", 120, 8, :blue


game.tile "Just Visiting"


game.land_set :pink, "Pink"

game.property "Pall Mall", 140, 10, :pink
game.tile "Electric Company"
game.property "Whitehall", 140, 10, :pink
game.property "Northumberland Avenue", 160, 12, :pink

game.station "Marylebone Station"

game.land_set :orange, "Orange"

game.property "Bow Street", 180, 14, :orange
game.tile "Community Chest"
game.property "Marlborough Street", 180, 14, :orange
game.property "Vine Street", 200, 16, :orange


game.tile "Free Parking"


game.land_set :red, "Red"

game.property "The Strand", 220, 18, :red
game.tile "Chance"
game.property "Fleet Street", 220, 18, :red
game.property "Trafalgar Square", 240, 20, :red

game.station "Fenchurch Street Station"

game.land_set :yellow, "Yellow"

game.property "Leicester Square", 260, 22, :yellow
game.property "Coventry Street", 260, 22, :yellow
game.tile "Water Works"
game.property "Piccadily", 280, 24, :orange


game.tile "Go To Jail"


game.land_set :green, "Green"

game.property "Regent Street", 300, 26, :green
game.property "Oxford Street", 300, 26, :green
game.tile "Community Chest"
game.property "Bond Street", 320, 28, :red

game.station "Liverpool Street Station"
game.tile "Chance"

game.land_set :purple, ""

game.property "Park Lane", 350, 35, :purple
game.tile "Super Tax"
game.property "Mayfair", 400, 50, :purple

game.player "Ben", 2500
game.player "Leo", 2500


Monopoly.run(game)