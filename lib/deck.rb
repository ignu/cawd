class Deck
  attr_accessor :pile
  
  def self.suits 
    [:clubs, :spades, :hearts, :diamonds]
  end
  def self.values
    %w{2, 3, 4, 5, 6, 7, 8, 9, 10, J, Q, K, A}
  end
  
  def initialize
    @pile = []
    Deck.suits.each do |suit|
      Deck.values.each do |value|
        pile << Card.new(value, suit)
      end
    end
  end
  
end

class Card
  attr_accessor :value, :suit
  
  def initialize (val, suit)
    @value = val
    @suit = suit
  end
     
end