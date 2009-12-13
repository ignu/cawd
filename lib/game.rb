class Game
  
  attr_accessor :dealer
  
  class << self
    def parse(code)
      return Game.new code
    end

    def load(filename)
      file = File.join(File.dirname(__FILE__), '..', 'game_definitions', filename + '.card')
      parse IO.read(file)
    end
  end
  
  def initialize(code)
    @dealer = Dealer.new
    eval code
  end

  def add_round
  end
end