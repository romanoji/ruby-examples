# frozen_string_literal: true

# Simplified version of http://ruby-doc.org/stdlib-2.5.1/libdoc/observer/rdoc/Observable.html

module Observable
  def initialize
    @observers = []
    changed(false)
  end

  def add_observer(observer)
    @observers << observer
  end

  def delete_observer(observer)
    @observers.delete(observer)
  end

  def changed(state = true)
    @changed = state
  end

  def notify_observers(*args)
    return unless @changed

    @observers.each { |observer| observer.update(*args) }
    changed(false)
  end
end
