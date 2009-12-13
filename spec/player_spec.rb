require File.dirname(__FILE__) + '/spec_helper'

describe Player, "when updating it with the dsl" do
    
  it "can add methods to its own body" do
    Player.add_action :one  do 1; end
    Player.new.one.should equal 1
  end
  
end