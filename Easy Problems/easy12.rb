# 1: From-To-Step Sequence Generator

# input: three integers
# output: returns step value?

# define method step, which takes parameters, first, last, and step
# initialize an empty array, nums
# call a loop method
  # add first to num
  # increase first by step
  # break the loop if first is greater than last
# iterate over nums, passing each into the block
# return step

def step(first, last, step)
  loop do
    yield(first)
    first += step
    break if first > last
  end
  step
end

step(1, 10, 3) { |value| puts "value = #{value}" }

# 2: Zipper

# input: two arrays
# output: one new array

# define method zip, which takes parameters arr1 and arr2
# initialize index, which is set to 0
# initialize empty array zipped
# call a loop method, times the length of arr1
  # add an array that consists of arr1 and arr2 at the current index
  # add index by 1
# return zipped

def zip(arr1, arr2)
  index = 0
  zipped = Array.new
  arr1.length.times do
    zipped << [arr1[index], arr2[index]]
    index += 1
  end
  zipped
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]

#3: map

# input: array, implicit block
# output: new array

# define method map with parameter arr
# initialize empty array, mapped
# iterate over arr, passing each value to block and adding that return value to mapped
# return mapped

def map(arr)
  mapped = Array.new
  arr.each { |val| mapped << yield(val) }
  mapped
end


p map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
p map([]) { |value| true } == []
p map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
p map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
p map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]

# 4: count

# input: 0 to multiple arguments, implicit block
# output: integer

# define method, with paramemeter arr (converting values to an array)
# initialize variable results, which is set to 0
# iterate over arr, passing each value into the implicit block
  # for every true retured, add 1 to results
# return results

def count(*arr)
  results = 0
  arr.each { |val| results += 1 if yield(val) }
  results
end


p count(1, 3, 6) { |value| value.odd? } == 2
p count(1, 3, 6) { |value| value.even? } == 1
p count(1, 3, 6) { |value| value > 6 } == 0
p count(1, 3, 6) { |value| true } == 3
p count() { |value| true } == 0
p count(1, 3, 6) { |value| value - 6 } == 3

# 5: drop_while

# input: array and implicit block
# output: array

# define the method drop_while, with the parameter arr
# initialize integer object index set to 0
# call a loop method
  # break statement for if index is equal to the length of arr
  # break statement for if yielding current value results falsy
  # add 1 to index
# return an empty array if index is equal to the length of arr
# return an array from current index to the end of array

def drop_while(arr)
  index = 0
  loop do
    break if index == arr.length
    break unless yield(arr[index])
    index += 1
  end
  index == arr.length ? Array.new : arr[index..-1]
end


p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| true } == []
p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { |value| true } == []

# 6: each_with_index

# input: array and implicit block
# output: original array

# define method each_with_index with takes parameter arr
# initialize index variable, equal to 0
# iterate over arr
  # pass each variable + index variable into block
  # increase index by 1
# return arr

def each_with_index(arr)
  index = 0
  arr.each do |val|
    yield(val, index)
    index += 1
  end
end


result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]

# 0 -> 1
# 1 -> 3
# 2 -> 36
# true

# 7: each_with_object

# input: array, collection object
# output: collection object

# define method each_with_object, taking parameters arr, and obj
# iterate over each value of arr, passing in current value and obj to block ea time
# return obj

def each_with_object(arr, obj)
  arr.each { |val| yield(val, obj) }
  obj
end

result = each_with_object([1, 3, 5], []) do |value, list|
  list << value**2
end
p result == [1, 9, 25]

result = each_with_object([1, 3, 5], []) do |value, list|
  list << (1..value).to_a
end
p result == [[1], [1, 2, 3], [1, 2, 3, 4, 5]]

result = each_with_object([1, 3, 5], {}) do |value, hash|
  hash[value] = value**2
end
p result == { 1 => 1, 3 => 9, 5 => 25 }

result = each_with_object([], {}) do |value, hash|
  hash[value] = value * 2
end
p result == {}

# 8: max_by

# input: array, implicit block
# output: highest value

# define method max_by, which takes parameter arr
# initialize variable max_result, set to 0
# initialize variable max_value, set to nil
# iterate over arr, passing each value into the block
  # reassign max_result and max_value if result of block is higher than max_result
# return max_value

def max_by(arr)
  return nil if arr.empty?
  max_result = yield(arr[0])
  max_value = arr[0]
  arr.each do |value|
    current = yield(value)
    max_result, max_value = current, value if current > max_result
  end
  max_value
end


p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil

# 9: each_cons (Part 1)

# input: array, implicit block
# output: nil

# define new method each_cons, with parameter arr
# iterate over arr with index
  # have a conditional, seeing if index + 1 is equal to the length of the array
    # if not, pass in the current value and the value at the next index to the block
# return nil

def each_cons(arr)
  arr.each_with_index do |value, index|
    break if index + 1 == arr.length
    yield(value, arr[index + 1])
  end
  nil
end

hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end
p result == nil
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
result = each_cons([]) do |value1, value2|
  hash[value1] = value2
end
p hash == {}
p result == nil

hash = {}
result = each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
p hash == {'a' => 'b'}
p result == nil

# 10: each_cons (Part 2)

def each_cons(arr, inc)
  inc -= 1
  arr.each_with_index do |value, index|
    break if index + inc == arr.length
    yield(*arr[index..(index+inc)])
  end
  nil
end

hash = {}
each_cons([1, 3, 6, 10], 1) do |value|
  hash[value] = true
end
p hash == { 1 => true, 3 => true, 6 => true, 10 => true }

hash = {}
each_cons([1, 3, 6, 10], 2) do |value1, value2|
  hash[value1] = value2
end
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
each_cons([1, 3, 6, 10], 3) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6], 3 => [6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 4) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 5) do |value1, *values|
  hash[value1] = values
end
p hash == {}