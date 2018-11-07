# frozen_string_literal: true

# Strategy && Null Object patterns - 2in1
class NoDiscountStrategy
  def apply_to(amount, _items)
    amount
  end
end
