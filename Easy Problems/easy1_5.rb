# Programmatically determine if 42 lies between 10 and 100.

if (10..100).cover?(42)
  puts "It's between the numbers!"
else
  puts "It's not between the numbers."
end


