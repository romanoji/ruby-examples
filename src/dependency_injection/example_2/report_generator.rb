# frozen_string_literal: true

# Reference: http://rubyblog.pro/2016/10/ruby-dependency-injection
class ReportGenerator
  include DIContainer.injector[data_source: 'data_source', formatter: 'json_formatter']

  attr_reader :data_source, :formatter

  def generate
    formatter.format(data_source.data)
  end
end
