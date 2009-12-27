Feature: Blackjack rules
  In order to play a game of blackjack
  As a player
  I want the game dsl to be followed
Scenario: Play Blackjack
Given the rules for 'blackjack'
When "1" player is added
And round 1 is executed
Then each player has "2" cards face "up"
And the dealer has "1" cards face "up"
And the dealer has "1" cards face "down"