# frozen_string_literal: true

module Grpc
  module RequestProcessing
    class BaseHandler
      extend ::NewRelic::Agent::MethodTracer

      rattr_initialize :grpc_service_name, :client_stub
      attr_private :client_stub

      def process_request(rpc_name, request)
        self.class.trace_execution_scoped(["Custom/#{grpc_service_name.underscore.camelize}/#{rpc_name}"]) do
          client_stub.public_send(
            rpc_name,
            request,
            metadata: { 'x-b3-traceid': TracingRuby::Trace.id.trace_id.to_s }
          )
        end
      end
    end
  end
end
