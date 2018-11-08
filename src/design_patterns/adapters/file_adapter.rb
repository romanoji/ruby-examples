# frozen_string_literal: true

class FileAdapter
  def initialize(name, contents)
    @name = name
    @contents = contents
  end

  def stream_contents
    # ...
  end
end
