# share commum methods for resources
module PipedriveRuby
  class PipedriveClient

    def initialize(api_token)
        @api_token = api_token
    end

    def default_param
        { api_token: @api_token }
    end

    def method_missing(method)
      class_name = "PipedriveRuby::" + method.to_s.capitalize
      Object.const_get(class_name).new(self)
    rescue NoMethodError
      puts "#{method} class not found"
    end
  end
end
