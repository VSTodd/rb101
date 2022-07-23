hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: 
  ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

hsh.each_value do |arr|
  arr.each do |word|
    word.chars do |char|
      puts char if 'aeiou'.include?(char)
    end
  end
end 