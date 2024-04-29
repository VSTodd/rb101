# Write a method that takes two sorted Arrays as arguments, and returns a new
# Array that contains all elements from both arguments in sorted order.

# You may not provide any solution that requires you to sort the result array.
# You must build the result array one element at a time in the proper order.

# Your solution should not mutate the input arrays.

# input: 2 arrays
# output: 1 array

# define method with arguments arr1 and arr2
# initialize empty array, merged
# initialize variable index, equal to 0
# iterate over arr1
  # while the element at the current "index" of arr2 is less than or equal to arr1 element
    # add to merged
    # increase index by 1
  # add current element
# return merged

def merge(arr1, arr2)
  return arr2 if arr1.empty?
  merged = []
  index = 0
  arr1.each do |num|
    while index < arr2.length && arr2[index] <= num
      merged << arr2[index]
      index += 1
    end
    merged << num
  end
  merged
end


p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]