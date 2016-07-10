module PipedriveRuby
  # responsable for interface all resources with PipedriveClient
    class Base
      extend Forwardable
      include HTTP::Chainable

      attr_reader :client,:endpoints,:base_url

      def initialize(pipedrive_client)
          class_name = self.class.name
          @client = pipedrive_client
          @endpoints = PipedriveRuby::SharedEndpoints.new(class_name, @client)
          @base_url = PipedriveRuby::base_url(class_name)
      end

      def_delegators :client, :default_param

    end
end
