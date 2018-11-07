# frozen_string_literal: true

# Strategy && Null Object patterns - 2in1
class NoDiscountStrategy
  def calculate_for(amount, _items)
    amount
  end
end
