# share commum methods for resources
module PipedriveRuby
  # This class is for hold the client informations (API TOKEN, resources)
  class PipedriveClient

    attr_reader :api_token

    def initialize(api_token)
      @api_token = api_token
    end

    def default_param
      { api_token: api_token }
    end

    # this delegation is only to allow user make PipedriveClient.new("token").resource
    # where resource could be deals organizations etc...
    def method_missing(method)
      class_name = 'PipedriveRuby::' + method.to_s.capitalize
      Object.const_get(class_name).new(self)
    rescue NoMethodError
      puts "#{method} class not found"
    end
  end
end
