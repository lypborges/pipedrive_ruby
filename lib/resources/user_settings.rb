# Lists settings of authorized user.
module PipedriveRuby
  class UserSettings < PipedriveRuby::Base
    def_delegators :endpoints, :all
  end
end
