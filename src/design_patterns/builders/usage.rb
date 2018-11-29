# frozen_string_literal: true

# Example usage:
OrdersQuery.new(from_date: Date.yesterday, to_date: Date.today)
           .filter_by(status: :completed)
           .sort_by(completed_at: :desc)
           .paginate
           .execute

OrdersQuery.new(from_date: Date.yesterday, to_date: Date.today)
           .paginate(page: 2, limit: 10)
           .execute
