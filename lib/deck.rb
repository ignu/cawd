class Deck
  attr_accessor :pile
  
  def self.suits 
    [:clubs, :spades, :hearts, :diamonds]
  end
  def self.faces
    %w{2, 3, 4, 5, 6, 7, 8, 9, 10, J, Q, K, A}
  end
  
  def initialize
    @pile = []
    Deck.suits.each do |suit|
      Deck.faces.each do |value|
        pile << Card.new(value, suit)
      end
    end
  end
  
  def shuffle!
    pile.shuffle!
  end
  
end
