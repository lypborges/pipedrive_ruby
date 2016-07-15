# Manage user connections. For example, google.
module PipedriveRuby
  # Returns data about all connections for authorized user.
  class UserConnections < PipedriveRuby::Base
    def_delegators :endpoints, :all
  end
end
