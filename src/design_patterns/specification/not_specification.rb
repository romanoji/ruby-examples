# frozen_string_literal: true

class NotSpecification
  def initialize(specification)
    @specification = specification
  end

  def satisfied_by?(item)
    !@specification.satisfied_by?(item)
  end
end
