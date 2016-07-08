module PipedriveRuby
  # responsable for hold all commum endpoints shared between n resources
  class SharedEndpoints
    extend Forwardable
    include HTTP::Chainable

    def initialize(resource_name, client)
      @client = client
      @resource = resource_name.split('::').last
      @resource.downcase!
      @base_url = "#{API_URL}/#{@resource}"
      end

    def all
      get(@base_url.to_s, params: default_param).parse
      end

    def find(id)
      get("#{@base_url}/#{id}", params: default_param).parse
      end

    def create(resource)
      post("#{@base_url}/",
           params: default_param,
           json: resource).parse
      end

    def update(resource)
      put("#{@base_url}/#{resource['id']}",
          params: default_param,
          json: resource).parse
      end

    def remove(resource)
      delete("#{@base_url}/#{resource['id']}",
             params: default_param).parse
      end

    def remove_many(resources)
      ids = []
      resources.each do |resource|
        ids << resource['data']['id']
      end
      delete("#{@base_url}/",
             params: default_param,
             json: { ids: ids.join(',') }).parse
      end

    def duplicate(resource)
      post("#{@base_url}/#{resource['id']}/duplicate",
           params: default_param).parse
      end

    def merge(resource, merge_with_resource)
      id = resource['id']
      post("#{@base_url}/#{id}/merge",
           params: default_param,
           form: {
             id: id,
             merge_with_id: merge_with_resource['id']
           }).parse
      end

    def_delegators :@client, :default_param
  end
end
