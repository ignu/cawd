require File.dirname(__FILE__) + '/spec_helper'

describe Player, "when updating it with the dsl" do

  it "has a stack" do
    p = Player.new
    p.stack = 50
    p.stack.should == 50
  end
  it "can add methods to its own body" do
    Player.add_action :one  do 1; end
    Player.new.one.should equal 1
  end
  
  it "can deal cards" do 
    @player = Player.new
    @player.deal(2.up)
    @player.cards.length.should be 2
  end
  
end