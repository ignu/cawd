class Dealer
  
  def player?
    @player
  end
  def player=(value)
    @player = value
    puts @player
  end
  
  def initialize
    @player = false
  end
end