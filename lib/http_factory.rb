module PipedriveRuby
  # responsable for hold all commum endpoints shared between n resources
  class HttpFactory
    extend Forwardable
    include HTTP::Chainable

    attr_reader :client, :base_url, :class_name, :default_param

    def initialize(resource_name, client)
      @client = client
      @class_name = resource_name
      @default_param = { api_token: @client.api_token }
      @base_url = make_base_url
    end

    def add_follower(resource, user)
      custom_post(:path => "#{resource['id']}/followers",
                  :json => {:id => resource['id'], :user_id => user['id'] })
    end

    def all(params={})
      params.merge!(default_param)
      get(base_url, params: params).parse
    end

    def create(resource)
      post("#{base_url}/",
           params: default_param,
           json: resource).parse
    end

    def custom_get(options={})
      options.merge!({:method => :get})
      custom_request(options)
    end

    def custom_post(options={})
      options.merge!({:method => :post})
      custom_request(options)
    end

    def custom_delete(options={})
      options.merge!({:method => :delete})
      custom_request(options)
    end

    def delete_follower(resource, follower)
      custom_delete(:path => "#{resource['id']}/followers/#{follower['id']}",
                  :json => {:id => resource['id'], :user_id => follower['id'] })
    end

    def duplicate(resource)
      post("#{base_url}/#{resource['id']}/duplicate",
           params: default_param).parse
    end

    def find(id)
      custom_get(:path => "#{id}/")
    end

    def find_by(term)
      custom_get(:path => "find/", :params => {:term => term})
    end

    def files(resource)
      custom_get(:path => "#{resource['id']}/files")
    end

    def followers(resource)
      custom_get(:path => "#{resource['id']}/followers")
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

    def permitted_users(resource)
      custom_get(:path => "#{resource['id']}/permittedUsers")
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

    def update(resource)
      put("#{base_url}/#{resource['id']}",
          params: default_param,
          json: resource).parse
    end

    private

    def call_http(path, options={})
      http_method = options[:method]
      params = options[:params]
      case http_method
      when :get
        HTTP.send(http_method, path, params: params).parse
      when :post
        HTTP.send(http_method, path, params: params, json: options[:json]).parse
      when :delete
        HTTP.send(http_method, path, params: params, json: options[:json]).parse
      end
    end

    def custom_request(options={})
      http_method = options[:method]
      return unless [:get, :post, :put, :delete].include? http_method
      options = set_defaults_params(options)
      path = "#{base_url}/".concat(options[:path])
      call_http(path,options)
    end

    def make_base_url
      length = class_name.size
      resource_name =  class_name.split('::').last
      resource = resource_name[0].downcase + resource_name[1, length]
      "#{PipedriveRuby::API_URL}/#{resource}"
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
