# CardDraw is meant to be overridden and provides base implementation
# for CommunityChest and Chance.
# @cards is a class instance variable and must be initialized in each subclass
# @cards is used to contain the cards and is added to using the card class method
# CardDraw has an apply method and can be used in place of a Rule using duck typing
# NOTE - CardDraw is not instantiated - the class defenition itself is used as the rule.


class CardDraw

# when creating a card, supply either a rule or a block to be executed when the card is 'drawn'
# if a block is passed then this is wrapped in a rule so that it can be called in the apply method
  def self.card(rule = nil, &block)
    rule = Rule::DEFAULT unless rule || block_given?
    if block_given?
      @cards << Rule.new(&block)
    else
      @cards << rule
    end
  end

# selects a 'card' (rule) at randon then apply's that rule
  def self.apply(turn)
    card = @cards.sample
    card.apply turn
  end

  def self.cards
    @cards
  end
end