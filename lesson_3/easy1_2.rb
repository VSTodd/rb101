=begin
  Describe the difference between ! and ? in Ruby. And explain what would 
happen in the following scenarios:

1) what is != and where should you use it?
  This is the not equal to operator, which you use when comparing two objects to
see if they are not equal to each other. 
  
2) put ! before something, like !user_name
  This is the not operator, which is used to turn an object into the opposite
of its boolean equivalent. 
  
3) put ! after something, like words.uniq!
  This is the bang suffix, which you put at the end of a method to (typically)
indicate that the method will mutate the caller, however there is no guaruntee.

4) put ? before something
  It possibly may be part of a ternary operator. 
true ? "this is true" : "this is not true"
false ? "this is true" : "this is not true"

5) put ? after something
  It possibly may be a part of a ternary operator.
  
6) put !! before something, like !!user_name
This is used to turn a value into its boolean equivalent. 

=end