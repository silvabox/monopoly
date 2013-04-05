class Station < Land

  PURCHASE_VALUE = 200
  RENT_VALUE = 50
  RENT_VALUES = {
    1 => RENT_VALUE,
    2 => 100,
    3 => 200,
    4 => 400
  }

  def initialize(name, group)
    super(name, PURCHASE_VALUE, RENT_VALUE, group)
  end

  def calculate_rent
    if @owner
      RENT_VALUES[@group.land_owned_by(@owner).count]
    else
      super
    end
  end
end
