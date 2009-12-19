
class Game 
  
  def dealer
    @@dealer
  end
  
  def dealer=(dealer)
    puts "instance dealer"
    @@dealer = dealer
  end
  
  def next_round
    @@rounds[0].call
  end

  class << self
    @@rounds = []
    
    def rounds
      @@rounds
    end
    
    def dealer
      @@dealer ||= Dealer.new
    end
    
    def dealer=(dealer)
      puts "class dealer"
      @@dealer = dealer
    end
    
    def load(filename)
      file = File.join(File.dirname(__FILE__), '..', 'game_definitions', filename + '.card')
      filename.capitalize!
      klass = Class.new(Game)
      Object.const_set(filename, klass)
      klass = Object.const_get(filename)
      klass.parse(IO.read(file))
    end
    
    def parse(code)
      eval code
    end
   
    def add_round(&block)
        @@rounds << block
    end
    
    
  end # end class variables
  
end