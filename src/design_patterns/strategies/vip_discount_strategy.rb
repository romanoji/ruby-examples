# frozen_string_literal: true

# Strategy pattern
class VipDiscountStrategy
  def initialize(vip)
    @vip = vip
  end

  def apply_to(amount, _items)
    amount - amount * 0.15
  end
end
