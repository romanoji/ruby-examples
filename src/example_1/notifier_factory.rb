# frozen_string_literal: true

class NotifierFactory
  include DIContainer.injector['email_notifier', 'sms_notifier', 'null_notifier']

  def create_by(channel)
    case channel
    when :email then email_notifier
    when :sms then sms_notifier
    else null_notifier
    end
  end
end
