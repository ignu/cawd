class Dealer
  
  def player?
    @player
  end
  def player=(value)
    @player = value
  end
  
  def initialize
    @player = false
  end
end