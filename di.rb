# frozen_string_literal: true

require './config/di_container'

class PrintMessage
  def initialize(message)
    @message = message
  end

  def call
    print(@message)
  end
end


# DI Container
container = Dry::Container.new

container.register('greeting_message') { 'Welcome' }
container.register('en_greeter') { PrintMessage.new(container['greeting_message']) }
container.register('pl_greeter') { PrintMessage.new('Cześć') }

service = container.resolve('en_greeter')
service = container['en_greeter']


# Injection mechanism
Import = Dry::AutoInject(container)

class GreetSomeone
  include Import[greeter: 'en_greeter']

  def initialize(name = '', **dependencies)
    super(**dependencies)
    @name = name
  end

  def call
    greeter.call
    print(" #{@name}!\n")
  end
end

GreetSomeone.new('guys').call
GreetSomeone.new('chłopaki', greeter: container['pl_greeter']).call
