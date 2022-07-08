# How old is Teddy?
puts "Teddy is #{rand(20..200)} years old!"

# How big is the room?
puts "Enter the length of the room in meters:"
	length = gets.chomp!.to_f
	
	puts "Enter the width of the room in meters:"
	width = gets.chomp!.to_f
	
x = length * width
y = (x * 10.7639).round(2)
	
puts "The area of the room is #{x} square meters (#{y} square feet)."

# Tip calculator
puts "What is the bill?"
bill = gets.to_f

puts "What is the tip percentage?"
tip_percent = gets.to_f

tip = (bill * (tip_percent/100)).round(1)
total = (bill + tip).round(1)

puts "The tip is $#{tip}"
puts "The total is $#{total}"

# When Will I Retire?
puts "What is your age?"
age = gets.to_i
puts "At what age would you like to retire?"
retiring_age = gets.to_i
current_year = Time.now.year
working_years = retiring_age - age
retirement_year = current_year + working_years
puts "It's #{current_year}. You will retire in #{retirement_year}."
puts "You have only #{working_years} years of work to go!"

# Greeting a user
puts "What is your name?"
name = gets.chomp!

if name.end_with?("!")
  name.chop!.upcase!
  puts "HELLO #{name}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{name}."
end

# Odd Numbers
(1..99).each {|num| puts num if num.odd?}

# Even Numbers
(1..99).each {|num| puts num if num.even?}

# Sum or Product of Consecutive Integers
def sum(int)
  total = 0
  (1..int).each {|num| total += num}
  puts "The sum of the integers between 1 and #{int} is #{total}."
end

def product(int)
  total = 1
  (1..int).each {|num| total *= num}
  puts "The product of the integers between 1 and #{int} is #{total}."
end

puts ">> Please enter an integer greater than 0:"
integer = gets.to_i 

puts ">> Enter 's' to compute the sum, 'p' to compute the product."
type = gets.chomp! 

if type.start_with?('s')
  sum(integer)
elsif type.start_with?('p')
  product(integer)
end