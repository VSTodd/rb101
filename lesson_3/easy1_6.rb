# show two different ways to put the expected "Four score and " in front of it.

#1 
famous_words = "seven years ago..."
the_rest = "Four score and "

famous_words = the_rest + famous_words
puts famous_words

#2
famous_words = "seven years ago..."
famous_words = "Four score and " << famous_words
puts famous_words

