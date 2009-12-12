class Game
  def self.parse(code)
    eval code
    return Game.new
  end
  
end