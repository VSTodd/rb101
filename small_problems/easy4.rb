# Short Long Short
def short_long_short(string1, string2)
  if string1.length < string2.length
    string1 + string2 + string1
  else
    string2 + string1 + string2
  end
end

# What Century is That?
def century(year)
 century = ((year - 1) / 100) + 1
	if century.to_s.end_with?('11','12','13')
	  century = century.to_s + 'th'
	elsif century % 10 == 1
	  century = century.to_s + 'st'
	elsif century % 10 == 2
		century = century.to_s + 'nd'
	elsif century % 10 == 3
		century = century.to_s + 'rd'
	else
		century = century.to_s + 'th'
	end
	century
end

# Leap Years (Part 1)
def leap_year?(year)
  if year % 400 == 0
    true
  elsif year % 4 == 0 && year % 100 != 0
    true
  else
    false
  end
end

# Leap Years (Part 2)
def leap_year?(year)
  if year >= 1752
    gregorian(year)
  else
    julian(year)
  end
end

def julian(year)
  if year % 4 == 0
    true
  else
    false
  end
end

def gregorian(year)
  if year % 400 == 0
    true
  elsif year % 4 == 0 && year % 100 != 0
    true
  else
    false
  end
end

# Multiples of 3 and 5
def multisum(int)
  arr = []
  (1..int).each {|x| arr << x if (x % 3 == 0 || x % 5 == 0)}
  arr.sum
end

# Running Totals
def running_total(arr)
  arr.each_index do |index|
    if index != 0
     arr[index] = arr[index] + arr[index - 1]
    end
  end
end

# Convert a String to a Number!
NUMBERS = { '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, 
  '6' => 6, '7' => 7, '8' => 8, '9' => 9 }

def string_to_integer(string)
  integer = 0
  string.each_char do |char|
    integer = (integer * 10) + NUMBERS[char]
  end
  integer
end

# Convert a String to a Signed Number!
def string_to_signed_integer(string)
  negative = false
  negative = true if string.chr == '-'
  
  string = string.delete '-' if string.chr == '-'
  string = string.delete '+' if string.chr == '+'
  
  integer = string_to_integer(string)
  integer = -integer if negative
  integer
end


# Convert a Number to a String!
CHARACTERS = { 0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5', 
  6 => '6', 7 => '7', 8 => '8', 9 => '9' }

def integer_to_string(integer)
string = ''

loop do
  string.prepend(CHARACTERS[integer % 10])
  integer /= 10
  break if integer == 0
end

string
end

# Convert a Signed Number to a String!
def signed_integer_to_string(integer)
  string = ''
  
  if integer > 0
    string = '+'
  elsif integer < 0
    string = '-'
    integer = -integer
  end
  
  string + integer_to_string(integer)
end
