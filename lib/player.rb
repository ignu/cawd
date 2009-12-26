
class Player
  attr_accessor :cards
  
  def self.add_action(method_name, &block)
    define_method method_name, block
  end
  
  def initialize
    @cards = []
  end
  
  def deal(cards)
    cards.each do |card|
      @cards << card
    end
  end

end

class Dealer < Player
  
  def player?
    @player
  end
  
  def player=(value)
    @player = value
  end
  
  def initialize
    @player = false
    @cards = [] unless !player?
  end
end