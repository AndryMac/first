shop_list = {}
loop do

  puts "Введите название товара"
  item_name = gets.chomp

  break if item_name == "стоп"

  puts "Укажите цену за единицу товара"
  item_price = gets.chomp.to_f

  puts "Укажите количество товара"
  item_count = gets.chomp.to_f

  shop_list[item_name] = { price: item_price, count: item_count}

end

all_price = []

shop_list.each {|name, val| puts "Сумма за #{name}: #{val[:price] * val[:count]}"
  all_price << val[:price] * val[:count]
}
total = all_price.inject(0) { |sum, price| sum + price }
puts "Итого потрачено #{total}"