# Longest Sentence
def longest_sentence(text)
  text.gsub!('.', '..')
  text.gsub!('!', '!!')
  text.gsub!('?', '??')
  text = text.split('. ')
  text = text.map {|sentence| sentence.split('! ')}.flatten
  text = text.map {|sentence| sentence.split('? ')}.flatten
  longest = ''
  text.each do |sentence|
    if sentence.split.length > longest.split.length
      longest = sentence
    end
  end
  puts "The longest sentence is: #{longest}"
  puts "The length of this sentence is #{longest.split.length} words"
end

# Now I Know My ABCs
BLOCK = {'B' => 'O', 'X' => 'K', 'D' => 'Q', 'C' => 'P', 'N' => 'A', 'G' => 'T',
  'R' => 'E', 'F' => 'S', 'J' => 'W', 'H' => 'U', 'V' => 'I', 'L' => 'Y',
  'Z' => 'M'}

def block_word?(string)
  block = true
  string = string.upcase.chars
  string.each { |char| block = false if string.include?(BLOCK[char]) }
  block
end

# Lettercase Percentage Ratio
UPPERCASE = ('A'..'Z').to_a
LOWERCASE = ('a'..'z').to_a

def letter_percentages(string)
  characters = string.chars
  hash = {lowercase: 0.0, uppercase: 0.0, neither: 0.0 }
  length = characters.length.to_f
  characters.each do |char|
    if UPPERCASE.include?(char)
      hash[:uppercase] += 1
    elsif LOWERCASE.include?(char)
      hash[:lowercase] += 1
    else
      hash[:neither] += 1
    end
  end
  hash.each { |k, v| hash[k] = (v/length) * 100 }
  hash
end

#Triangle Sides
def valid_triangle?(side1, side2, side3)
  array = [side1, side2, side3].sort
  array[0] + array[1] <= array[2] ? false : true
end

def triangle(side1, side2, side3)
  return :invalid unless valid_triangle?(side1, side2, side3)
  array = [side1, side2, side3].sort
  if array[0] == array[1] && array[1] == array[2]
    :equilateral
  elsif array[0] != array[1] && array[1] != array[2] && array[0] != array[2]
    :scalene
  else
    :isosceles
  end
end

# Tri-Angles
def triangle(angle1, angle2, angle3)
  array = [angle1, angle2, angle3]
  if array.inject(:+) != 180 || array.include?(0)
    :invalid
  elsif array.include?(90)
    :right
  elsif array[0] < 90 && array[1] < 90 && array[2] < 90
    :acute
  else
    :obtuse
  end
end

# Unlucky Days
require 'date'
def friday_13th(year)
  thirteens = []
  month = 1
  12.times do
    thirteens << Date.new(year,month,13)
    month += 1
  end
  fridays = 0
  thirteens.each { |date| fridays += 1 if date.friday? }
  fridays
end

# Next Featured Number Higher than a Given Value
def featured(num)
  loop do
    num += 1
    break if valid?(num) || num > 9_999_999_999
  end
  num < 9_999_999_999 ? num : "Error, there is no possible solution."
end

def valid?(num)
  if num.even?
    false
  elsif num.to_s.chars != num.to_s.chars.uniq
    false
  elsif num % 7 != 0
    false
  else
    true
  end
end

# Bubble Sort
def bubble_sort!(array)
  loop do
    passed_through = true
    array.each_index do |index|
      if array[index + 1] == nil
        next
      elsif array[index] > array[index + 1]
        passed_through = false
        array[index], array[index + 1] = array[index + 1], array[index]
      end
    end
    break if passed_through == true
  end
  array
end

# Sum Square - Square Sum
def sum_square_difference(num)
  range = (1..num).to_a
  sum_first = range.inject(:+) ** 2
  square_first = (range.map { |n| n ** 2}).inject(:+)
  sum_first-square_first
end
