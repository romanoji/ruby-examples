# frozen_string_literal: true

class AnySpecification
  def initialize(values = [])
    @values = values
  end

  def satisfied_by?(item)
    @values.include?(item)
  end
end
