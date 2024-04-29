# Combine Two Lists
def interleave(a,b)
  counter = 0
  combined = []
  loop do 
    combined << a[counter] << b[counter]
    counter += 1
    break if counter == a.length
  end
  combined
end 

# Lettercase Counter
def letter_case_count(string)
  hash = {}
  hash[:lowercase] = string.count "a-z"
  hash[:uppercase] = string.count "A-Z"
  hash[:neither] = string.length - hash[:uppercase] - hash[:lowercase]
  hash
end

# Capitalize Words
def word_cap(string)
  string = string.split
  string.map! {|word| word.capitalize}
  string.join(" ")
end 

# Swap Case
def swapcase(string)
  new_string = ''
  string.each_char do |char|
    if ('A'..'Z').include?(char)
      new_string << char.downcase!
    elsif ('a'..'z').include?(char)
      new_string << char.upcase!
    else
      new_string << char
    end
  end
  new_string
end

# Staggered Caps (Part 1)
def staggered_case(input)
  input = input.chars
  input.each_index do |index|
    index.even? ? input[index].upcase! : input[index].downcase!
  end
  input.join
end

# Staggered Caps (Part 2)
def staggered_case(input)
  tracker = 0
  staggered = ''
  input = input.downcase.chars
  input.each do |char|
    staggered << char unless ('a'..'z').include?(char)
    if ('a'..'z').include?(char) && tracker == 0
      staggered << char.upcase
      tracker += 1
    elsif ('a'..'z').include?(char) && tracker == 1
      staggered << char
      tracker -= 1
    end
  end
  staggered
end

# Multiplicative Average
def show_multiplicative_average(arr)
  average = 1
  arr.each {|num| average *= num}
  average = average.to_f/arr.length
  puts "The result is #{format('%.3f', average)}"
end 

# Multiply Lists
def multiply_list(a,b)
  multiplied = []
  a.each_index {|index| multiplied << (a[index] * b[index])}
  multiplied 
end

# Multiply All Pairs
def multiply_all_pairs(a,b)
  multiples = []
  a.each do |first|
    b.each do |second|
      multiples << (first * second)
    end
  end
  multiples.sort
end

# The End is Near But Not Here
def penultimate(string)
 array = string.split
 index = array.length - 2
 array[index]
end 