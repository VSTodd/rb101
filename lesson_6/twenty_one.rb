CLUB = '♣'
DIAMOND = '♦'
HEART = '♥'
SPADE = '♠'

FULL_DECK = [[CLUB, 2], [CLUB, 3], [CLUB, 4], [CLUB, 5], [CLUB, 6], [CLUB, 7],
             [CLUB, 8], [CLUB, 9], [CLUB, 10], [CLUB, 'J'], [CLUB, 'Q'],
             [CLUB, 'K'], [CLUB, 'A'], [DIAMOND, 2], [DIAMOND, 3], [DIAMOND, 4],
             [DIAMOND, 5], [DIAMOND, 6], [DIAMOND, 7], [DIAMOND, 8],
             [DIAMOND, 9], [DIAMOND, 10], [DIAMOND, 'J'], [DIAMOND, 'Q'],
             [DIAMOND, 'K'], [DIAMOND, 'A'], [HEART, 2], [HEART, 3], [HEART, 4],
             [HEART, 5], [HEART, 6], [HEART, 7], [HEART, 8], [HEART, 9],
             [HEART, 10], [HEART, 'J'], [HEART, 'Q'], [HEART, 'K'],
             [HEART, 'A'], [SPADE, 2], [SPADE, 3], [SPADE, 4], [SPADE, 5],
             [SPADE, 6], [SPADE, 7], [SPADE, 8], [SPADE, 9], [SPADE, 10],
             [SPADE, 'J'], [SPADE, 'Q'], [SPADE, 'K'], [SPADE, 'A']]

def prompt(msg)
  puts ">> #{msg}"
end

def hold_prompt(msg)
  puts ">> #{msg}"
  sleep(3)
end

def deal(player, dealer, deck)
  2.times do
    hit(player, deck)
    hit(dealer, deck)
  end
end

def hit(hand, deck)
  hand << deck.sample
  deck.delete(hand[-1])
end

def total(hand)
  total_num = 0
  hand_numeric = hand_values(hand)
  hand_numeric.each { |card| total_num += card }
  hand.select { |card| card[1] == 'A' }.count.times do
    total_num -= 10 if total_num > 21
  end
  total_num
end

def hand_values(hand)
  new_array = []
  hand.each do |card|
    new_array << if 'K Q J'.include? card[1].to_s
                   10
                 elsif card[1] == 'A'
                   11
                 else
                   card[1]
                 end
  end
  new_array
end

def view_hands(dl, pl)
  prompt "Dealer has: an unknown card #{joinand(suits_and_nums(dl.drop(1)))}."
  prompt "You have: #{joinand(suits_and_nums(pl))}"
  puts ""
end

def view_hand_totals(dl, pl)
  puts ""
  prompt "Dealer has: #{joinand(suits_and_nums(dl))}"
  hold_prompt "Dealer total is #{total(dl)}."
  puts ""
  prompt "You have: #{joinand(suits_and_nums(pl))}"
  hold_prompt "Your total is #{total(pl)}."
  puts ""
end

def no_suits(hand)
  hand.map { |value| value[1] }
end

def suits_and_nums(hand)
  arr = []
  hand.each { |card| arr << card.reverse.join }
  arr
end

def joinand(array)
  if array.length == 2
    array[0].to_s + ' and ' + array[1].to_s
  else
    array[-1] = "and #{array.last}"
    array.join(', ')
  end
end

def bust(ph)
  return true if total(ph) > 21
end

def player_turn(player_hand, dealer_hand, deck)
  loop do
    system 'clear'
    view_hands(dealer_hand, player_hand)
    choice = validate_entry
    break if choice
    hit(player_hand, deck)
    hold_prompt "You drew #{player_hand[-1].reverse.join}"

    if bust(player_hand)
      system 'clear'
      prompt "You busted with a total of #{total(player_hand)}."
      hold_prompt "Dealer wins!"
      break
    end
  end
end

def validate_entry
  answer = nil
  loop do
    prompt "Hit or stay?"
    answer = gets.chomp
    break if answer.downcase.start_with?('s', 'h')
  end
  answer.downcase.start_with?('s') ? true : false
end

def dealer_turn(player_hand, dealer_hand, deck)
  loop do
    break if bust(player_hand) || total(dealer_hand) >= 17
    system 'clear'
    view_hands(dealer_hand, player_hand)
    hit(dealer_hand, deck)
    hold_prompt "The dealer drew #{dealer_hand[-1].reverse.join}"
    if bust(dealer_hand)
      system 'clear'
      prompt "The dealer busted with a total of #{total(dealer_hand)}."
      hold_prompt "You win!"
      break
    end
  end
end

def tally_up(player_hand, dealer_hand)
  system 'clear'
  hold_prompt("The dealer stays.")
  view_hand_totals(dealer_hand, player_hand)
  system 'clear'
  if total(dealer_hand) > total(player_hand)
    hold_prompt "You lose, the dealer wins!"
  elsif total(dealer_hand) < total(player_hand)
    hold_prompt "You win!"
  else
    hold_prompt "It's a draw!"
  end
end

deck = FULL_DECK

player_hand = []
dealer_hand = []

deal(player_hand, dealer_hand, deck)

player_turn(player_hand, dealer_hand, deck)
dealer_turn(player_hand, dealer_hand, deck)
tally_up(player_hand, dealer_hand) unless
  bust(player_hand) || bust(dealer_hand)
