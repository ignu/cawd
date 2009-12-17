require(File.join(File.dirname(__FILE__), '.', 'spec_helper'))

describe Game do
  
  describe "should load a game from a file" do
    before(:each) do
      file_contents = ''
      IO.expects(:read).returns(file_contents)
      #Game.expects(:parse).with(file_contents)  TODO: find a good way to test this
      load_game "blackjack"
    end
      
    it "should subclass game based on the provided filename" do
      blackjack = Blackjack.new
      blackjack.should be_kind_of(Game)
    end
  end
  
  describe "when parsing the rules for the game" do
    
    class Argh < Game
    end
    it "should be able to set the Dealer as a player or not" do
      Argh.parse 'dealer.player = true'
      Argh.new.dealer.player?.should be true
      Argh.parse 'dealer.player = false'
      Argh.new.dealer.player?.should be false
    end
  end
end
