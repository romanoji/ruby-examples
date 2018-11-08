# frozen_string_literal: true

# Observer pattern
#
# Allows to define a one-to-many dependency between objects
# so that when one object (Observable) changes its state,
# all its dependents (Observers) will be notified and updated automatically.
#
# Pros:
# - looses coupling between objects
# - Observer doesn't need to do period checks
# - subscribers can be added/deleted dynamically
#
# Similar patterns:
# - Publish-Subscribe
#   it uses Message Broker/Event Bus to transfer messages to subscribers
#   https://hackernoon.com/observer-vs-pub-sub-pattern-50d3b27f838c

market_selection = EventMarketSelection.new(1.234)

player = Player.new
agent = Agent.new

market_selection.add_observer(player)
market_selection.add_observer(agent)

market_selection.odds = 1.235 # player & agent will be notified & updated
