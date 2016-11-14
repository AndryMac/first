array = [1]
loop do
   array << array[-1] if array.length == 1
   next_bum = array[-1] + array[-2]
   break if next_bum > 100
   array << next_bum
end
puts array


