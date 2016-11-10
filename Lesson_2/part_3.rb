array = []
loop do
  if array.empty?
    array << 1
  end
  last = array[-1].to_i
  pre_last = array[-2].to_i
  array << (last + pre_last)
  if array[-1] > 100
    array.delete_at(-1)
  end
  break if (last + pre_last) > 100
end
puts array