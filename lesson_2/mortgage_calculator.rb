# loan_amount * (interest_rate / (1 - (1 + interest_rate)**(-loan_duration)))

def prompt(message)
  puts ">> #{message}"
end

def valid_number?(num) # no zeroes permitted
  num = num.gsub(/[$%,]/, '')
  num.to_i.positive? && (num.to_i.to_s == num || num.to_f.to_s == num)
end

def valid_number2?(num) # zeroes permitted
  num = num.gsub(/[$%,]/, '')
  # my solution to get my conditional expression < 80 characters
  comparison1 = num.to_i.positive? || num.to_f == 0.0
  comparison2 = num.to_i.to_s == num || num.to_f.to_s == num
  comparison1 && comparison2
end

prompt("Hello! Welcome to the Mortgage Calculator!")

loop do
  loan_amount = ""
  prompt("Can I please get your loan amount?")

  loop do
    loan_amount = gets.chomp
    if valid_number?(loan_amount)
      loan_amount = loan_amount.gsub(/[$%,]/, '')
      loan_amount = loan_amount.to_f
      break
    else
      prompt("Please enter a valid number.")
    end
  end

  interest_rate = ""
  prompt("Great. And can I please have your monthly (APR) interest rate in % ?")

  loop do
    interest_rate = gets.chomp
    if valid_number2?(interest_rate)
      interest_rate = interest_rate.gsub(/[$%,]/, '')
      interest_rate = interest_rate.to_f
      interest_rate = (interest_rate / 1200)
      break
    else
      prompt("Please enter a valid interest rate.")
    end
  end

  prompt("Lastly, I need the loan duration in years, plus any add'l months.")
  prompt("How many years?")

  years = ""
  months = ""

  loop do
    years = gets.chomp
    if valid_number2?(years)
      years = years.gsub(/[$%,]/, '')
      years = years.to_f
      break
    else
      prompt("Please enter a valid number.")
    end
  end

  prompt("And how many additional months?")

  loop do
    months = gets.chomp
    if valid_number2?(months)
      months = months.gsub(/[$%,]/, '')
      months = months.to_f
      break
    else
      prompt("Please enter a valid number.")
    end
  end

  loan_duration = (years * 12) + months

  prompt("Thank you, just give me one moment...")

  monthly_payment = interest_rate / (1 - (1 + interest_rate)**(-loan_duration))
  monthly_payment *= loan_amount
  monthly_payment = monthly_payment.ceil(2)
  prompt("Your monthly payment will be $#{monthly_payment}")
  prompt("Do you want to perform another calculation? (Y to calculate again)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for using the Mortgage Calculator!")
