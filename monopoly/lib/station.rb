class Station < Land

  PURCHASE_VALUE = 200
  RENT_VALUE = 50
  RENT_VALUE_ONE_STATION = RENT_VALUE
  RENT_VALUE_TWO_STATIONS = 100
  RENT_VALUE_THREE_STATIONS = 200
  RENT_VALUE_FOUR_STATIONS = 400

  def initialize(name, group)
    super(name, 200, 50, group)
  end

  def calculate_rent
    if @owner
      case @group.land_owned_by(@owner).count
        when 2 then RENT_VALUE_TWO_STATIONS
        when 3 then RENT_VALUE_THREE_STATIONS
        when 4 then RENT_VALUE_FOUR_STATIONS
        else super
      end
    else
      super
    end
  end
end
