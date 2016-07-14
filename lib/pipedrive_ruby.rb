require 'pipedrive_ruby/version'
require 'http'
require 'byebug'
require 'pipedrive_client'
require 'http_factory'

require 'resources/base'
require 'resources/deals'
require 'resources/organizations'

# If you need to use the PipedriveAPI
# https://developers.pipedrive.com/v1
module PipedriveRuby
  API_URL = 'https://api.pipedrive.com/v1'.freeze
end
