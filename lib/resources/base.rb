module PipedriveRuby
  # responsable for interface all resources with PipedriveClient
    class Base
      extend Forwardable

      attr_reader :client,:endpoints,:base_url

      def initialize(pipedrive_client)
          class_name = self.class.name
          @client = pipedrive_client
          @endpoints = PipedriveRuby::HttpFactory.new(class_name, @client)
      end

      def_delegators :endpoints, :custom_get, :custom_post, :custom_delete

    end
end
