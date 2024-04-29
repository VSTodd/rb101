def calculation(interest, duration, amount)
  (interest / (1 - (1 + interest)**(-duration)))* amount
end

def prompt(message)
  puts ">> #{message}"
end

def valid_input_loan(num) # for validating loan amount input
  num = num.gsub(/[$%,]/, '')
  num.to_i.positive? && (num.to_i.to_s == num || num.to_f.to_s == num)
end

def valid_input_other(num) # for validating interest and loan duration inputs
  num = num.gsub(/[$%,]/, '')
  (num.to_i.positive? || num.to_f == 0.0) &&
    (num.to_i.to_s == num || num.to_f.to_s == num)
end

prompt("Hello! Welcome to the Mortgage Calculator!")
prompt("Note: In order to accurately calculate your monthy payment, your loan
  amount, monthly (APR) interest rate, and loan duration are required.")

loop do
  loan_amount = ""
  prompt("Can I please get your loan amount?")

  loop do
    loan_amount = gets.chomp
    if valid_input_loan(loan_amount)
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
    if valid_input_other(interest_rate)
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
    if valid_input_other(years)
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
    if valid_input_other(months)
      months = months.gsub(/[$%,]/, '')
      months = months.to_f
      break
    else
      prompt("Please enter a valid number.")
    end
  end

  loan_duration = (years * 12) + months

  prompt("Thank you, just give me one moment...")

  monthly_payment = calculation(interest_rate, loan_duration, loan_amount)
  monthly_payment = monthly_payment.ceil(2)
  prompt("Your monthly payment will be $#{monthly_payment}")
  prompt("Do you want to perform another calculation? (Y to calculate again)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thank you for using the Mortgage Calculator!")
