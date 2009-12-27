require File.expand_path(File.join(File.dirname(__FILE__), "../../", "cawd"))

Given /^the rules for 'blackjack'$/ do
  GameFactory.load 'blackjack'
  @blackjack = Blackjack.new
end

When /^round 1 is executed$/ do
  @blackjack.next_round
end
Then /^each player has "([^\"]*)" cards face "([^\"]*)"$/ do |card_number, card_state|
  count = 0 
  @blackjack.players.each do |player|
    player.cards.each do |card|
      count = count+1 if (card.state = card_state.to_sym)
    end
  end
  count.should == card_number.to_i
end


When /^the dealer has "([^\"]*)" cards face "([^\"]*)"$/ do |card_number, card_status|
  matching_cards = @blackjack.dealer.cards.select {|c| c.state == card_status.to_sym}
  matching_cards.count.should == card_number.to_i
end

When /^"([^\"]*)" player is added$/ do |player_count|
  player_count.to_i.times do
    @blackjack.players << Player.new
  end
end