class Tile
  attr_reader :name, :next

  def initialize(name)
      @name = name
      @buyable = false
  end

  def buyable?
    @buyable
  end

  def next=(tile)
    @next = tile
  end

  def +(value)
    tile = self
    value = value.to_i

    value.times do
      tile = tile.next
    end
    tile
  end
end