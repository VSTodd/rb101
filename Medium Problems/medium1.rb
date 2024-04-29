# Rotation (Part 1)
def rotate_array(array)
  final = array[0]
  rotated = []
  array.each_index { |index| rotated << array[index + 1] }
  rotated[-1] = final
  rotated
end

def rotate_string(string)
  string[1..-1] + string[0]
end

def rotate_integer(num)
  rotate_array(num.to_s.chars).join.to_i
end

# Rotation (Part 2)
def rotate_rightmost_digits(integer, n)
  integer = integer.to_s.chars
  right = rotate_array(integer[-n..-1])
  integer = integer[0..(-n-1)]
  integer << right
  integer.join.to_i
end

# Rotation (Part 3)
def max_rotation(integer)
  n = integer.to_s.length
  loop do
    integer = rotate_rightmost_digits(integer, n)
    n -= 1
    break if n == 0
  end
  integer
end

#Diamonds!
def diamond(n)
  if n == 1
    puts '*'
  else
    triangle(n)
    puts '*' * n
    inverse_triangle(n)
  end
end

def inverse_triangle(n)
  space = 1
  loop do
    puts "#{' ' * space }#{('*' * (n - (space * 2)))}#{' ' * space }"
    space += 1
    break if space > (n/2)
  end
end

def triangle(n)
  space = n / 2
  space.times do
    puts "#{' ' * space }#{('*' * (n - (space * 2)))}#{' ' * space }"
    space = space - 1
  end
end

# Stack Machine Interpretation
def minilang(commands)
  commands = commands.split(" ")
  register = 0
  stack = []
  commands.each do |command|
    if command.to_i.to_s == command
      register = command.to_i
    elsif command == 'PUSH'
      stack.push(register)
    elsif command == 'ADD'
      register += stack.pop.to_i
    elsif command == 'SUB'
      register -= stack.pop.to_i
    elsif command == 'MULT'
      register *= stack.pop.to_i
    elsif command == 'DIV'
      register /= stack.pop.to_i
    elsif command == 'MOD'
      register %= stack.pop.to_i
    elsif command == 'POP'
      register = stack.pop.to_i
    elsif command == 'PRINT'
      puts register
    end
  end
end

#Word to Digit
NUMBERS = {'zero' => 0, 'one' => 1, 'two' => 2, 'three' => 3, 'four' => 4,
  'five' => 5, 'six' => 6, 'seven' => 7, 'eight' => 8, 'nine' => 9 }

def word_to_digit(words)
  words = words.split(" ")
  words.map! { |word| word.include?(".") ? word.split('.') : word }
  words.map! do |word|
    if NUMBERS.include?(word)
      NUMBERS[word]
    elsif NUMBERS.include?(word[0])
      NUMBERS[word[0]].to_s + '.'
    elsif word.class == Array
      word[0] + '.'
    else
      word
    end
  end
  words.join(" ")
end

# Fibonacci Numbers (Recursion)
def fibonacci(n)
  return 1 if n == 1 || n == 2
  fibonacci(n - 1) + fibonacci(n - 2)
end

# Fibonacci Numbers (Procedural)
def fibonacci(n)
  numbers = [1, 1]
  3.upto(n) { numbers[0], numbers[1] = numbers[1], (numbers[0] + numbers[1]) }
  numbers[-1]
end

# Fibonacci Numbers (Last Digit)
def fibonacci_last(n)
 fibonacci(n).to_s[-1].to_i
end