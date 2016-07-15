# Authorization objects can be fetched without an API token but using an email and password.
# Fetching the Authorization objects essentially allows you to authorize users based on their login credentials and retrieve the underlying API tokens associated with the given user.
# Note that any given user an Authorization object per each company he/she belongs to.
module PipedriveRuby
  # Returns all authorizations for a particular user.
  # Authorization objects contain the API tokens the user has with different company accounts in Pipedrive. These can be fetched without an API token but using the email and password of the user.
  class Authorizations < PipedriveRuby::Base

    def all
      create
    end

    def_delegators :endpoints, :create
  end
end
