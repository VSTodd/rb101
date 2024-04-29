require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

LANGUAGE = 'de'

def messages(message, lang)
  MESSAGES[lang][message]
end

def prompt(message)
  message = messages(message, LANGUAGE)
  Kernel.puts(">> #{message}")
end

def valid_number?(num)
  num.to_i().to_s() == num || num.to_f().to_s() == num
end

def operation_to_message(op)
  operation = case op
              when '1'
                MESSAGES[LANGUAGE]['adding']
              when '2'
                MESSAGES[LANGUAGE]['subtracting']
              when '3'
                MESSAGES[LANGUAGE]['multiplying']
              when '4'
                MESSAGES[LANGUAGE]['dividing']
              end
  operation
end

prompt('welcome')

name = ''
loop do
  name = Kernel.gets().chomp
  if name.empty?()
    prompt('valid_name')
  else
    break
  end
end

print ">> "
print(MESSAGES[LANGUAGE]['hello'])
puts ", #{name}!"

loop do # main loop
  number1 = ''
  loop do
    prompt('first_number')
    number1 = Kernel.gets().chomp()

    if valid_number?(number1)
      break
    else
      prompt('invalid')
    end
  end

  number2 = ''
  loop do
    prompt('second_number')
    number2 = Kernel.gets().chomp()

    if valid_number?(number2)
      break
    else
      prompt('invalid')
    end
  end

  prompt('operator_prompt')

  operator = ''
  loop do
    operator = Kernel.gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt('num_choice')
    end
  end

  print ">> #{operation_to_message(operator)} "
  puts(MESSAGES[LANGUAGE]['calculating'])

  result = case operator # changed .to_i to .to_f
           when '1'
             number1.to_f() + number2.to_f()
           when '2'
             number1.to_f() - number2.to_f()
           when '3'
             number1.to_f() * number2.to_f()
           when '4'
             number1.to_f() / number2.to_f()
           end

  print ">> "
  print(MESSAGES[LANGUAGE]['result'])
  puts " #{result}"

  prompt('another?')
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt('thanks')
