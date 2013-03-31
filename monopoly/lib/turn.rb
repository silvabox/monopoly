class Turn
  attr_reader :player, :opponents, :dice

  def initialize(player, players = nil, dice = 0)
    @player, @dice = player, dice
    @opponents = players.reject { |p| p == player } if players
  end

  def log(event)
    puts event
  end
end