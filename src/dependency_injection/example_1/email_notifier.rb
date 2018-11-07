# frozen_string_literal: true

class EmailNotifier
  include DIContainer.injector['email_service_adapter']

  def send_notification_for(user)
    email_service_adapter.send_email(to: user.email, message: 'Hello!')
  end
end
