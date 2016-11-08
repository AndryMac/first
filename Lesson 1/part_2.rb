puts "Укажите основание треугольника"
base = gets.chomp.to_i
puts "Укажите высоту треугольника"
height = gets.chomp.to_i
area = 0.5*base*height
puts "Площадь треугольника #{area}"