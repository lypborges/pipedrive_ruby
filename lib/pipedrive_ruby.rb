require 'pipedrive_ruby/version'
require 'http'
require 'byebug'
require 'pipedrive_client'
require 'http_factory'
require 'resources/base'

require 'resources/deals'
require 'resources/organizations'
require 'resources/activities'
require 'resources/activitiy_fields'
require 'resources/activity_types'
require 'resources/authorizations'
require 'resources/currencies'

# TODO (Felipe Borges Ferreira)
require 'resources/deals_fields'
require 'resources/email_messages'
require 'resources/email_threads'
require 'resources/files'
require 'resources/global_messages'
require 'resources/goals'
require 'resources/note_fields'
require 'resources/notes'
require 'resources/organization_fields'
require 'resources/organization_relationships'
require 'resources/permission_sets'
require 'resources/person_fields'
require 'resources/persons'
require 'resources/pipelines'
require 'resources/product_fields'
require 'resources/products'

require 'resources/push_notifications'

require 'resources/recents'
require 'resources/roles'
require 'resources/search_results'
require 'resources/stages'
require 'resources/user_connections'
#
require 'resources/user_settings'
require 'resources/users'

# If you need to use the PipedriveAPI
# https://developers.pipedrive.com/v1
module PipedriveRuby
  API_URL = 'https://api.pipedrive.com/v1'.freeze
end
