arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

arr.map do |inner|
  inner.select {|num| num % 3 == 0}
end


  
  