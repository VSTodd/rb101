# Repeat Yourself
def repeat(string, integer)
  integer.times do
    puts string
  end
end

repeat('Hello', 3)

# Odd
def is_odd?(num)
  num % 2 != 0
end

# List of Digits
def digit_list(int)
  array = []
  counter = 0
  int = int.to_s
  loop do
    array << int[counter].to_i
    counter += 1
    break if counter >= int.length
  end
  array
end

#How Many?
def count_occurrences(arr)
	hash = {}
	arr.each do |x|
    hash[x] = arr.count(x)
	end
	
  hash.each do |k,v|
    puts "#{k} => #{v}" 
  end
end

# Reverse It (Part 1)
def reverse_sentence(sentence)
  sentence.split.reverse.join(" ")
end

# Reverse It (Part 2)
def reverse_words(sentence)
  sentence = sentence.split
  
  sentence.each do |word|
    word.reverse! if word.length >= 5&nbsp;
  end
  sentence.join(' ')
end

# Stringy Strings
def stringy(int)
  string = ""
  counter = 0

  loop do
    if counter.odd?
      string << '0'
    else
      string << '1'
    end

    counter += 1
    break if counter >= int
  end

  string
end

# Array Average
def average(arr)
  sum = 0
  arr.each {|num| sum += num}
  sum / arr.length
end

# Sum of Digits
def sum(num)
  total = 0
  num.to_s.split(//).each {|x| total += x.to_i}
  total
end

# What's my Bonus?
def calculate_bonus(salary, boolean)
  if boolean
    return salary / 2
  else 
    return 0
  end
end