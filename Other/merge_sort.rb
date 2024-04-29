# Sort an array of passed in values using merge sort. You can assume that this array
# may contain only one type of data. And that data may be either all numbers or
# all strings.

# Feel free to use the merge method you wrote in the previous exercise.

# input: array
# output: array

# define method merge_sort with array as argument
# initialize arr1, which is equal to first half of array
# initialize arr2, which is equal to second half of array
# reassign arr1 to call merge_sort on arr1
# reassign arr2 to call merge_sort on arr2
# call merge on arr1 and arr2

def merge_sort(arr)
  return arr if arr.length == 1
  arr1 = arr[0...(arr.length/2)]
  arr2 = arr[(arr.length/2)...arr.length]

  arr1 = merge_sort(arr1)
  arr2 = merge_sort(arr2)
  merge(arr1, arr2)
end

def merge(arr1, arr2)
  merged = []
  index = 0
  arr1.each do |num|
    while index < arr2.length && arr2[index] <= num
      merged << arr2[index]
      index += 1
    end
    merged << num
  end
  merged.concat(arr2[index..-1])
end

p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]