# frozen_string_literal: true

class ShoppingCartUsingPatterns
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

  def base_total_amount
    items.sum(:price).to_d
  end

  def calculate_total_amount
    total_amount =
      calculate_coupon_based_discount_for(
        calculate_holiday_based_discount_for(
          calculate_user_based_discount_for(
            base_total_amount
          )
        )
      )

    total_amount.positive? ? total_amount : 0
  end

  private

  def calculate_user_based_discount_for(amount)
    discount_factory.create_by_customer(customer.discount_strategy_class).calculate_for(amount, items.size)
  end

  def calculate_holiday_based_discount_for(amount)
    discount_factory.create_by_date(Date.today).calculate_for(amount, items.size)
  end

  def calculate_coupon_based_discount_for(amount)
    return amount if @discount_coupon.blank?

    amount - amount * @discount_coupon.discount_percentage
  end

  def discount_factory
    DiscountFactory.new
  end
end
