# frozen_string_literal: true

# Builder pattern

class HtmlFormBuilder
  def initialize
    @form = HtmlForm.new
  end

  def add_input_with_label(name, text)
    @form.add_element(HtmlContainer.new([HtmlLabel.new(name, text),
                                         HtmlInput.new(name, name)]))
    self
  end

  def add_submit_button(text = 'Submit')
    add_button(text, 'submit')
    self
  end

  def add_button(text, type = 'button')
    @form.add_element(HtmlButton.new(text, type))
    self
  end

  def build
    @form
  end
end
