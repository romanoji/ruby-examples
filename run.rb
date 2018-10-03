# frozen_string_literal: true

require './config/di_container'

EXAMPLE_NO = ENV['EXAMPLE'].to_i

case EXAMPLE_NO
when 1
  user = User.new('John', 'john@bgl.com', '+48 123 456 789')

  puts '', '=== E-mail notification'
  user.preferred_notification_channel = :email
  user.send_notification

  puts '', '=== SMS notification'
  user.preferred_notification_channel = :sms
  user.send_notification

  puts '', '=== NO notification'
  user.preferred_notification_channel = nil
  user.send_notification
when 2
  puts '', '=== JSON Report ==='
  report_generator = ReportGenerator.new
  puts report_generator.generate

  puts '', '=== YAML Report ==='
  yaml_report_generator = ReportGenerator.new(formatter: DIContainer.resolve('yaml_formatter'))
  puts yaml_report_generator.generate
when 3
  # ...
end
