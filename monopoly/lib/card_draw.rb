class CardDraw
  @cards = []

  def self.card(rule = nil, &block)
    rule = Rule::DEFAULT unless rule || block_given?
    if block_given?
      @cards << Rule.new(&block)
    else
      @cards << rule
    end
  end

  def self.apply(turn)
    card = @cards.sample
    card.apply turn
  end

  def self.cards
    @cards
  end
end