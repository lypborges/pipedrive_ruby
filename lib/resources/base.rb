# share commum methods for resources
class Base
  API_URL = "https://api.pipedrive.com/v1"

  def initialize(api_token)
    @api_token = api_token
  end
end
