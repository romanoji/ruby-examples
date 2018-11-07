# frozen_string_literal: true

class DiscountCoupon
  attr_reader :code, :discount_percentage

  def initialize(code, discount_percentage)
    @code = code
    @discount_percentage = discount_percentage
  end
end
