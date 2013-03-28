class LondonBoard < Board

def initialize
    super("Go")
end

protected

  def build
    land_group :brown, "Brown"

    property "Old Kent Road", 60, 2, :brown
    tile "Community Chest"
    property "Whitechapel Road", 60, 4, :brown

    tile "Income Tax"
    station "King's Cross Station"

    land_group :blue, "Blue"

    property "The Angel Islington", 100, 6, :blue
    tile "Chance"
    property "Euston Road", 100, 6, :blue
    property "Pentonville Road", 120, 8, :blue


    tile "Just Visiting"


    land_group :pink, "Pink"

    property "Pall Mall", 140, 10, :pink
    tile "Electric Company"
    property "Whitehall", 140, 10, :pink
    property "Northumberland Avenue", 160, 12, :pink

    station "Marylebone Station"

    land_group :orange, "Orange"

    property "Bow Street", 180, 14, :orange
    tile "Community Chest"
    property "Marlborough Street", 180, 14, :orange
    property "Vine Street", 200, 16, :orange


    tile "Free Parking"


    land_group :red, "Red"

    property "The Strand", 220, 18, :red
    tile "Chance"
    property "Fleet Street", 220, 18, :red
    property "Trafalgar Square", 240, 20, :red

    station "Fenchurch Street Station"

    land_group :yellow, "Yellow"

    property "Leicester Square", 260, 22, :yellow
    property "Coventry Street", 260, 22, :yellow
    tile "Water Works"
    property "Piccadilly", 280, 24, :yellow


    tile "Go To Jail"


    land_group :green, "Green"

    property "Regent Street", 300, 26, :green
    property "Oxford Street", 300, 26, :green
    tile "Community Chest"
    property "Bond Street", 320, 28, :green

    station "Liverpool Street Station"
    tile "Chance"

    land_group :purple, ""

    property "Park Lane", 350, 35, :purple
    tile "Super Tax"
    property "Mayfair", 400, 50, :purple
  end
end
