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
end