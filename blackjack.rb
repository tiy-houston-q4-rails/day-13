class Hand

  attr_reader :cards

  def initialize
    @cards = []
  end

  def new_card(card)
    @cards << card
  end

  def value
    # sum all of the cards' value
    total = 0
    @cards.each do |card|
      total += card.value
    end
    total

  end
end

class Card
  attr_reader :suit, :value, :name

  def initialize(suit, value)
    @suit = suit
    @name = value

    if ["J", "Q", "K"].include? value
      @value = 10
    elsif value == "A"
      @value = 11
    else
      @value = value
    end

  end

  def to_s
    [name, suit].join("-")
  end
end


class Deck

  def initialize

    @cards = []

    # create 52 cards
    %i(hearts clubs diamonds spades).each do |suit|
      (2..10).each do |value|
        @cards << Card.new(suit, value)
      end
      ["J", "Q", "K", "A"].each do |facecard|
        @cards << Card.new(suit, facecard)
      end
    end
    # shuffle they
    @cards.shuffle!
  end

  def deal
    @cards.shift
  end
end

class Game

  attr_reader :dealer_hand, :player_hand, :deck

  def setup
    @dealer_hand = Hand.new
    @player_hand = Hand.new

    @deck = Deck.new

    2.times do
      player_hand.new_card(deck.deal)
      dealer_hand.new_card(deck.deal)
    end
  end

  def run_loop
    puts "Welcome to Blackjack"
    continue_to_play = true

    while continue_to_play
      puts "Dealer Card: #{dealer_hand.cards.first}"
      puts "Your Cards: #{player_hand.cards.join(" - ")}"
      puts "Hit or stay? (h/s)"
      command = gets.chomp
      if command == "h"
        player_hand.new_card(deck.deal)
      else
        puts "YOU STAY! WIMP!"
        continue_to_play = false
      end

      if player_hand.value > 21
        continue_to_play = false
      end


    end

    while dealer_hand.value <= 16
      dealer_hand.new_card(deck.deal)
    end
  end

  def determine_winner
    puts "-------------------"
    puts "Your cards: #{player_hand.cards.join(" - ")} BOOM #{player_hand.value}"
    puts "Dealer cards: #{dealer_hand.cards.join(" - ")} BOOM #{dealer_hand.value}"


    if player_hand.value > dealer_hand.value && player_hand.value <= 21
      puts "you win. WINNER WINNER CHICKEN DINNER"
    elsif player_hand.value == dealer_hand.value
      puts "PUSH"
    elsif dealer_hand.value > 21
      puts "you win. WINNER WINNER CHICKEN DINNER"
    else
      puts "dealer wins"
    end
  end

  def play

    setup
    run_loop
    determine_winner

  end
end


Game.new.play
