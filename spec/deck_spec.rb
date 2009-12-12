require File.dirname(__FILE__) + '/spec_helper'

describe "Deck" do
  
  it "defaults to a normal 52 card deck" do
    deck = Deck.new
    deck.pile.length.should == 52
    Deck.suits.each do |suit|
      Deck.faces.each do |face|
        found_cards = deck.pile.select {|card| card.face == face and card.suit == suit}
        found_cards.length.should == 1
      end
    end
  end
  
  it "can shuffle the deck" do
    deck = Deck.new
    deck.pile.expects(:shuffle!)
    deck.shuffle!
  end
  
end