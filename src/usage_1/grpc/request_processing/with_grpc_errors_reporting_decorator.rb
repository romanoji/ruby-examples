# frozen_string_literal: true

module Grpc
  module RequestProcessing
    class WithGrpcErrorsReportingDecorator < RequestProcessing::BaseDecorator
      def process_request(rpc_name, request)
        request_processor.process_request(rpc_name, request)
      rescue GRPC::BadStatus => e
        ErrorReporter.error(e)
        raise
      end
    end
  end
end
