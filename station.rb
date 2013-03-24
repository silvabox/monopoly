require_relative "./land.rb"
require_relative "./land_group.rb"

class Station < Land

  @@stations = LandGroup.new("Stations")

  def initialize(name)
    super(name, 200, 50, @@stations)
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
