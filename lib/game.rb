
class Game 
  
  attr_accessor :dealer
  
  def initialize
    @rounds = []
    @dealer = Dealer.new
    
    load_external_code
  end
  
  def add_round(&block)
    @rounds << block
  end
  
  def next_round
    @rounds[0].call
  end
  
  def dealer=(d)
    puts "dealer=called"
    @dealer = d
  end

  private
  
  def parse(code)
    eval code
  end
  
  def load_external_code
    file = File.join(File.dirname(__FILE__), '..', 'game_definitions', self.class.to_s + '.card')
    code = IO.read(file)
    parse code
  end

end

class GameFactory
    
  class << self
        
    def load(filename)
      filename.capitalize!      
      klass = Class.new(Game)
      Object.const_set(filename, klass)     
    end  
   
  end # end class variables
end