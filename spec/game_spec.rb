require(File.join(File.dirname(__FILE__), '.', 'spec_helper'))

describe Game do
  
  describe "should load a game from a file" do
    before(:each) do
      file_contents = 'puts ""'
      IO.expects(:read).returns(file_contents)
      #Game.expects(:parse).with(file_contents)  TODO: find a good way to test this
      Game.load "blackjack"
    end
    
    it "should subclass game based on the provided filename" do
      Blackjack.new.should be_kind_of(:game)
    end
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
