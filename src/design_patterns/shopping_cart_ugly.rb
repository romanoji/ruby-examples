# frozen_string_literal: true

class ShoppingCartUgly
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
    if @customer.is_a?(Customer) && @customer.account_plan == :pro
      amount - amount * 0.05
    elsif @customer.is_a?(Vip)
      amount - amount * 0.15
    else
      amount
    end
  end

  def apply_holiday_based_discount_to(amount)
    if christmas_today?
      amount - amount * @items.size * 0.01
    elsif easter_today?
      amount - amount * @items.select { |i| i.name.match?(/Bunny|Rabbit/) }.size * 0.02
    else
      amount
    end
  end

  def apply_coupon_based_discount_to(amount)
    return amount if @discount_coupon.blank?

    amount - amount * @discount_coupon.discount_percentage
  end

  def christmas_today?
    Date.today.month == 12 && Date.today.day == 25
  end

  def easter_today?
    false
    # ░░░░▄▄▄▄▀▀▀▀▀▀▀▀▄▄▄▄▄▄
    # ░░░░█░░░░▒▒▒▒▒▒▒▒▒▒▒▒░░▀▀▄
    # ░░░█░░░▒▒▒▒▒▒░░░░░░░░▒▒▒░░█
    # ░░█░░░░░░▄██▀▄▄░░░░░▄▄▄░░░█
    # ░▀▒▄▄▄▒░█▀▀▀▀▄▄█░░░██▄▄█░░░█
    # █▒█▒▄░▀▄▄▄▀░░░░░░░░█░░░▒▒▒▒▒█
    # █▒█░█▀▄▄░░░░░█▀░░░░▀▄░░▄▀▀▀▄▒█
    # ░█▀▄░█▄░█▀▄▄░▀░▀▀░▄▄▀░░░░█░░█
    # ░░█░░▀▄▀█▄▄░█▀▀▀▄▄▄▄▀▀█▀██░█
    # ░░░█░░██░░▀█▄▄▄█▄▄█▄████░█
    # ░░░░█░░░▀▀▄░█░░░█░███████░█
    # ░░░░░▀▄░░░▀▀▄▄▄█▄█▄█▄█▄▀░░█
    # ░░░░░░░▀▄▄░▒▒▒▒░░░░░░░░░░█
    # ░░░░░░░░░░▀▀▄▄░▒▒▒▒▒▒▒▒▒▒░█
    # ░░░░░░░░░░░░░░▀▄▄▄▄▄░░░░░█
  end
end
