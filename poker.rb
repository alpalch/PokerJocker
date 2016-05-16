class Deck

# Generating a cart deck
  def deck_generator
    suits = ['H', 'D', 'C', 'S']
    values = ['2', '3', '4', '5', '6', '7', '8', '9', 'T', 'J', 'Q', 'K', 'A']
    my_deck = Array.new(suits.length).map!{Array.new(values.length)}
    my_deck.each_index { |i|
        my_deck[i].each_index {|j|
          my_deck[i][j] = suits[i] + values[j]
        }
    }
  end


  def
end

alpha = Deck.new
alpha.deck_generator
