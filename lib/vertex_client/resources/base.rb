require 'active_support'
module VertexClient
  module Resource
    class Base

      def initialize(params)
        @payload = payload_type.new(params)
      end

      def result
        @result ||= (response ? formatted_response : fallback_response)
      end

      def config_key
        demodulized_class_name.underscore.to_sym
      end

      private

      def response
        @response ||= connection.request(@payload.transform)
      end

      def connection
        @connection ||= Connection.new(self.class::ENDPOINT, config_key)
      end

      def formatted_response
        response_type.new(response)
      end

      def payload_type
        "VertexClient::Payload::#{demodulized_class_name}".constantize
      end

      def response_type
        "VertexClient::Response::#{demodulized_class_name}".constantize
      end

      def demodulized_class_name
        self.class.name.demodulize
      end
    end
  end
end
