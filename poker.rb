class Deck

# Generating a card deck
  public
  def deck_generator
    suits = ['H', 'D', 'C', 'S']
    values = ['2', '3', '4', '5', '6', '7', '8', '9', 'T', 'J', 'Q', 'K', 'A']
    my_deck1 = Array.new(suits.length).map!{Array.new(values.length)}
    my_deck1.each_index { |i|
        my_deck1[i].each_index {|j|
          my_deck1[i][j] = suits[i] + values[j]
        }
    }
    my_deck = Array.new
    my_deck1.each_index {|i|
      my_deck1[i].each_index {|j|
        my_deck.push(my_deck1[i][j])
      }
    }
    my_deck
  end

  def deck_init
    $deck = self.deck_generator
  end

# Deal random card
  def random_card_deal
    @a = $deck[rand($deck.size)]
    $deck.delete(@a)
    @a
  end

# Deal two cards in player`s hand
  def hand_deal
    hand = []
    2.times do
      @card = self.random_card_deal
      hand.push(@card)
    end
    hand
  end

# Public cards deal
  def public_deal
    public_cards = []
    5.times do
      @card = self.random_card_deal
      public_cards.push(self.random_card_deal)
    end
    public_cards
  end

# All card on the desk
  def desk_cards
    desk = []
    self.public_deal.each do |i|
      desk.push(i)
    end
    self.hand_deal.each do |i|
      desk.push(i)
    end
    desk
  end
end

alpha = Deck.new
alpha.deck_init
# print alpha.random_card_deal(4)
# print alpha.hand_deal
# print alpha.public_deal
# print alpha.deck_generator
print alpha.desk_cards
