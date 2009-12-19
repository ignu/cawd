require(File.join(File.dirname(__FILE__), '.', 'spec_helper'))

describe Game do
  
  describe "loading a game from a file" do
    before(:each) do
      file_contents = ''
      IO.expects(:read).returns(file_contents)
      #Blackjack.expects(:parse).with(file_contents)  TODO: figure out how to test this
      Game.load "blackjack"
    end
      
    it "subclass game based on the provided filename" do
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
    
    it "should be able to define actions for a round" do
      Argh.parse 'add_round { puts self; dealer= 3}'
      Argh.new.next_round
      Argh.dealer.should == 3
    end
    
    
    it "should be able to define actions for a round" do
      Argh.parse 'add_round {puts self}'
      Argh.new.next_round
    end
    
  end
end
