module PipedriveRuby
  # responsable for hold all commum endpoints shared between n resources
  class HttpFactory
    extend Forwardable
    include HTTP::Chainable

    attr_reader :client, :base_url

    def initialize(resource_name, client)
      @client = client
      @base_url = make_base_url(resource_name)
    end

    def all(params={})
      params.merge!(default_param)
      get(base_url, params: params).parse
    end

    def find(id)
      get("#{base_url}/#{id}", params: default_param).parse
    end

    def create(resource)
      post("#{base_url}/",
           params: default_param,
           json: resource).parse
    end

    def update(resource)
      put("#{base_url}/#{resource['id']}",
          params: default_param,
          json: resource).parse
    end

    def remove(resource)
      delete("#{base_url}/#{resource['id']}",
             params: default_param).parse
    end

    def remove_many(resources)
      ids = []
      resources.each do |resource|
        ids << resource['data']['id']
      end
      delete("#{base_url}/",
             params: default_param,
             json: { ids: ids.join(',') }).parse
    end

    def duplicate(resource)
      post("#{base_url}/#{resource['id']}/duplicate",
           params: default_param).parse
    end

    def merge(resource, merge_with_resource)
      id = resource['id']
      post("#{base_url}/#{id}/merge",
           params: default_param,
           form: {
             id: id,
             merge_with_id: merge_with_resource['id']
           }).parse
    end

    def custom_get(options={})
      default_options = {:method => :get}
      options.merge!(default_options)
      custom_request(options)
    end

    private

    def default_param
      { api_token: @client.api_token }
    end

    def make_base_url(class_name)
      length = class_name.size
      resource_name =  class_name.split('::').last
      resource = resource_name[0].downcase + resource_name[1, length]
      "#{PipedriveRuby::API_URL}/#{resource}"
    end

    def custom_request(options={})
      options = set_defaults_params(options)
      path = "#{base_url}/".concat(options[:path])
      HTTP.send(options[:method], path, params: options[:params]).parse
    end

    def set_defaults_params(options)
      default_options = {:params => default_param}
      params = options[:params]
      if params
        params.merge!(default_options[:params])
      else
        options.merge!(default_options)
      end
      options
    end

  end
end
