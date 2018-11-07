# frozen_string_literal: true

module Grpc
  module RequestProcessing
    class WithTracingDecorator < RequestProcessing::BaseDecorator
      extend ::NewRelic::Agent::MethodTracer

      ZIPKIN_TRACING_METADATA = { 'x-b3-traceid': TracingRuby::Trace.id.trace_id.to_s }.freeze
      private_constant :ZIPKIN_TRACING_METADATA

      def process_request(rpc_name, request, **options)
        self.class.trace_execution_scoped(["Custom/#{grpc_service_name.underscore.camelize}/#{rpc_name}"]) do
          request_processor.process_request(rpc_name,
                                            request,
                                            options.deep_merge(metadata: ZIPKIN_TRACING_METADATA))
        end
      end
    end
  end
end
