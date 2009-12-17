def load_game(filename)
  file = File.join(File.dirname(__FILE__), '..', 'game_definitions', filename + '.card')
  filename.capitalize!
  klass = Class.new(Game)
  Object.const_set(filename, klass)
  klass = Object.const_get(filename)
  klass.parse(IO.read(file))
end


class Game 
  
  def dealer
    @@dealer
  end

  class << self
    
    def dealer
      @@dealer ||= Dealer.new
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
    
  end # end class variables
  
  private 

  def add_round
  end
end