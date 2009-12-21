require File.expand_path(File.join(File.dirname(__FILE__), "../../", "cawd"))

Given /^the rules for 'blackjack'$/ do
  GameFactory.load 'blackjack'
  @blackjack = Blackjack.new
end

When /^round 1 is executed$/ do 
  @blackjack.next_round
end

Then /^each player has '(n*)' card face '(w*)'$/ do |card_status|
  pending # express the regexp above with the code you wish you had
end

Then /^each player has '1' card face 'down'$/ do
  pending # express the regexp above with the code you wish you had
end
