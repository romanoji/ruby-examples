# frozen_string_literal: true

module Grpc
  module RequestProcessing
    class BaseDecorator < SimpleDelegator
      attr_private :request_processor

      def initialize(request_processor)
        @request_processor = request_processor
        super
      end
    end
  end
end
