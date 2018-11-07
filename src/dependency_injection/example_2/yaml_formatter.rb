# frozen_string_literal: true

require 'yaml'

class YamlFormatter
  def format(data)
    YAML.dump(data)
  end
end
