class Game
  def self.parse(code)
    eval code
    return Game.new
  end
  
  def self.load(filename)
    file = File.join(File.dirname(__FILE__), '..', 'game_definitions', filename + '.card')
    parse IO.read(file)
  end
end