class LandGroup
  attr_reader :name, :land

  include Enumerable
  # extend Forwardable
  # def_delegators :@land, :each, :<<

  def initialize(name)
    @name = name
    @land = []
  end

  def <<(land)
    @land << land
  end

  def each
    if block_given?
      @land.each {|x| yield x }
    else
      @land.each
    end
  end

  def land_owned_by(owner)
    @land.select { |land| land.owner == owner }
  end
end