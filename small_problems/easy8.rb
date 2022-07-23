# Sum of Sums
def sum_of_sums(array)
  sum = 0
  array.each_index do |index|
    counter = index
    loop do 
      sum += array[counter]
      counter -= 1
      break if counter < 0
    end 
  end 
  sum 
end 

# Madlibs
print "Enter an adjective: "
adjective = gets.chomp!
print "Enter a noun: "
noun1 = gets.chomp!
print "Enter an adverb: "
adverb = gets.chomp!
print "Enter a verb: "
verb = gets.chomp!
print "Enter a noun: "
noun2 = gets.chomp!

puts "Help! My #{adjective} #{noun1} #{adverb} #{verb}ed into a #{noun2}!"

# Leading Substrings
def leading_substrings(string)
  substrings = []
  characters = string.chars
  characters.each_index do |index|
    letters = characters[0..index]
    substrings << letters.join
  end 
  substrings
end 

# All Substrings
def substrings(string)
  total_substrings = []
  loop do 
    total_substrings << leading_substrings(string)
    string.delete_prefix! (string[0])
    break if string == ''
  end 
  total_substrings.flatten
end

# Palindromic Substrings
def palindromes(string)
  strings = substrings(string)
  strings.delete_if {|substring| substring.length == 1}
  palindrome = []
  strings.each do |substring| 
    palindrome << substring if substring == substring.reverse
  end 
  p palindrome 
end 

# fizzbuzz
def fizzbuzz(a,b)
  fizzbuzzed = []
  (a..b).each do |num|
    case 
    when num % 3 == 0 && num % 5 != 0
      fizzbuzzed << 'Fizz'
    when num % 5 == 0 && num % 3 != 0
      fizzbuzzed << 'Buzz'
    when num % 3 == 0 && num % 5 == 0
      fizzbuzzed << 'FizzBuzz'
    else 
      fizzbuzzed << num
    end 
  end 
  puts fizzbuzzed.join(", ")
end 

# Double Char (Part 1)
def repeater(string)
  doubled = ''
  string.each_char {|char| doubled << char << char}
  doubled
end

# Double Char (Part 2)
def double_consonants(string)
  doubled = ''
  consonants = 'bcdfghjklmnpqrstvwxyz'
  string.each_char do |char| 
    doubled << char if consonants.include? char.downcase
    doubled << char 
  end
  doubled
end

# Reverse the Digits In a Number
def reversed_number(num)
  num.to_s.reverse.to_i
end 

# Get The Middle Character
def center_of(string)
  if string.length.odd?
    return string[(string.length/2)]
  else 
    return string[((string.length/2) - 1)..(string.length/2)]
  end 
end 