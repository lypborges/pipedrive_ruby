module PipedriveRuby
  # responsable for interface all resources with PipedriveClient
    class Base
      extend Forwardable
      include HTTP::Chainable

      def initialize(pipedrive_client)
          @client = pipedrive_client
          @endpoints = PipedriveRuby::SharedEndpoints.new(self.class.name, @client)
      end

      def_delegators :@client, :default_param

    end
end
