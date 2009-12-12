require File.dirname(__FILE__) + '/spec_helper'

describe Player, "when updating it with the dsl" do

  before(:each) do
    Player.add_action :one  do 
      1
    end
  end
    
  it "can add methods to its own body" do
    Player.new.one.should == 1
  end
  
end