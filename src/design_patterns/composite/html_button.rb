# frozen_string_literal: true

class HtmlButton
  def initialize(text, type = 'button')
    @text = text
    @type = type
  end

  def render
    "<button type='#{@type}'>#{@text}</button>"
  end
end
