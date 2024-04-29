# Write a method that displays an 8-pointed star in an nxn grid, where n is an
# odd integer that is supplied as an argument to the method. The smallest such
# star you need to handle is a 7x7 grid.

def star(num)
  top_star(num/2)
  puts '*' * num
  bottom_star(num/2)
end

def top_star(num)
  spaces = num - 1
  tab = 0
  num.times do
    puts (' ' * tab) + '*' + (' ' * spaces) + '*' + (' ' * spaces) + '*'
    spaces -= 1
    tab += 1
  end
end

def bottom_star(num)
  tab = num - 1
  spaces = 0
  num.times do
    puts (' ' * tab) + '*' + (' ' * spaces) + '*' + (' ' * spaces) + '*'
    tab -= 1
    spaces += 1
  end
end

star(25)