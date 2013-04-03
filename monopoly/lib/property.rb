class Property < Land
  def calculate_rent
    if @owner && @owner.owns_complete_group?(self)
      super * 2
    else
      super
    end
  end
end
