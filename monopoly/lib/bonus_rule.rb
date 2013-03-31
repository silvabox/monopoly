class BonusRule < Rule

  def initialize(bonus, description)
    @bonus = bonus
    @description = description
  end

  def apply(turn)
    player = turn.player
    begin
      player.receive @bonus
      turn.log "#{player.name} receives #{@bonus} - #{@description}"
      super
    rescue RuntimeError
      turn.log "#{player.name} is bankrupt!"
      throw :bankrupt, player
    end
  end
end