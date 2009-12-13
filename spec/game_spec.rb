require(File.join(File.dirname(__FILE__), '.', 'spec_helper'))

describe Game do
  
  it "should load a game from a file" do
    file_contents = ['x']
    IO.expects(:read).returns(file_contents)
    Game.expects(:parse).with(file_contents)
    Game.load "blackjack"
  end
  
  describe "when parsing the rules for the game" do
    it "should be able to set the Dealer as a player or not" do
      game = Game.parse 'dealer.player = false'
      game.dealer.player?.should be false
      game = Game.parse 'dealer.player = true'
      game.dealer.player?.should be true
    end
  end
end
