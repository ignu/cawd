require File.expand_path(File.join(File.dirname(__FILE__), "../../", "cawd"))

Given /^the rules for 'blackjack'$/ do
  @blackjack = Game.load 'blackjack'
end

When /^round '(n*)' is executed$/ do |round_number|
  puts round_number
#  @blackjack.Dealer.deal
end

Then /^each player has '(n*)' card face '(w*)'$/ do |card_status|
  pending # express the regexp above with the code you wish you had
end

Then /^each player has '1' card face 'down'$/ do
  pending # express the regexp above with the code you wish you had
end
