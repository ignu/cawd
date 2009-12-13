require File.dirname(__FILE__) + '/spec_helper'

describe Dealer do
  describe "when initializing a dealer" do
  
    before(:each) do
      @dealer = Dealer.new
    end
  
    it "should set the player flag to false" do 
      @dealer.player?.should be false
    end
  end
end
