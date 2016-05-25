load 'Suit_inspect.rb'

cards = ["SJ", "HQ", "DK", "C4", "D3", "S5", "DA"]



#  Убираем масти карт, оставляя только достоинства карт
def delete_suits(cards)
  @cards = cards
  @cards.each_index do |i|
    @cards[i] = @cards[i][1].chr
  end
end




def cards_values_inspect(cards)
  @cards = cards
  delete_suits(@cards)
  # Хеш, в котоый посчитаем сколько карт каждого достоинства выпало
  @values_count = {}
  @cards.each do |i|
    if @values_count.has_key?(i)
      next
    else
      @values_count.store(i, @cards.count(i))
    end
  end
  @values_count = @values_count.values
  if @values_count.count(4) > 0
    print 'Kind of four'
  elsif @values_count.count(3) > 0 && @values_count.count(2) > 0
    print 'Full House'
  elsif @values_count.count(3) > 0
    print 'Three of a kind'
  elsif @values_count.count(2) >1
    print 'Two pairs'
  elsif @values_count.count(2) > 0
    print 'Pair'
  else
    print 'High card'
  end
end

# caret_inspect(cards)
# three_of_a_kind_inspect(cards)
# pair_inspect(cards)
# print delete_suits(cards)
cards_values_inspect(cards)
