require "codeclimate-test-reporter"
CodeClimate::TestReporter.start
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'webmock/rspec'
require 'pipedrive_ruby'
require 'vcr'
require 'dotenv'
Dotenv.load

WebMock.disable_net_connect!(allow_localhost: true)

port_matcher = lambda do |request_1, request_2|
  URI(request_1.uri).port == URI(request_2.uri).port
end

VCR.configure do |c|
  c.default_cassette_options = { record: :new_episodes, match_requests_on: [:host, :path, :port_matcher] }
  c.allow_http_connections_when_no_cassette = true
  c.cassette_library_dir = './spec/fixtures/.cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!
  c.filter_sensitive_data('<API_KEY>') { ENV['API_TOKEN'] }
end
