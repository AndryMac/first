puts "Укажите одну сторону треугольника"
a = gets.chomp.to_i
puts "Укажите второую сторону треугольника"
b = gets.chomp.to_i
puts "Укажите третью сторону треугольника"
c = gets.chomp.to_i

if a <= 0 || b <=0 || c <= 0
  puts "Вашего треугольника не существует"
end

if a > b && a > c
  hypo = a
  catet_1 = b
  catet_2 = c
elsif
  b > a && b > c
  hypo = b
  catet_1 = a
  catet_2 = c
else
  hypo = c
  catet_1 = a
  catet_2 = b
end

if catet_1**2 + catet_2**2 == hypo**2
  puts "Треугольник прямоугольный"
end

if a == b || a == c || b == c
  puts "Треугольник равнобедренный"
end

if a == b && a == c
  puts "Треугольник равносторонний"
end