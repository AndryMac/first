puts "Укажите число"
day = gets.chomp.to_i

puts "Укажите месяц (цифрой)"
month = gets.chomp.to_i

puts "Укажите год"
year = gets.chomp.to_i

months_day = { January: 31, February: 28, March: 31, April: 30, May: 31, June: 30, July: 31, August: 31, September: 30, October: 31, November: 30, December: 31 }


months_day[:February] += 1 if (year % 4 == 0) && (year % 100 != 0)|| (year % 400 == 0)

if month == 1
  puts "Сегодня #{day} день/дней с начала года"
else
  days_in_months = months_day.values.take(month - 1)
  total_days = days_in_months.push(day).inject(:+)
  puts "Сегодня #{total_days} день/дней с начала года"
end

