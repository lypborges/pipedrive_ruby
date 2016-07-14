# share commum methods for resources
module PipedriveRuby
  # This class is for hold the client informations (API TOKEN, resources)
  class PipedriveClient

    attr_reader :api_token

    def initialize(api_token)
      @api_token = api_token
    end

    # this delegation is only to allow user make PipedriveClient.new("token").resource
    # where resource could be deals organizations etc...
    def method_missing(method)
      begin
        class_name = 'PipedriveRuby::' + method.to_s.split("_").collect(&:capitalize).join
        Object.const_get(class_name).new(self)
      rescue NameError
        "#{method} class not found"
      end
    end

  end
end
