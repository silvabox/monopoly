class Tile
  attr_reader :name
  attr_accessor :next

  def initialize(name)
      @name = name
      @buyable = false
  end

  def buyable?
    @buyable
  end
end