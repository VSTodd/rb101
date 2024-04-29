require 'minitest/autorun'
# require_relative 'cash_register'
require_relative 'transaction'

class TransactionTest < Minitest::Test
  def setup
    @transaction = Transaction.new(20)
  end

  def test_prompt_for_payment
    input = StringIO.new("20\n")
    output = StringIO.new
    @transaction.prompt_for_payment(input: input, output: output)
    assert_equal(20, @transaction.amount_paid)
  end


  def prompt_for_payment(input: $stdin)
    loop do
      puts "You owe $#{item_cost}.\nHow much are you paying?"
      @amount_paid = input.gets.chomp.to_f
      break if valid_payment? && sufficient_payment?
      puts 'That is not the correct amount. ' \
           'Please make sure to pay the full cost.'
    end
  end
end
