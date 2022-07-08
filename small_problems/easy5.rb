# ASCII String Value
def ascii_value(string)
  value = 0
  string.each_char {|char| value += char.ord}
  value
end

# After Midnight (Part 1)
def time_of_day(int)
  minutes = 0
  hours = 0
  hours, minutes = int.divmod(60)
  
  minutes = minutes.to_s
  minutes.prepend('0') if minutes.length < 2
  
  if hours > 0 && hours > 24
    loop do
      hours -= 24
      break if hours < 24
    end
  elsif hours < 0 
    loop do
      hours += 24
      break if hours >= 0
    end
  end
  
  hours = hours.to_s
  hours.prepend('0') if hours.length < 2
  
  hours + ':' + minutes
end

# After Midnight (Part 2)
def after_midnight(time)
  hours = time[0,2].to_i
  minutes = time[3,2].to_i
  midnight = hours * 60 + minutes
  midnight == 1440 ? midnight = 0 : midnight
end

def before_midnight(time)
  midnight = after_midnight(time) 
  midnight = 1440 - midnight if after_midnight(time) != 0
  midnight
end

# Letter Swap
def swap(string)
  string = string.split
  string.map do |word|
    word[0], word[-1] = word[-1], word[0]
  end
  string.join(" ")
end

# Clean up the words
def cleanup(string)
  string.gsub!(/[^a-z]/, " ")
  string.squeeze(" ")
end

# Letter Counter (Part 1)
def word_sizes(string)
  string = string.split
  sizes = Hash.new(0)
  string.each do |word|
    sizes[word.length] += 1
  end
  sizes
end

# Letter Counter (Part 2)
def word_sizes(string)
  string = string.split

  string.map do |word| 
    word.gsub!(/[^A-Z a-z]/, "")
    word.rstrip!
  end

  sizes = Hash.new(0)

  string.each do |word|
    sizes[word.length] += 1 
  end
  
  sizes
end

# Alphabetical Numbers
NUMBERS = {'zero': 0, 'one': 1, 'two': 2, 'three': 3, 'four': 4, 'five': 5, 
  'six': 6, 'seven': 7, 'eight': 8, 'nine': 9, 'ten': 10, 'eleven': 11,
  'twelve': 12, 'thirteen': 13, 'fourteen': 14, 'fifteen': 15, 'sixteen': 16, 
  'seventeen': 17, 'eighteen': 18, 'nineteen': 19, 'twenty': 20}

def alphabetic_number_sort(array)
  names = []
  array.each {|value| names << NUMBERS.key(value)}
  names.sort!
  ordered = []

  names.each {|num| ordered << NUMBERS[num]}
  ordered
end

# ddaaiillyy ddoouubbllee
def crunch(string)
  string = string.split(//)
  string.each_index do |index|
    string.delete_at(index) until string[index] != string[index + 1]
  end
  string.join
end

# Bannerizer
def print_in_box(string)
  puts '+-' + ('-' * string.length) + '-+'
  puts '| ' + (' ' * string.length) + ' |'
  puts '| ' + string + ' |'
  puts '| ' + (' ' * string.length) + ' |'
  puts '+-' + ('-' * string.length) + '-+'
end