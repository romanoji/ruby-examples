# frozen_string_literal: true

class OrSpecification
  def initialize(specifications = [])
    @specifications = specifications
  end

  def satisfied_by?(item)
    @specifications.any? { |spec| spec.satisfied_by?(item) }
  end
end
