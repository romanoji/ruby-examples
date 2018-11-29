# frozen_string_literal: true

class HtmlContainer
  def initialize(elements = [])
    @elements = elements
  end

  def render
    elements_html = @elements.map(&:render).join

    "<div>#{elements_html}</div>"
  end
end
