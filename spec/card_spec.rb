require File.dirname(__FILE__) + '/spec_helper'
describe "Card" do
  
  it "can get the value of a card" do
    [2, 3, 4, 5, 6, 7, 8, 9, 10].each do |face|
      Card.new(face, :spades).value.should == face
    end
    
    ['J', 'Q', 'K'].each do |face|
      Card.new(face, :spades).value.should == 10
    end
    
    Card.new('A', :spaces).value.should == 11
    
  end

  it "can tell if a card is face up" do
    2.up.length.should be 2
    2.up.first.should be_kind_of(UndealtCard)
  end
  
end