

class UndealtCard
  attr_accessor :state
  
  def initialize(state)
    @state = state
  end

  def states
    [:up, :down, :hand]
  end
end

class Card < UndealtCard
  attr_accessor :suit, :face

  def initialize (card_face, suit, state = :hand)
    @face = card_face
    @suit = suit
    super state
  end

  def value
    return 10 if face == 'J' || face == 'Q' || face == 'K'
    return 11 if face == 'A'
    return face
  end

end

class Fixnum
  def up
    rv = []
    self.times do
      rv << UndealtCard.new(:up)
    end
    rv
  end
end