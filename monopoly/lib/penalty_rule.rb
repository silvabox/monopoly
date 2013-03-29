class PenaltyRule < Rule

  def initialize(land)
    @land = land
  end

  def apply(player)
    begin
          player.pay_rent @land
        rescue
          puts "#{player.name} is bankrupt!"
          throw :winner, @land.owner
        end
        puts "#{player.name} pays #{@land.owner.name} #{@land.calculate_rent} for rent on #{@land.name}"
      end
    end
  end
end