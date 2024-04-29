# Cute angles
def dms(num)
  angle = num.to_i
  decimal = num - angle
  minute = decimal * 60
  second = ((minute - minute.to_i) * 60).round
  minute = minute.to_i
  
  if second == 60
    second = 0
    minute += 1
  end
  
  angle = angle.to_s
  minute = minute.to_s
  minute.prepend("0") if minute.length < 2
  second = second.to_s
  second.prepend("0") if second.length < 2
  "#{angle}°#{minute}'#{second}\""
  
end

# Delete vowels
def remove_vowels(array)
  array.map {|word| word.gsub!(/[aeiouAEIOU]/, '')}
  array
end

# Fibonacci Number Location By Length
def find_fibonacci_index_by_length(length)
  fibonacci = [1,1]
  loop do
    break if fibonacci[-1].to_s.length == lengt
    fibonacci << fibonacci[-1] + fibonacci[-2]
  end
  fibonacci.length
end

# Reversed Arrays (Part 1)
def reverse!(array)
  length = array.length
  counter = 0
  array.map do |element|
    index = -array.index(element) - 1
    array.insert(index, element)
    counter += 1
    break if counter == length
  end

length.times {array.delete_at(0)}
array
end

# Reversed Arrays (Part 2)
def reverse(array)
  reversed = []
  array.each {|element| reversed.prepend(element)}
  reversed
end

# Combining Arrays
def merge(arr1, arr2)
  arr1.concat(arr2)
  arr1.uniq!
end

# Halvsies
def halvsies(arr)
  subarrays = []
  arr1 = arr.length/2
  arr1 -= 1 if arr.length.even?
  arr.length != 1 ? arr2 = arr.length/2 : arr2 = -1 
  subarrays[0] = arr[0..arr1]
  subarrays[1] = arr[-arr2..-1] 
  subarrays
end

# Find the Duplicate
def find_dup(array)
  array.each_index do |index| 
    num = array[index]
    array.delete_at(index)
    return num if array.include?(num)
    end
end

# Does My List Include This?
def include?(arr,value)
  included = false
  arr.each { |x| included = true if x == value }
  included
end

# Right Triangles
def triangle(length)
  asterisk = 0
  spaces = length
  loop do
    asterisk += 1
    spaces -= 1
    puts " " * spaces + "*" * asterisk
    break if asterisk == length
  end
end 