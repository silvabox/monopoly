class LandGroup
  attr_reader :name, :land

  def initialize(name)
    @name = name
    @land = []
  end

  def <<(land)
    @land << land
  end

  def land_owned_by(owner)
    @land.select { |land| land.owner == owner }
  end
end