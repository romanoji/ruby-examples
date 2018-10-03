# frozen_string_literal: true

class SmsNotifier
  include DIContainer.injector['sms_service_adapter']

  def send_notification_for(user)
    sms_service_adapter.send_sms(user.phone, 'Hello!')
  end
end
