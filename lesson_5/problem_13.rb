[[1, 8, 3], [1, 5, 9], [6, 1, 7], [1, 6, 9]].sort_by do |arr|
  arr.select{|num|num.odd?}
end

