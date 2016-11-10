letters = ("a".."z").to_a
vowels = %w(a e i o u)
sample = vowels.each_with_object({}) { |letter, hash| hash[letter] = letters.index(letter) + 1 }
puts sample



