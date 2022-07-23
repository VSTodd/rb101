arr = ['10', '11', '9', '7', '8']

arr.map! {|str| str.to_i}
arr.sort! {|a, b| b <=> a} 
arr.map! {|int| int.to_s}