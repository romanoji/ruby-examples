# frozen_string_literal: true

# Strategy pattern
class CustomerDiscountStrategy
  def initialize(customer)
    @customer = customer
  end

  def apply_to(amount, _items)
    return amount - amount * 0.05 if @customer.account_plan == :pro

    amount
  end
end
