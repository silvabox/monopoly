class BonusRule < Rule

  def initialize(bonus, description)
    @bonus = bonus
    @description = description
  end

  def apply(turn)
    player = turn.player
    player.receive @bonus
    turn.log "#{player.name} receives #{@bonus} - #{@description}"
    super
  end
end