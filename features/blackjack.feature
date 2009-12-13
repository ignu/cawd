Feature: Blackjack rules
  In order to play a game of blackjack
  As a player
  I want the game dsl to be followed
Scenario: Play Blackjack
Given the rules for 'blackjack'
When round 1 is executed
Then each player has '1' card face 'up'
And each player has '1' card face 'down'