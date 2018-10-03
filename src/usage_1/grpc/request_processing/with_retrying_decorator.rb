# frozen_string_literal: true

module Grpc
  module RequestProcessing
    class WithRetryingDecorator < RequestProcessing::BaseDecorator
      RETRIES_THRESHOLD = 3
      RETRY_ON_ERRORS = [GRPC::Unavailable, GRPC::DeadlineExceeded].freeze

      def process_request(rpc_name, request)
        Retryable.retryable(tries: RETRIES_THRESHOLD + 1, on: RETRY_ON_ERRORS,
                            exception_cb: method(:log_exception)) do
          request_processor.process_request(rpc_name, request)
        end
      end

      private

      def log_exception(ex)
        message = "#{ex.class} error: #{ex} in #{__FILE__}:#{__LINE__}"
        Rails.logger.error "#{message}, retrying..."
      end
    end
  end
end
