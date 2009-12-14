class Game
  
  attr_accessor :dealer
  
  class << self
    
    def inherited(a)
      puts "inheirted by (#{a})"
      puts a.new.class
      puts a.class
    end
    
    def load(filename)
      
      file = File.join(File.dirname(__FILE__), '..', 'game_definitions', filename + '.card')
      filename = filename.to_pascal
      x = eval("class #{filename} < Game\n end")
      game = Object.const_get(
      filename)
      
      game.parse(IO.read(file))
    end
    
    def parse(code)
      eval code
    end
  end # end class variables
  
  def initialize
    @dealer = Dealer.new
  end
  
  
  
  private 


  def add_round
  end
end