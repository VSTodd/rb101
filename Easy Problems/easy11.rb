# 1: Enumerable Class Creation
# Assume we have a Tree class that implements a binary tree. A binary tree is
# just one of many forms of collections, such as Arrays, Hashes, Stacks, Sets,
# and more. All of these collection classes include the Enumerable module, which
# means they have access to an each method, as well as many other iterative
# methods such as map, reduce, select, and more.

# For this exercise, modify the Tree class to support the methods of Enumerable.
# You do not have to actually implement any methods -- just show the methods
# that you must provide.

class Tree
  include Enumerable

  def each

  end
end

# 2: Optional Blocks
# Write a method that takes an optional block. If the block is specified, the
# method should execute it, and return the value returned by the block. If no
# block is specified, the method should simply return the String 'Does not compute.'.

# input: optional block including objects with a + method
# output: varies, sum of input if block included, otherwise returns 'Does not compute'

# define method compute, which takes an optional block
# conditional for if block if included or not
  # if included, return some of block
  # if not, return 'Does not compute'

def compute
  block_given? ? yield : 'Does not compute.'
end


p compute { 5 + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'

# 3: Find Missing Numbers
# Write a method that takes a sorted array of integers as an argument, and
# returns an array that includes all of the missing integers (in order) between
# the first and last elements of the argument.

# input: array
# output: array

# define a new method missing, with parameter arr
# initializ new_arr, featuring every number between the first and last index of arr
# call select method on new_arr, selecting on those numbers not included in arr

def missing(arr)
  new_arr = (arr.first..arr.last).to_a
  new_arr.select {|num| !arr.include?(num)}
end


p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []

# 4: Divisors
# Write a method that returns a list of all of the divisors of the positive
# integer passed in as an argument. The return value can be in any sequence you
# wish.

# input: integer
# output: array

# define method divisors which takes parameter num
# initialize array options, which contains every number between 1 and num
# call the select method on options, selecting all the can evenly divide from
# the given num

def divisors(num)
  options = []
  (1..num).to_a.each { |opt| options << opt if num % opt == 0 }
  options
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute

# 5: Encrypted Pioneers
# The following list contains the names of individuals who are pioneers in the
# field of computing or that have had a significant influence on the field. The
# names are in an encrypted form, though, using a simple (and incredibly weak)
# form of encryption called Rot13.

# Write a program that deciphers and prints each of these names .

# input: array of string
# output: each string of array, decoded

# def method decrypt, with parameter names
# iterate over each string in name
  # call rot13 method on name, printing the result

# def method rot13 which takes parameter word
  # initialize conv which is assigned to an empty string
  # iterate over each char of word
    # if char downcase is between a-m
      # take ord of char, add 13 to it, convert back to char, and add to conv
    # else
      #  take ord of char, subtract 13 from it, convert back to char, and add to conv
  # return conv

  def decrypt(names)
    names.each {|name| puts rot13(name)}
  end

  def rot13(word)
    conv = ''
    word.chars.each do |char|
      if ('a'..'m').to_a.include?(char.downcase)
        key = char.ord + 13
        conv << key.chr
      elsif ('n'..'z').to_a.include?(char.downcase)
        key = char.ord - 13
        conv << key.chr
      else
        conv << char
      end
    end
    conv
  end

names =  ['Nqn Ybirynpr',
        'Tenpr Ubccre',
        'Nqryr Tbyqfgvar',
        'Nyna Ghevat',
        'Puneyrf Onoontr',
        'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
        'Wbua Ngnanfbss',
        'Ybvf Unvog',
        'Pynhqr Funaaba',
        'Fgrir Wbof',
        'Ovyy Tngrf',
        'Gvz Orearef-Yrr',
        'Fgrir Jbmavnx',
        'Xbaenq Mhfr',
        'Fve Nagbal Ubner',
        'Zneiva Zvafxl',
        'Lhxvuveb Zngfhzbgb',
        'Unllvz Fybavzfxv',
        'Tregehqr Oynapu']

decrypt(names)

# 6: Iterators: True for Any?
# input: array, implicit arr
# output: boolean

# define method any, which takes paramer arr
# set variable index to 0
# if the array isn't empty and a block is included, call a loop
  # initialize variable answ which is equal to the block yielded with arr at index
  # call a conditional
    # if answer is true, return true and break
    # if index is creater than arr's length, return false and break
  # add 1 to index

def any?(arr)
  index = 0
  if !arr.empty? && block_given?
    loop do
      answ = yield(arr[index])
      return true if answ
      break if answ
      index += 1
      break if index >= arr.length
    end
  end
  false
end

p any?([1, 3, 5, 6]) { |value| value.even? } == true
p any?([1, 3, 5, 7]) { |value| value.even? } == false
p any?([2, 4, 6, 8]) { |value| value.odd? } == false
p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p any?([1, 3, 5, 7]) { |value| true } == true
p any?([1, 3, 5, 7]) { |value| false } == false
p any?([]) { |value| true } == false

# 7: Iterators: True for All?

#input: array
#output: boolean

# iterate over each num in array, yieling each to block
  # if it return if that results in false
# if iteration complete without false, return true

def all?(arr)
  arr.each {|num| return false unless yield(num)}
  true
end


p all?([1, 3, 5, 6]) { |value| value.odd? } == false
p all?([1, 3, 5, 7]) { |value| value.odd? } == true
p all?([2, 4, 6, 8]) { |value| value.even? } == true
p all?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
p all?([1, 3, 5, 7]) { |value| true } == true
p all?([1, 3, 5, 7]) { |value| false } == false
p all?([]) { |value| false } == true

# 8: Iterators: True for None?

# input: arr
# output: boolean

# iterate over each num of array, yielding each to block
  # return false if any block yields return true
# otherwise return true

def none?(arr)
  arr.each {|num| return false if yield(num)}
  true
end

p none?([1, 3, 5, 6]) { |value| value.even? } == false
p none?([1, 3, 5, 7]) { |value| value.even? } == true
p none?([2, 4, 6, 8]) { |value| value.odd? } == true
p none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
p none?([1, 3, 5, 7]) { |value| true } == false
p none?([1, 3, 5, 7]) { |value| false } == true
p none?([]) { |value| true } == true

# 9: Iterators: True for One?

# input: array and implicit block
# output: boolean

# define method one?, passing in parameter arr
# initialize variable how_many, equal to 0
# iterate over each num in arr, passing each to block
  # add 1 to how_many if the block returns true
  # return false if how_many is greater than 1
# if no false is return, instead return true

def one?(arr)
  how_many = 0

  arr.each do |num|
    how_many += 1 if yield(num)
    return false if how_many > 1
  end

  return false if arr.empty? || how_many == 0
  true
end

p one?([1, 3, 5, 6]) { |value| value.even? }    # -> true
p one?([1, 3, 5, 7]) { |value| value.odd? }     # -> false
p one?([2, 4, 6, 8]) { |value| value.even? }    # -> false
p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
p one?([1, 3, 5, 7]) { |value| true }           # -> false
p one?([1, 3, 5, 7]) { |value| false }          # -> false
p one?([]) { |value| true }                     # -> false

# 10: Count Items

# input: array, implicit block
# output: integer

# define the method count, with takes parameter arr
# initialize variable counter which is equal to 1
# iterate over arr, passing each number into the block, adding 1 to counter if
  # it returns true
# return counter

def count(arr)
  counter = 0
  arr.each { |num| counter += 1 if yield(num) }
  counter
end

p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2