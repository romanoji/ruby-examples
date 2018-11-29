# frozen_string_literal: true

class HtmlForm
  def initialize(elements = [])
    @elements = elements
  end

  def add_element(element)
    @elements << element
    self
  end

  def render
    elements_html = @elements.map(&:render).join

    "<form>#{elements_html}</form>"
  end
end
