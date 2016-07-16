module PipedriveRuby
# Lists settings of authorized user.
  class UserSettings < PipedriveRuby::Base
    def_delegators :endpoints, :all
  end
end
