require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def setup
    @register = CashRegister.new(1000)
    @transaction = Transaction.new(20)
  end

  def test_accept_money
    pretransaction = @register.total_money
    @transaction.amount_paid = 20
    @register.accept_money(@transaction)
    assert_equal(pretransaction + 20, @register.total_money)
  end

  def test_change
    @transaction.amount_paid = 30
    assert_equal(10, @register.change(@transaction))
  end

  def test_give_receipt
    assert_output("You've paid $20.\n") {@register.give_receipt(@transaction)}
  end
end