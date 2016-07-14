module PipedriveRuby
  # responsable for interface all resources with PipedriveClient
    class Base
      extend Forwardable

      attr_reader :client,:endpoints,:base_url

      def initialize(pipedrive_client)
          class_name = self.class.name
          @client = pipedrive_client
          @endpoints = PipedriveRuby::SharedEndpoints.new(class_name, @client)
      end

      def_delegators :client, :default_param
      def_delegators :endpoints, :custom_get

    end
end
