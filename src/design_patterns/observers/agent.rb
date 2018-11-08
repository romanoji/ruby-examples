# frozen_string_literal: true

# Observer

class Agent
  def subscribe_to(event_market)
    event_market.add_observer(self)
  end

  def unsubscribe_from(event_market)
    event_market.delete_observer(self)
  end

  def update(event_market)
    @last_odds = @new_odds
    @new_odds = event_market.odds
    # trigger some action depending on the values' difference, threshold, etc.
    # eg. block market if odds reach some threshold
  end
end
