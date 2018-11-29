# frozen_string_literal: true

require_relative 'html_form_builder'
require_relative 'html_form'
require_relative 'html_container'
require_relative 'html_label'
require_relative 'html_input'
require_relative 'html_button'

# Composite pattern
#
# It lets to compose objects into tree structures
# and allows to work with them as if they were individual objects
# using recursive composition.
#
# Pros:
# + simplifies the code that has to interact with complex tree structure
# + easier to add new component types
#
# Cons:
# - increases overall code complexity by creating additional classes
#
# Other examples:
# - Other rendering interfaces
# - Business rules - via Specification pattern

# Create it manually...
form = HtmlForm.new([HtmlContainer.new([HtmlLabel.new('name', 'Name'),
                                        HtmlInput.new('name')]),
                     HtmlContainer.new([HtmlLabel.new('surname', 'Surname'),
                                        HtmlInput.new('surname')]),
                     HtmlButton.new('Submit', 'submit'),
                     HtmlButton.new('Cancel')])
               .render
puts form

# ... or tame it using builder pattern
form = HtmlFormBuilder.new
                      .add_input_with_label('name', 'Name')
                      .add_input_with_label('surname', 'Surname')
                      .add_submit_button('Submit')
                      .add_button('Cancel')
                      .build
                      .render
puts form
