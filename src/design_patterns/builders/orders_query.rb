# frozen_string_literal: true

# Builder pattern with Fluent interface
#
# Separate the construction of a complex object into smaller parts/steps.
#
# Pros:
# - looks better than a constructor with 10 params or magic "attrs", which accepts anything
# - minimize the object's requirements - constructor defines required params, and the rest are extra/optional ones
# - expose clear interface to instantiate the object
# - it can be validated step-by-step or in the object's building method
#
# Other examples:
# - Active Record Query (shown here in #execute method)
# - URI builder

class OrdersQuery
  DEFAULT_PAGE = 1
  DEFAULT_LIMIT = 25

  def initialize(from_date:, to_date:)
    @from_date = from_date
    @to_date = to_date
    @filters = {}

    paginate
    sort_by
  end

  def paginate(page: DEFAULT_PAGE, limit: DEFAULT_LIMIT)
    # validate params, eg. limit needs to be <= 100
    @page = page
    @limit = limit
    self
  end

  def filter_by(filters = {})
    # validate filters (if columns exist) or remove non-existent values from filters
    @filters = filters
    self
  end

  def sort_by(column = :created_at, order: :asc)
    # validate params
    @sort_column = column
    @order = order
    self
  end

  def execute
    Order.where(@filters)
         .order(@sort_column => @order)
         .page(@page)
         .per(@limit)
  end
end
