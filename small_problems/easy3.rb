# Searching 101
array = []

puts "==> Enter the 1st number:"
array << gets.to_i

puts "==> Enter the 2nd number:"
array << gets.to_i

puts "==> Enter the 3rd number:"
array << gets.to_i

puts "==> Enter the 4th number:"
array << gets.to_i

puts "==> Enter the 5th number:"
array << gets.to_i

puts "==> Enter the last number:"
last = gets.to_i

if array.include?(last)
  puts "The number #{last} appears in #{array}."
else
  puts "The number #{last} does not appear in #{array}."
end

# Arithmetic Integer
puts "==> Enter the first number"
first = gets.to_i

puts "==> Enter the second number"
second = gets.to_i

addition = first + second
puts "==> #{first} + #{second} = #{addition}"

subtraction = first - second
puts "==> #{first} - #{second} = #{subtraction}" 

product = first * second
puts "==> #{first} * #{second} = #{product}"

quotient = first / second
puts "==> #{first} / #{second} = #{quotient}"

remainder = first % second
puts "==> #{first} % #{second} = #{remainder}"

power = first ** second
puts "==> #{first} ** #{second} = #{power}"

# Counting the Number of Characters
puts "Please write word or multiple words:"

input = gets.chomp!

puts "There are #{input.delete(" ").length} characters in \"#{input}\"."

# Multiplying Two Numbers
def multiply(a,b)
  a*b
end

# Squaring an Argument
def square(c)
  multiply(c,c)
end

# Exclusive Or
def xor?(one,two)
  if (one == true && two == false) || (one == false && two == true)
    true
  else
    false
  end
end

# Odd Lists
def oddities(array)
	reduced = []
	array.each do |element|
	  reduced << element if array.index(element).even?
	end
	reduced
end	

# Palindromic Strings (Part 1)
def palindrome?(string)
  string == string.reverse
end

# Palindromic Strings (Part 2)
def real_palindrome?(string)
  real_string = string.gsub(/[^0-9A-Za-z]/, '').downcase
  real_string == real_string.reverse
end

# Palindromic Numbers
def palindromic_number?(num)
  num = num.to_s
  num == num.reverse
end