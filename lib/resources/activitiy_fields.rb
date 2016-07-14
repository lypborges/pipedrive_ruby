# ActivityFields represent different fields that Activity has.
module PipedriveRuby
  class ActivityFields < PipedriveRuby::Base
    def_delegators :endpoints, :all
  end
end
