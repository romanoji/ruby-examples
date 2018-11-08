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
    items.sum(&:price).to_d
  end

  def calculate_total_amount
    total_amount =
      apply_coupon_based_discount_to(
        apply_holiday_based_discount_to(
          apply_user_based_discount_to(
            base_total_amount
          )
        )
      )

    total_amount.positive? ? total_amount : 0
  end

  private

  def apply_user_based_discount_to(amount)
    discount_factory.create_by_customer(customer.discount_strategy_class)
                    .apply_to(amount, items.size)
  end

  def apply_holiday_based_discount_to(amount)
    discount_factory.create_by_date(Date.today)
                    .apply_to(amount, items.size)
  end

  def apply_coupon_based_discount_to(amount)
    return amount if @discount_coupon.blank?

    amount - amount * @discount_coupon.discount_percentage
  end

  def discount_factory
    DiscountFactory.new
  end
end
