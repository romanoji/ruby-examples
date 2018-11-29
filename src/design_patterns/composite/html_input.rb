# frozen_string_literal: true

class HtmlInput
  def initialize(name, id = name, type = 'text')
    @name = name
    @id = id
    @type = type
  end

  def render
    "<input type='#{@type}' name='#{@name}' id='#{@id}'>"
  end
end
