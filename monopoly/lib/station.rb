class Station < Land

  PURCHASE_VALUE = 200
  RENT_VALUE = 50
  RENT_VALUE_ONE_OWNED = RENT_VALUE
  RENT_VALUE_TWO_OWNED = 100
  RENT_VALUE_THREE_OWNED = 200
  RENT_VALUE_FOUR_OWNED = 400

  def initialize(name, group)
    super(name, 200, 50, group)
  end

  def calculate_rent
    if @owner
      case @group.land_owned_by(@owner).count
        when 2 then RENT_VALUE_TWO_OWNED
        when 3 then RENT_VALUE_THREE_OWNED
        when 4 then RENT_VALUE_FOUR_OWNED
        else super
      end
    else
      super
    end
  end
end
