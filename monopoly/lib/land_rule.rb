class LandRule < Rule

  def initialize(land)
    @land = land
  end

  def apply(player)
    begin
      if @land.available?
        player.buy @land if player.can_afford?(@land.purchase_value)
        puts "#{player.name} buys #{@land.name}; new balance #{player.balance}"
      else
        if @land.owner == player
          puts "#{player.name} owns #{@land.name}"
        else
          player.pay_rent @land
          puts "#{player.name} pays #{@land.owner.name} #{@land.calculate_rent} for rent on #{@land.name}"
        end
      end
    rescue RuntimeError
      puts "#{player.name} is bankrupt!"
      throw :winner, @land.owner
    end
  end
end