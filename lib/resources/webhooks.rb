# Manage subscriptions of push notifications / web hooks / REST hooks about data changes.
# A subscription means a designated HTTP(S) endpoint which will receive a request every time a certain event happens on your Pipedrive account.
# E.g. when you have subscribed to receive events about all new deals ('deal.added'), this HTTP(S) will receive a request per each such event.
# See https://app.pipedrive.com/push_notifications#dialog:/push_notifications/help for detailed documentation of web hooks.
module PipedriveRuby
  # Returns data about all subscriptions.
  class Webhooks < PipedriveRuby::Base
    def_delegators :endpoints, :all, :create, :remove
  end
end
