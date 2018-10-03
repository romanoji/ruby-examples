# frozen_string_literal: true

class JsonReportGenerator
  def initialize(data)
    @data = data
  end

  def generate
    JSON.dump(@data)
  end
end
