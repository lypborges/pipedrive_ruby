# Organizations are companies and other kinds of organizations you are making Deals with.
# Persons can be associated with organizations so that each organization can contain one or more Persons.
class Organizations < Client
    def all
        HTTP.get("#{API_URL}/organizations", params: default_param).parse
    end

    def find(id)
        HTTP.get("#{API_URL}/organizations/#{id}", params: default_param).parse
    end

    def create(organization)
        HTTP.post("#{API_URL}/organizations",
                  params: default_param,
                  json: organization).parse
    end
end
