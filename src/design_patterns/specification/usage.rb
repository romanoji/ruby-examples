# frozen_string_literal: true

require_relative 'and_specification'
require_relative 'or_specification'
require_relative 'not_specification'
require_relative 'any_specification'

# Specification pattern
#
# Is a specialized type of Composite pattern.
# It defines a clear specification of business rules,
# where objects can be checked against.
#
# Useful when need to encapsulate custom set of rules.
#
# Other examples:
# - Predicates/arithmetics rules (AND, OR, ==, !=, +, -, ...)
# - Complex business rules

specification =
  AndSpecification.new([
    OrSpecification.new([
      AnySpecification.new([1, 2, 3]),
      AnySpecification.new([4, 5, 6])
    ]),
    NotSpecification.new(AnySpecification.new([1, 3, 5]))
  ])

(1..6).each do |n|
  puts n if specification.satisfied_by?(n)
end
