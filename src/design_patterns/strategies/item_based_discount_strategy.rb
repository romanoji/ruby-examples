# frozen_string_literal: true

# Strategy pattern
class ItemBasedDiscountStrategy
  def initialize(name_pattern: nil, extra_conditions: {}, discount_factor: 0.01)
    @name_pattern = name_pattern
    @extra_conditions = extra_conditions
    @discount_factor = discount_factor
  end

  def apply_to(amount, items)
    filtered_items = filter_items(items)
    amount - amount * filtered_items.size * @discount_factor
  end

  private

  def filter_items(items)
    filtered_items = items
    filtered_items.select! { |i| i.name.match?(@name_pattern) } if name_pattern
    # TODO: filter items by extra_conditions

    filtered_items
  end
end
