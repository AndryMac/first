puts "Укажите число"
day = gets.chomp.to_i

puts "Укажите месяц (цифрой)"
month = gets.chomp.to_i

puts "Укажите год"
year = gets.chomp.to_i

months_day = { January: 31, February: 28, March: 31, April: 30, May: 31, June: 30, July: 31, August: 31, September: 30, October: 31, November: 30, December: 31 }

leap_year = months_day[:February] + 1
not_leap_year = months_day[:February]

if (year % 4 == 0) && (year % 100 == 0) && (year % 400 == 0)
  months_day[:February] = leap_year
elsif (year % 4 == 0) && (year % 100 == 0)
  not_leap_year
elsif year % 4 == 0
  months_day[:February] = leap_year
else
  not_leap_year
end

if month == 1
  puts "Сегодня #{day} день/дней с начала года"
else
  how_days = months_day.map{ |month, day| day}[0..(month - 2)].inject(0) { |sum, day| sum + day } + day
  puts "Сегодня #{how_days} день/дней с начала года"
end