ADJECTIVE = %w(ugly sticky green periwinkle fuzzy scaly muscular shrimpy lovely)
NOUN = %w(dingo giraffe axoltl earlobe diaper potato bratwurst Cher Dumbledore)
ADVERB = %w(stinkily powerfully annoylingly eagerly whole-heartedly musically)
VERB = %w(ate fought licked cleaned sang scraped dug chomped learned inhaled)

File.open('madlibs_revisited.txt').each do |line|
  line = line.gsub('%{adjective}', ADJECTIVE.sample)
  line = line.gsub('%{noun}', NOUN.sample)
  line = line.gsub('%{adverb}', ADVERB.sample)
  line = line.gsub('%{verb}', VERB.sample)
  puts line
end