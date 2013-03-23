require "./land.rb"
require "./land_set.rb"

class Station < Land

  @@station_set = LandSet.new("Stations")

  def initialize(name)
    super(name, 200, 50, @@station_set)
  end

  def calculate_rent
    if @owner
      case @set.land_owned_by(@owner).count
        when 2 then 100
        when 3 then 200
        when 4 then 400
        else super
      end
    else
      super
    end
  end
end
