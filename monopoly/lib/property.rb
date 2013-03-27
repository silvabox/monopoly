class Property < Land
  def initialize(name, purchase_value, rent_value, group)
    super(name, purchase_value, rent_value, group)
  end

  def calculate_rent
    if @owner && @owner.owns_complete_group?(self)
      super * 2
    else
      super
    end
  end
end
