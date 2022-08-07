require 'pry'

CLUB = '♣'
DIAMOND = '♦'
HEART = '♥'
SPADE = '♠'

HIT_NUM = 17
END_NUM = 21

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
  sleep(4)
end

# rubocop:disable Lint/ImplicitStringConcatenation
def title
  puts '  _______                 _                 ____             '
  puts ' |__   __|               | |               / __ \            '
  puts '    | |_      _____ _ __ | |_ _   _ ______| |  | |_ __   ___ '
  puts '    | \ \ /\ / / _ \ '' _ \| __| | | |______| |  | | '' _ \ / _ \ '
  puts '    | |\ V  V /  __/ | | | |_| |_| |      | |__| | | | |  __/'
  puts '    |_| \_/\_/ \___|_| |_|\__|\__, |       \____/|_| |_|\___|'
  puts '                               __/ |                         '
  puts '                              |___/                          '
end

def won
  puts '██    ██  ██████  ██    ██     ██     ██  ██████  ███    ██ ██ '
  puts ' ██  ██  ██    ██ ██    ██     ██     ██ ██    ██ ████   ██ ██ '
  puts '  ████   ██    ██ ██    ██     ██  █  ██ ██    ██ ██ ██  ██ ██ '
  puts '   ██    ██    ██ ██    ██     ██ ███ ██ ██    ██ ██  ██ ██    '
  puts '   ██     ██████   ██████       ███ ███   ██████  ██   ████ ██ '
end

def lost
  puts '██    ██  ██████  ██    ██     ██       ██████  ███████ ████████      '
  puts ' ██  ██  ██    ██ ██    ██     ██      ██    ██ ██         ██         '
  puts '  ████   ██    ██ ██    ██     ██      ██    ██ ███████    ██         '
  puts '   ██    ██    ██ ██    ██     ██      ██    ██      ██    ██         '
  puts '   ██     ██████   ██████      ███████  ██████  ███████    ██  ██ ██ ██'
end
# rubocop:enable Lint/ImplicitStringConcatenation

def instructions
  prompt "Welcome to Twenty-One!"
  prompt "The goal is to get the total of your hand as close to 21 as possible."
  prompt "If you go over 21, it's a 'bust' and you lose."
  prompt "The card values are as follows:"
  puts "          2 - 10: 	        face value"
  puts "          Jack, Queen, King: 	10"
  puts "          Ace:                  11 unless hand is > 21, then it is 1"
  prompt "You and the dealer are initially dealt 2 cards."
  prompt "You can see both of your cards, but can only see one of the dealer's."
  prompt "You will go first, and can decide to either:"
  puts "    'hit' (draw another card) or 'stay' (move on to the dealer's turn)"
  prompt "The game ends if either player busts or when both players stay."
  prompt "Whoever is closer to 21 wins the round! "
  prompt "Matches will be played until a player reaches 5 points."
end

def continue
  sleep(8)
  puts ""
  prompt "Hit enter to continue:"
  gets
  system 'clear'
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
    total_num -= 10 if total_num > END_NUM
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

def view_hands(dl, pl, pt)
  prompt "Dealer has: an unknown card #{joinand(suits_and_nums(dl.drop(1)))}."
  prompt "You have: #{joinand(suits_and_nums(pl))}, for a total of #{pt}."
  puts ""
end

def view_hand_totals(dh, ph, dt, pt)
  puts ""
  prompt "Dealer has: #{joinand(suits_and_nums(dh))}"
  hold_prompt "Dealer total is #{dt}."
  puts ""
  prompt "You have: #{joinand(suits_and_nums(ph))}"
  hold_prompt "Your total is #{pt}."
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

def bust(player_total)
  return true if player_total > END_NUM
end

def player_turn(player_hand, dealer_hand, deck, player_total)
  loop do
    system 'clear'
    view_hands(dealer_hand, player_hand, player_total)
    choice = validate_entry
    break if choice
    hit(player_hand, deck)
    player_total = total(player_hand)
    hold_prompt "You drew #{player_hand[-1].reverse.join}"

    if bust(player_total)
      system 'clear'
      prompt "You busted with a total of #{player_total}."
      hold_prompt "Dealer wins the round!"
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

def dealer_turn(player_hand, dealer_hand, deck, dealer_total, player_total)
  loop do
    break if bust(player_total) || total(dealer_hand) >= HIT_NUM
    system 'clear'
    view_hands(dealer_hand, player_hand, player_total)
    hit(dealer_hand, deck)
    dealer_total = total(dealer_hand)
    hold_prompt "The dealer drew #{dealer_hand[-1].reverse.join}."
    if bust(dealer_total)
      system 'clear'
      prompt "The dealer busted with a total of #{dealer_total}."
      hold_prompt "You win the round!"
      break
    end
  end
end

def tally_up(player_hand, dealer_hand, player_total, dealer_total)
  system 'clear'
  hold_prompt("The dealer stays.")
  view_hand_totals(dealer_hand, player_hand, dealer_total, player_total)
  if dealer_total > player_total
    hold_prompt "The dealer wins the round!"
  elsif dealer_total < player_total
    hold_prompt "You win the round!"
  else
    hold_prompt "It's a draw!"
  end
end

def winner(player_total, dealer_total, player_hand, dealer_hand)
  if bust(player_total)
    :dealer
  elsif bust(dealer_total)
    :player
  else
    tally_up(player_hand, dealer_hand, player_total, dealer_total)
    greater(player_total, dealer_total)
  end
end

def greater(player, dealer)
  if dealer > player
    :dealer
  elsif player > dealer
    :player
  else
    :tie
  end
end

def play_again?
  prompt "Play again? (y or n)"
  answer = gets.chomp
  true unless answer.downcase.start_with?('n')
end

title
instructions
continue

loop do
  player_score = 0
  dealer_score = 0
  champ = nil

  loop do
    deck = []
    FULL_DECK.each { |card| deck << card.dup }

    player_hand = []
    dealer_hand = []

    deal(player_hand, dealer_hand, deck)
    player_total = total(player_hand)
    dealer_total = total(dealer_hand)

    player_turn(player_hand, dealer_hand, deck, player_total)
    player_total = total(player_hand)
    dealer_turn(player_hand, dealer_hand, deck, dealer_total, player_total)
    dealer_total = total(dealer_hand)
    champ = winner(player_total, dealer_total, player_hand, dealer_hand)

    dealer_score += 1 if champ == :dealer
    player_score += 1 if champ == :player

    hold_prompt "The score is player: #{player_score}, dealer: #{dealer_score}"
    break if dealer_score == 5 || player_score == 5
  end
  system 'clear'
  champ == :player ? won : lost
  puts ""
  hold_prompt "The #{champ} won the match!"
  break unless play_again?
end

hold_prompt "Thank you for playing, goodbye!"
