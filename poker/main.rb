# -- Round 0 ---
# Player A hand:	AD KD
# Player B hand:	AC TD
# Player C hand:	QD QC
#
# Table on flop:	2D 5C 7D
# Table on turn:	2D 5C 7D QH
# Table on river:	2D 5C 7D QH 4D
#
# Player A win:	2D 4D 7D KD AD (flush)


# Round
#
# Player - 2
# Card - 2 in Player
# Card - 5 карт на столе
#
# Winner


class CardGenerator
  FACES = %w[2 3 4 5 6 7 8 9 T J Q K A]
  SUITS = %w[H S D C]

  def self.generate
    cards = []
    SUITS.each do |suit|
      FACES.each do |face|
        cards << Card.new(suit,face)
      end
    end
    cards
  end

end


class Card
  attr_accessor :suit, :face, :active

  def initialize suit,face
    @suit = suit
    @face = face
    @active = false
  end

  def to_s
    "#{face}#{suit}"
  end

  def active?
    @active
  end

end


class Deck
  attr_accessor :cards

  def initialize
   @cards = CardGenerator.generate
  end

end


class Player
  attr_accessor :name
  attr_accessor :cards

  def initialize name
    @name = name
  end

end


class Table
  def self.cards cards
    @@cards = cards
  end

end


class Game
  attr_reader :players
  attr_accessor :table

  def initialize table, *players
    @table = table
    @players = players
  end
end



class Round
  attr_accessor :deck

  def self.deal_cards(number)
    @deck.cards.shuffle!

    cards = []
    @deck.cards.each do |card|
      unless card.active?
        card.active = true
        cards << card
      end
      if cards.length > number then break end
    end
    cards
  end

  def self.table_cards
      deal_cards(4)
  end

  def self.player_cards
    deal_cards(1)
  end

  def self.play(deck, game)
    @deck = deck
    game.players.each do |player|
      player.cards = player_cards
      p player
    end
    game.table = table_cards
    p game.table
    #раздать карты игрокам и разложить на столе карты
  end

end


#Table.cards(['dd','ddd'])


player_a = Player.new('A')
player_b = Player.new('B')
game = Game.new(Table, player_a, player_b)

Round.play(Deck.new,game)


r = [5,9,9,9,9]
#p r.uniq
p [5,5,9,9,9].reject { |i| 5 != i }

r2 = [5,5,9,9,9]
#p r2.uniq