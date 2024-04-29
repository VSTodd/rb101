# Modify your transpose method from the previous exercise so it works with any
# matrix with at least 1 row and 1 column.

# input: array of arrays
# output: new array of arrays

# define method with argument array
# initialize empty array transpose
# initialize variable width, equal to the length of array
# initialize variable length, equal to the length of the first subarray
# initialize variable counter, equal to 0
# iterate over array length number of times
  # initialize empty array new
  # iterate over each subarray, adding each element at current counter to new
  # shovel in new to transpose
  # add 1 to counter
# return transpose




def transpose(array)
  transpose = []
  width = array.length
  length = array[0].length
  counter = 0
  length.times do
    new = []
    array.each { |sub_array| new << sub_array[counter]}
    transpose << new
    counter += 1
  end
  transpose
end


p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]