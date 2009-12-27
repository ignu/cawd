require(File.join(File.dirname(__FILE__), '.', 'spec_helper'))

describe Game do

  before(:each) do
    stub_dsl_code('')
    @game = Game.new 
    @game.players << Player.new
    @game.players << Player.new   
  end
  
  it "should have an array of players" do
    @game.players.length.should be 2
  end
  
  it "should be able to deal cards" do #TODO: this exposing too many internals?  
    @game.deal @game.players, 1.up
    @game.players[0].cards.length.should be 1
  end
  
  
  describe "loading a game from a file" do
    before(:each) do
      file_contents = ''
      IO.expects(:read).returns(file_contents)
      
      #Blackjack.expects(:parse).with(file_contents)  TODO: figure out how to test this
      GameFactory.load "blackjack"
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
      stub_dsl_code('dealer.player = true')
      Argh.new.dealer.player?.should be true
      stub_dsl_code('dealer.player = false')
      Argh.new.dealer.player?.should be false
    end
    
    it "should be able to define actions for a round" do
      stub_dsl_code('add_round { @dealer = 3}')
      game = Argh.new
      game.next_round
      game.dealer.should == 3
    end
    
    it "should be able to deal to all" do
      stub_dsl_code('add_round { deal all, 2.up}')
      game = Argh.new
      game.players << Player.new
      game.next_round
      game.dealer.cards.count.should == 2
      game.players.first.cards.count.should == 2
    end
    
  end
  
  def stub_dsl_code(code)
    IO.expects(:read).returns(code)
  end
end
