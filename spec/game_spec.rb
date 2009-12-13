require(File.join(File.dirname(__FILE__), '.', 'spec_helper'))

describe Game do
  it "should parse the rules for games" do
    Dealer.player = true
    game = Game.parse 'Dealer.player = false'
    game.kind_of?(Game).should be true
    Dealer.player.should be false
  end
  
  it "should load a game from a file" do
    file_contents = ['x']
    IO.expects(:read).returns(file_contents)
    Game.expects(:parse).with(file_contents)
    Game.load "blackjack"
  end
end
