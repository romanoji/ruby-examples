# frozen_string_literal: true

class ShoppingCartInitial
  attr_reader :customer, :items, :discount_coupon

  def initialize(customer = nil)
    @items = {}
    @customer = customer
  end

  def add_item(item)
    (@items[item.type] ||= []) << item
  end

  def add_discount_coupon(discount_coupon)
    @discount_coupon = discount_coupon
  end

  def calculate_total_amount
    items.sum(:price).to_d
  end

  ## Requirements of the new "Discounts" feature:
  #  TOTAL AMOUNT =
  #    BASE TOTAL AMOUNT
  #
  #    5% for a pro customer and 15% for a vip
  #  - USER BASED DISCOUNT
  #
  #    On Christmas: 1% discount * each different type of items
  #    On Easter: 2% discount * each different type of item which name contains either Bunny or Rabbit
  #    On other holidays: n% discount * each different type of item based on its name, colour, etc.
  #  - HOLIDAY BASED DISCOUNT
  #
  #    Each coupon has different % of discount
  #  - COUPON BASED DISCOUNT
end
