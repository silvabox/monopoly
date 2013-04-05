class PenaltyRule < Rule

  def initialize(penalty, description)
    @penalty = penalty
    @description = description
  end

  def apply(turn)
    begin
      player = turn.player
      player.pay @penalty
      turn.log "#{player.name} pays #{@penalty} - #{@description}"
      super
    rescue RuntimeError
      turn.log "#{player.name} is bankrupt!"
      throw :bankrupt, player
    end
  end
end