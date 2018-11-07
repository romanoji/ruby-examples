# frozen_string_literal: true

class Item
  attr_reader :type, :name, :price

  def initialize(type, name, price)
    @type = type
    @name = name
    @price = price
  end
end
