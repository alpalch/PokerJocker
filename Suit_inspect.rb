cards = ["SQ", "HQ", "DQ", "CQ", "D4", "S9", "DA"]

$cards_values = {
    '2' => 2,
    '3' => 3,
    '4' => 4,
    '5' => 5,
    '6' => 6,
    '7' => 7,
    '8' => 8,
    '9' => 9,
    'T' => 10,
    'J' => 11,
    'Q' => 12,
    'K' => 13,
    'A' => 14
}
$count = 0
$clubs_suit = []
$diamonds_suit = []
$hearts_suit = []
$spikes_suit = []
# Flush royal investigation


cards.each do |i| # Отсортировать карты по масти
  if i[0].chr == 'C'
    $clubs_suit.push(i)
  elsif i[0].chr == 'D'
    $diamonds_suit.push(i)
  elsif i[0].chr == 'H'
    $hearts_suit.push(i)
  elsif i[0].chr == 'S'
    $spikes_suit.push(i)
  end
end


if $clubs_suit.size >= 5
  # И встречаються T, J, Q, K, A одной масти, то это Флеш Рояль
  $clubs_suit.each do |i|
    if i[1].chr == 'T'
      $count += 1
    elsif i[1].chr == 'J'
      $count += 1
    elsif i[1].chr == 'Q'
      $count += 1
    elsif i[1].chr == 'K'
      $count += 1
    elsif i[1].chr == 'A'
      $count += 1
    end
  end
  if $count == 5
    print 'Flush Royal'
  end

# Заменить карты их весом из хеша "Вес карты" и отсортировать его по возрастанию
  $clubs_suit.each_index do |i|
    $clubs_suit[i] = $cards_values[$clubs_suit[i][1].chr]
  end
  $clubs_suit.sort!.reverse! # Обратить массив, что бы с ним было удобней работать
# Стрит будет тогда и только тогда, когда разница между старшим и младшим элиментом стрита равна "4"
  while $clubs_suit.size >= 5 # Проверка на Стрит Флеш. Если размер массива масли меньше 5, это не может быть стрит флеш
    if $clubs_suit[-5] - $clubs_suit[-1] == 4
      print 'Straight Flush'
      break
    else
      $clubs_suit.pop
    end
  end
# В том случае если проверка на стрит флеш провалилась, то это может быть только флеш,
#  потому что данный метод выполняеться только если кол-во карт одной масти 5 и больше
  if $clubs_suit.size < 5
    print 'Flush'
  end
elsif $diamonds_suit.size >= 5 # Если количесво масти больше или равно 5
  # И встречаються T, J, Q, K, A одной масти, то это Флеш Рояль
  $diamonds_suit.each do |i|
    if i[1].chr == 'T'
      $count += 1
    elsif i[1].chr == 'J'
      $count += 1
    elsif i[1].chr == 'Q'
      $count += 1
    elsif i[1].chr == 'K'
      $count += 1
    elsif i[1].chr == 'A'
      $count += 1
    end
  end
  if $count == 5
    print 'Flush Royal'
  end

# Заменить карты их весом из хеша "Вес карты" и отсортировать его по возрастанию
  $diamonds_suit.each_index do |i|
    $diamonds_suit[i] = $cards_values[$diamonds_suit[i][1].chr]
  end
  $diamonds_suit.sort!.reverse! # Обратить массив, что бы с ним было удобней работать
  # Стрит будет тогда и только тогда, когда разница между старшим и младшим элиментом стрита равна "4"
  while $diamonds_suit.size >= 5 # Проверка на Стрит Флеш. Если размер массива масли меньше 5, это не может быть стрит флеш
    if $diamonds_suit[-5] - $diamonds_suit[-1] == 4
      print 'Straight Flush'
      break
    else
      $diamonds_suit.pop
    end
  end
  # В том случае если проверка на стрит флеш провалилась, то это может быть только флеш,
  #  потому что данный метод выполняеться только если кол-во карт одной масти 5 и больше
  if $diamonds_suit.size < 5
    print 'Flush'
  end
elsif $hearts_suit.size >= 5
  $hearts_suit.each do |i|
    if i[1].chr == 'T'
      $count += 1
    elsif i[1].chr == 'J'
      $count += 1
    elsif i[1].chr == 'Q'
      $count += 1
    elsif i[1].chr == 'K'
      $count += 1
    elsif i[1].chr == 'A'
      $count += 1
    end
  end
  if $count == 5
    print 'Flush Royal'
  end
  $hearts_suit.each_index do |i|
    $hearts_suit[i] = $cards_values[$hearts_suit[i][1].chr]
  end
  $hearts_suit.sort!.reverse!
  while $hearts_suit.size >= 5 # Проверка на Стрит Флеш
    if $hearts_suit[-5] - $hearts_suit[-1] == 4
      print 'Straight Flush'
      break
    else
      $hearts_suit.pop
    end
  end
  if $hearts_suit.size < 5
    print 'Flush'
  end
elsif $spikes_suit.size >= 5
  $spikes_suit.each do |i|
    if i[1].chr == 'T'
      $count += 1
    elsif i[1].chr == 'J'
      $count += 1
    elsif i[1].chr == 'Q'
      $count += 1
    elsif i[1].chr == 'K'
      $count += 1
    elsif i[1].chr == 'A'
      $count += 1
    end
  end
  if $count == 5
    print 'Flush Royal'
  end
  $spikes_suit.each_index do |i|
    $spikes_suit[i] = $cards_values[$spikes_suit[i][1].chr]
  end
  $spikes_suit.sort!.reverse!
  while $spikes_suit.size >= 5 # Проверка на Стрит Флеш
    if $spikes_suit[-5] - $spikes_suit[-1] == 4
      print 'Straight Flush'
      break
    else
      $spikes_suit.pop
    end
  end
  if $spikes_suit.size < 5
    print 'Flush'
  end
end
