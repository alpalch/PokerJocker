require_relative 'Constants'

#  Убираем масти карт, оставляя только достоинства карт
def delete_suits(cards)
  @cards = cards
  @cards.each_index do |i|
    @cards[i] = @cards[i][1].chr
  end
end

# Замена карт в массиве на их вес
def value_array(cards)
  @cards = cards
  @cards.each_index do |i|
    if @cards[i] == 'A'
      @cards.push(1) # In Straight ace can be like 14 or 1
      @cards[i] = $cards_values[@cards[i]]
    else
      @cards[i] = $cards_values[@cards[i]]
    end
  end
  @cards.sort!.reverse!
end


# Sort cards by suits and return array with size 5 and more
def sort_by_suit(cards)
  @cards = cards
  @multi_suit_array = Array.new # An Array that will contains all suits arrays
  @hearts_suit = Array.new
  @clubs_suit = Array.new
  @spikes_suit = Array.new
  @diamonds_suit = Array.new
  @cards.each do |i| # Sort cards by suit
    if i[0].chr == 'C'
      @clubs_suit.push(i)
    elsif i[0].chr == 'D'
      @diamonds_suit.push(i)
    elsif i[0].chr == 'H'
      @hearts_suit.push(i)
    elsif i[0].chr == 'S'
      @spikes_suit.push(i)
    end
  end
  @multi_suit_array.push(@clubs_suit)
  @multi_suit_array.push(@diamonds_suit)
  @multi_suit_array.push(@hearts_suit)
  @multi_suit_array.push(@spikes_suit)
  @multi_suit_array.each do |i|
    if i.size >= 5
      return i
    end
    return []
  end
end

def inspect_combos_by_suit(cards)
  @cards = sort_by_suit(cards)
  if @cards.size > 5
    delete_suits(@cards)
    value_array(@cards)
    if @cards[0] == 14 && @cards[4] == 10 # If first card in sorted by value array is 'ace' and 5th is 'ten'
      puts 'Flush Royal'
    else
      if @cards[0] - @cards[4] == 4 # If diff between first and the 5th cards is 4 it is a 'Straight Flush'
        print 'Straight Flush'
      else
        print 'Flush' # Else it is a 'Flush', cause @cards array contains 5 cards with similar suit
      end
    end
  end
end


def cards_values_inspect(cards)
  @cards = cards
  delete_suits(@cards)
  # Хеш, в котоый посчитаем сколько карт каждого достоинства выпало
  @values_count = Hash.new
  @cards.each_index do |i|
    if @values_count.has_key?(@cards[i])
      next
    else
      @values_count[@cards[i]] = @cards.count(@cards[i])
    end
  end
  @values_count = @values_count.values
  if @values_count.count(4) > 0
    'Kind of four'
  elsif @values_count.count(3) > 0 && @values_count.count(2) > 0
    'Full House'
  elsif @values_count.count(3) > 0
    'Three of a kind'
  elsif @values_count.count(2) > 1
    'Two pairs'
  elsif @values_count.count(2) > 0
    'Pair'
  else
    'High card'
  end
end

# Straight inspection
def straight_inspect(cards)
  @cards = Array.new
  cards.each { |i| @cards.push(i) }
  delete_suits(@cards)
  value_array(@cards)
  @cards.each_index do |i| # Стрит не может быть длиной меньше 5 карт
    if i + 4 == @cards.size
      break
    end
    if @cards[i] - @cards[i + 4] == 4
      'Straight'
    end
  end
end
