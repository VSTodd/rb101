# Welcome Stranger
def greetings(array, hash)
  name = array.join(" ")
  occupation = hash[:title] + ' ' + hash[:occupation]
  puts "Hello #{name}! It's nice to have a #{occupation} around."
end 

# Double Doubles
def twice(num)
  string_num = num.to_s
  half_length = (string_num.length)/2
  if string_num.length == 1
    return num * 2
  elsif string_num[0..(half_length - 1)] == string_num [half_length..-1]
    return num
  else
    return num * 2
  end 
end

# Always Return Negative
def negative(num)
  num > 0 ? -num : num 
end 

# Counting Up
def sequence(num)
  array = []
  (1..num).each {|x| array << x} 
  array
end 

# Uppercase Check
def uppercase?(string)
  string == string.upcase ? true : false 
end 

# How long are you?
def word_lengths(string)
  words = string.split
  words.map {|word| word = word + " " + word.length.to_s}
end 
  
# Name Swapping
def swap_name(name)
  name = name.split
  "#{name[1]}, #{name[0]}"
end 

# Sequence Count
def sequence(count, num)
  array = []
  counter = num
  count.times do
    array << counter
    counter += num
  end
  array
end
  
# Grade Book
def get_grade(x, y, z)
  grade = (x + y + z)/3
  case grade
  when 90..100
    return 'A'
  when 80..89
    return 'B'
  when 70..79
    return 'C'
  when 60..69
    return 'D'
  else
    return 'F'
  end
end

# Grocery List
def buy_fruit(array)
  groceries = []
  array.each do |item|
    item[1].times {groceries << item[0]}
  end 
  groceries
end 

# Group Anagrams
def anagram(array)
  words = []
  array.each do |word|
    anagrams = []
    array.each do |comparison| 
      anagrams << comparison if word.chars.sort == comparison.chars.sort
    end
    words << anagrams.sort
  end 
  words.sort.uniq.each {|subarray| p subarray}
end 