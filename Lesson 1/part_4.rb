puts "Укажите коэффициент A"
a = gets.chomp.to_i
puts "Укажите коэффициент B"
b = gets.chomp.to_i
puts "Укажите коэффициент C"
c = gets.chomp.to_i

d = b**2 - 4 * a * c

if d < 0
  puts "Корней нет"
elsif d > 0
  x1 = (-b + Math.sqrt(d)) / 2 * a
  x2 = (-b - Math.sqrt(d)) / 2 * a
  puts "Первй корень #{x1}, второй корень #{x2}"
else
  x1 = -b / 2 * a
  x2 = x1
  puts "Оба корня имеют одинаковое значение #{x1} и #{x2}"
end
