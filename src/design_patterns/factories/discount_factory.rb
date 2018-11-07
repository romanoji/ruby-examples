# frozen_string_literal: true

# Factory pattern
class DiscountFactory
  def create_by_customer(customer)
    case customer
    when Customer then CustomerDiscountStrategy.new(customer)
    when Vip then VipDiscountStrategy.new(customer)
    else NoDiscountStrategy.new
    end
  end

  def create_by_date(date)
    case date
    when christmas?(date) then ItemBasedDiscountStrategy.new(discount_factor: 0.02)
    when easter?(date) then ItemBasedDiscountStrategy.new(name_pattern: /Bunny|Rabbit/)
    else NoDiscountStrategy.new
    end
  end

  private

  def christmas?(date)
    date.month == 12 && date.day == 25
  end

  def easter?(date)
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
