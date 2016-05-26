# Main file

require_relative 'Constants'
require_relative 'Inspection'
require_relative 'Cards_generating'

def poker
    $cards = Deck.new
    $cards.deck_init
    $cards = $cards.desk_cards
    inspect_combos_by_suit($cards)
  unless inspect_combos_by_suit($cards)
    print straight_inspect($cards)
  end
  unless straight_inspect($cards)
    print cards_values_inspect($cards)
  end
end

poker