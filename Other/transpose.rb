# define method matrix with argument array
# initialize empty array, transpose
# iterate over array with index
  # initialize empty array new
  # add to new the element at the current index in each subarray
  # add new to transpose
# return transpose

def transpose(array)
  transpose = []
  array.each_index do |index|
    new = []
    array.each {|sub_array| new << sub_array[index]}
    transpose << new
  end
  transpose
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]