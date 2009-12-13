class Game
  def self.parse(code)
    eval code
    return Game.new
  end
  
  def self.load_file(filename)
  end
end