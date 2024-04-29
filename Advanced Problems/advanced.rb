# Internal vs External Iterators

factorals = Enumerator.new do |yielder|
  starter = 1
  num = 0
  loop do
    factoral = num > 1 ? (starter..num).to_a.inject(:*) : 1
    puts "Factoral of #{num} is #{factoral}"
    yielder << num
    num += 1
  end
end

factorals.take(7)

# Exploring Procs, Lambdas, and Blocks: Definition and Arity
# Group 1
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc
puts my_proc.class
my_proc.call
my_proc.call('cat')
# Calling to_s on a Proc results in the Procs ID and location in the computer
# Procs have lenient arity, so if you do not pass in the required number of
  # arguments, it will substitute in nil


# Group 2
my_lambda = lambda { |thing| puts "This is a #{thing}." }
my_second_lambda = -> (thing) { puts "This is a #{thing}." }
puts my_lambda
puts my_second_lambda
puts my_lambda.class
my_lambda.call('dog')
my_lambda.call
my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." }
# A lambda is a type of proc object
# You can create a new lambda object with a call to `lamba` or `->`
# Lambdas have strict arity so it throws an argument error if you do not pass in
  # the required number of arguments


# Group 3
def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}."}
block_method_1('seal')
# You get a LocalJumpError thrown if you have a yield keyword in a method
  # definition, but no block to yield to

# Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
block_method_2('turtle') { puts "This is a #{animal}."}
# Blocks, like procs, have lenient arity, substituting nil if not enough
  # arguments are passed to it.
# An error will be thrown if a variable is referenced in the block that is not
  # within its scope

