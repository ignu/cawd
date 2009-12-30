require File.expand_path(File.join(File.dirname(__FILE__), "../../", "cawd"))

Given /^the rules for 'blackjack'$/ do
  GameFactory.load 'blackjack'
  @blackjack = Blackjack.new
end

When /^the next round is executed$/ do
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

Then /^the first player is prompted to act$/ do
  @blackjack.action_on.should == @last_player
end

When /^"([^\"]*)" player is added with "([^\"]*)" dollars$/ do |player_count, dollars|
  player_count.to_i.times do
    @last_player = Player.new
    @last_player.stack = dollars
    @blackjack.players << @last_player
  end
end