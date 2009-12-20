
class Game 
  
  attr_accessor :dealer
  
  def initialize
    @rounds = []
    @dealer = Dealer.new
    eval @@code
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

end
class GameFactory
    
  class << self

    @@code = ''
        
    def load(filename)
      file = File.join(File.dirname(__FILE__), '..', 'game_definitions', filename + '.card')
      filename.capitalize!
      Object.const_set(filename, Game)
      klass = Object.const_get(filename)
      klass.parse(IO.read(file))
      klass.define_method :parse do 
        eval code 
      end
    end
    
    def parse(code)
      @@code =code
    end
   
  end # end class variables
end