# 1. Listening Device

class Device
  def initialize
    @recordings = []
  end

  def record(recording)
    @recordings << recording
  end

  def listen
    record(yield) if block_given?
  end

  def play
    puts @recordings.last
  end
end

listener = Device.new
listener.listen { "Hello World!" }
listener.listen
listener.play # Outputs "Hello World!"

# 2. Text Analyzer - Sandwich Code

class TextAnalyzer
  def process
    file = File.read('sample_text.txt')
    yield(file)
  end
end

analyzer = TextAnalyzer.new
analyzer.process {|file| puts "#{file.split("\n\n").count} paragraphs"}
analyzer.process {|file| puts "#{file.split("\n").count} lines"}
analyzer.process {|file| puts "#{file.split(" ").count} words"}

# 3: Passing Parameters Part 1

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  puts yield(items)
  puts "Nice selection of food we have gathered!"
end

gather(items) {|food| food.join(', ')}

# 4: Passing Parameters Part 2
def defer(arr)
  yield(arr)
end

birds = %w(raven finch hawk eagle)
raptors = defer(birds) do |_, _, *raptors|
  "The raptors are: #{raptors.join(', ')}"
end

p raptors

# 5: Passing Parameter Part 3
items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do |*others, wheat|
  puts others.join(', ')
  puts wheat
end
# Let's start gathering food.
# apples, corn, cabbage
# wheat
# We've finished gathering!
puts ''

gather(items) do |apple, *others, wheat|
  puts apple
  puts others.join(', ')
  puts wheat
end
# Let's start gathering food.
# apples
# corn, cabbage
# wheat
# We've finished gathering!
puts ''

gather(items) do |apple, *others|
  puts apple
  puts others.join(', ')
end

# Let's start gathering food.
# apples
# corn, cabbage, wheat
# We've finished gathering!
puts ''

gather(items) do |apple, corn, cabbage, wheat|
  puts "#{apple}, #{corn}, #{cabbage}, and #{wheat}"
end
# Let's start gathering food.
# apples, corn, cabbage, and wheat
# We've finished gathering!

# 6. Method to Proc
def convert_to_base_8(n)
  n.to_s(8).to_i
end

base8_proc = method(:convert_to_base_8).to_proc
p [8, 10, 12, 14, 16, 33].map(&base8_proc)

# [10, 12, 14, 16, 20, 41]

# 7. Bubble Sort with Blocks


def bubble_sort!(array)
  loop do
    passed_through = true
    array.each_index do |index|
      if array[index + 1] == nil
        next
      elsif block_given?
        unless yield(array[index], array[index + 1])
          passed_through = false
          array[index], array[index + 1] = array[index + 1], array[index]
        end
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

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [5, 3, 7]
bubble_sort!(array) { |first, second| first >= second }
p array == [7, 5, 3]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = [6, 12, 27, 22, 14]
bubble_sort!(array) { |first, second| (first % 7) <= (second % 7) }
p array == [14, 22, 12, 6, 27]

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array)
p array == %w(Kim Pete Tyler alice bonnie rachel sue)

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array) { |first, second| first.downcase <= second.downcase }
p array == %w(alice bonnie Kim Pete rachel sue Tyler)
