puts "Как вас зовут?"
name = gets.chomp
puts "Какой у вас рост?"
height = gets.chomp.to_i
weight = height - 110

if weight < 0
  puts "#{name}, Ваш вес уже оптимальный"
else
  puts "#{name}, Ваш идеальный вес #{weight} кг."
end