class CommunityChest < CardDraw
  @cards = []

  card BonusRule.new(10, "You win a beauty competition, collect 10")
  
  card do |turn|
    turn.opponents.each do |player|
      turn.player.receive 10
      player.pay 10
    end
    turn.log "it's your birthday, collect 10 from each player"
  end
end