=begin
Write out pseudo-code (both casual and formal) that does the following:

1) A method that returns the sum of two integers

Casual:
  Create a new method that:
    -Takes two arguments
    -Generates the sum of the two arguments
    -Returns it
    
Formal: 
  START
  SET new method called "adder", which takes arguments x,y
  x + y
  END
  
2) A method that takes an array of strings, and returns a string that is all those strings concatenated together
Casual:
  Create a new method that:
    -Takes an array of strings
    -Iterate over each string, adding them together
    -Returning the combined value of each string
  
Formal: 
  START
  #given an array of strings called "arr"
  
  DEFINE a new method called "combiner" which takes one argument
    SET combination = iteration of each elemeny in arr 
  END
  

3) A method that takes an array of integers, and returns a new array with every other element from the original array, starting with the 1st
Casual:
  Given an array of integers
  Iterate through the collection one by one
    For each iteration, if the index of the array is zero or even, push it into the new array
    Print the new array
    
Formal:
  START
  #given an array of integets
  
  DEFINE a new method "everyOther", which takes argument arr
  IF arr.index == 0 || arr.index % 2 == 0
    new_array = arr.push
  PRINT new_array
  END
  
4) a method that determines the index of the 3rd occurrence of a given character in a string. 

Casual:
  Given a string of characters and a specific character
  Create a new method which takes two arguments
    Iterate through each character
    If the specific character is encountered, increase the counter by 1
    One the counter equals three, return the index and break the loop
    Otherwise, return nil
    
Formal:
  START
  #Given a string of characters and a specific character
  
  SET counter 
  
  DEFINE new method "thirds" which takes two arguments (x,y)
  split x
  iterate over x
    IF x == y
      counter + 1
    ELSE IF 
      counter = 3
      PRINT x.index
      BREAK
  PRINT "nil"
  BREAK
  END
  
5) a method that takes two arrays of numbers and returns the result of merging the array w/ first array becoming even indicis and second becoming odd
  
Casual: 
  Given two arrays
  Create a new method that takes both arrays as arguments
    Use the zip method to combine the two arrays and assign to new array
    Use the flatten method to convert to non-nested array 
    print updated array
    
Formal:
  START
  #Given two arrays of equal length
  DEFINE new method "every_other" with both arrays as arguments
    SET new_array = array1 (zip method) array2
    new_array with flatten method
    PRINT new_array
  END
  
=end