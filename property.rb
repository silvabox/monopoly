require "./land.rb"

class Property < Land
  attr_reader :rent_value_in_set

  def initialize(name, purchase_value, rent_value, set)
    super(name, purchase_value, rent_value, set)
    @rent_value_in_set = rent_value_in_set
  end

  def calculate_rent
    if @owner && @owner.owns_complete_set?(self)
      super * 2
    else
      super
    end
  end
end
