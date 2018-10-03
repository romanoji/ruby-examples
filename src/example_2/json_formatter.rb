# frozen_string_literal: true

require 'json'

class JSONFormatter
  def format(data)
    JSON.dump(data)
  end
end
