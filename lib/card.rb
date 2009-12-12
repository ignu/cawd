class Card
  attr_accessor :suit, :face
  
  def initialize (card_face, suit)
    @face = card_face
    @suit = suit
  end
  
  def value
    return 10 if face == 'J' || face == 'Q' || face == 'K'
    return 11 if face == 'A'
    return face
  end
     
end