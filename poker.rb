class Deck

# Generating a card deck
  public
  def deck_generator
    suits = ['H', 'D', 'C', 'S']
    values = ['2', '3', '4', '5', '6', '7', '8', '9', 'T', 'J', 'Q', 'K', 'A']
    my_deck = Array.new(suits.length).map!{Array.new(values.length)}
    my_deck.each_index { |i|
        my_deck[i].each_index {|j|
          my_deck[i][j] = suits[i] + values[j]
        }
    }
    return my_deck
  end

# Deal random card
  def random_card_deal
    @deck = self.deck_generator
    a = @deck[rand(@deck.size)][rand(@deck[0].size)]
    return a
  end
end

alpha = Deck.new
print alpha.random_card_deal