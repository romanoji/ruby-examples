# frozen_string_literal: true

module Grpc
  class Client
    attr_private :grpc_service_name, :client_stub, :request_processor

    REQUEST_PROCESSOR_DECORATORS = [RequestProcessing::WithRetryingDecorator,
                                    RequestProcessing::WithGrpcErrorsReportingDecorator,
                                    RequestProcessing::WithTracingDecorator].freeze
    private_constant :DEFAULT_TIMEOUT, :REQUEST_PROCESSOR_DECORATORS

    def initialize(grpc_service_name, stub_class)
      @grpc_service_name = grpc_service_name
      @client_stub = stub_class.new('host:port', :this_channel_is_insecure)
      @request_processor = create_request_processor
    end

    delegate :process_request, to: :request_processor

    private

    def create_request_processor
      request_processor = RequestProcessing::BaseHandler.new(grpc_service_name, client_stub)
      # How it's being wrapped? -> decorator(decorator(decorator(base_handler)))
      REQUEST_PROCESSOR_DECORATORS.each do |decorator|
        request_processor = decorator.new(request_processor)
      end
      request_processor
    end
  end
end
