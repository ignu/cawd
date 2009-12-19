
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

  class << self

    @@code = ''
        
    def load(filename)
      file = File.join(File.dirname(__FILE__), '..', 'game_definitions', filename + '.card')
      filename.capitalize!
      klass = Class.new(Game)
      Object.const_set(filename, klass)
      klass = Object.const_get(filename)
      klass.parse(IO.read(file))
    end
    
    def parse(code)
      @@code =code
    end
   
  end # end class variables
  
end