shop_list = {}
id = 1
loop do

  puts "Введите название товара"
  item_name = gets.chomp

  break if item_name == "стоп"

  puts "Укажите цену за единицу товара"
  item_price = gets.chomp.to_f

  puts "Укажите количество товара"
  item_count = gets.chomp.to_f

  shop_list[id] = { name: item_name, price: item_price, count: item_count}

  id +=  1

end
all_price = []

shop_list.each {|id, val| puts "Сумма за #{id} - #{val[:name]}: #{val[:price] * val[:count]}"
  all_price << val[:price] * val[:count]
}
total = all_price.inject(0) { |sum, price| sum + price }

puts "Итого потрачено #{total}"
