# frozen_string_literal: true

class Customer
  ACCOUNT_PLANS = %i(basic pro)

  attr_reader :name, :account_plan

  def initialize(name)
    @name = name
  end

  def account_plan=(account_plan)
    raise ArgumentError if ACCOUNT_PLANS.exclude?(account_plan)

    @account_plan = account_plan
  end
end
