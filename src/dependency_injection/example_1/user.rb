# frozen_string_literal: true

class User
  NOTIFICATIONS_CHANNELS = %i(email sms).freeze

  include DIContainer.injector['notifier_factory']

  attr_reader :name, :email, :phone

  def initialize(name, email, phone, notifier_factory:)
    super(notifier_factory: notifier_factory)
    @name = name
    @email = email
    @phone = phone
  end

  def preferred_notification_channel=(channel = nil)
    raise if channel && !NOTIFICATIONS_CHANNELS.include?(channel)
    @notification_channel = channel
  end

  def send_notification
    notifier.send_notification_for(self)
  end

  private

  def notifier
    notifier_factory.create_by(@notification_channel)
  end
end
