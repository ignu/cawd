dealer.player = false

add_round do
  players.each {|p| p.bet}
  deal players 1.up
  deal dealer 1.down
  deal all 1.up
end

add_round do
  players.each{ |p| p.act }
  dealer.act
end

Player.actions do
  bet do |amount|
    player.pot += amount
  end

  hit do
    deal player 1.up
  end

  double_down do
    bet player.pot
    hit
  end

  split do |s|
    #ugh, this is going to be hard. :(
  end
end

dealer.turn do
  deal dealer 1.up until dealer.hand.total >= 17
end