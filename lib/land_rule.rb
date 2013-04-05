class LandRule < Rule

  def initialize(land)
    @land = land
  end

  def apply(turn)
    player = turn.player
    begin
      if @land.available?
        player.buy @land if player.can_afford?(@land.purchase_value)
        turn.log "#{player.name} buys #{@land.name}; new balance #{player.balance}"
      else
        if @land.owned_by?(player)
          turn.log "#{player.name} owns #{@land.name}"
        else
          player.pay_rent @land
          turn.log "#{player.name} pays #{@land.owner.name} #{@land.calculate_rent} for rent on #{@land.name}"
        end
      end
      super
    rescue RuntimeError
      turn.log "#{player.name} is bankrupt!"
      throw :bankrupt, @player
    end
  end
end