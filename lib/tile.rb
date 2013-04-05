class Tile
  attr_reader :name
  attr_accessor :next, :rule

  def initialize(name)
      @name = name
      @buyable = false
      @rule = Rule::DEFAULT
  end

  def buyable?
    @buyable
  end
end