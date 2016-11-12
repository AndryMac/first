array = [1]
loop do
  array << array[-1] if array.length == 1
  array << (array[-1] + array[-2])
  break if (array[-1] + array[-2]) > 100
end
puts array