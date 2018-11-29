# frozen_string_literal: true

class HtmlLabel
  def initialize(bounded_element_id, text)
    @bounded_element_id = bounded_element_id
    @text = text
  end

  def render
    "<label for='#{@bounded_element_id}'>#{@text}</label>"
  end
end
