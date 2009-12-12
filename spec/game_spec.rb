require(File.join(File.dirname(__FILE__), '.', 'spec_helper'))

describe Game do
  it "should parse the rules for games" do
    Dealer.player = true
    game = Game.parse 'Dealer.player = false'
    game.kind_of?(Game).should be true
    Dealer.player.should == false
  end
  

end
