# frozen_string_literal: true

class AndSpecification
  def initialize(specifications = [])
    @specifications = specifications
  end

  def satisfied_by?(item)
    @specifications.all? { |spec| spec.satisfied_by?(item) }
  end
end
