class CommunityChest < CardDraw
  @cards = []

  card BonusRule.new(10, "You win a beauty competition, collect 10")
  
  card do |turn|
    turn.opponents.each do |player|
      turn.player.receive player.pay 10
    end
    turn.log "it's your birthday, collect 10 from each player"
  end

  card do |turn|
    tile = turn.advance_to "Trafalgar Square", true
    turn.log "Advance to Trafalgar Square"
    tile.rule.apply(turn)
  end

  card do |turn|
    tile = turn.advance_to "Mayfair", true
    turn.log "Advance to Mayfair"
    tile.rule.apply(turn)
  end
end