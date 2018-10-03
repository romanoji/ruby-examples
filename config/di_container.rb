# frozen_string_literal: true

require 'dry/system/container'

# noinspection ALL
class DIContainer < Dry::System::Container
  ROOT = Pathname('./src').freeze
  EXAMPLES_DIRS = %w(example_1 example_2) # ROOT.children.select(&:directory?).map(&:basename).map(&:to_s).freeze

  configure do |config|
    config.root = ROOT
    config.auto_register = EXAMPLES_DIRS

    ### ONLY FOR PRESENTATION PURPOSES ###
    register(:email_service_adapter) do
      Class.new do
        def self.send_email(to:, message:)
          puts "Email has been sent to #{to} with a message: #{message}"
        end
      end
    end
    register(:sms_service_adapter) do
      Class.new do
        def self.send_sms(phone, message)
          puts "SMS has been sent to #{phone} with a message: #{message}"
        end
      end
    end
    ### ONLY FOR PRESENTATION PURPOSES ###
  end

  load_paths!(*EXAMPLES_DIRS)
end

DIContainer.finalize!
