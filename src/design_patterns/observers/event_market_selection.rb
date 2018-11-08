# frozen_string_literal: true

# Observable

class EventMarketSelection
  include Observable

  attr_reader :odds

  def initialize(odds)
    @odds = odds
  end

  def odds=(new_odds)
    return if new_odds == @odds

    @odds = new_odds
    changed
    notify_observers(self)
  end
end
