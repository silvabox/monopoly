class TestBoard < Board

def initialize
    super(Tile.new("Go"))
end

protected

  def build
    land_group :group1, "Group 1"

    property "Property 1.1", 100, 5, :group1
    property "Property 1,2", 150, 10, :group1

    land_group :group2, "Group 2"

    property "Property 2.1", 200, 20, :group2
    property "Property 2.2", 250, 25, :group2
    property "Property 2.3", 280, 28, :group2
  end
end