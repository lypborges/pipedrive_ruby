require 'spec_helper'

describe 'HttpFactory' do
  let(:api_client) { PipedriveRuby::PipedriveClient.new(ENV['API_TOKEN'])}
  let(:resource) { api_client.deals}
  let(:valid_http_factory) { PipedriveRuby::HttpFactory.new(resource.class.name,api_client)}

  before(:all) do
  end

  after(:all) do
  end

  describe '#new' do
    context 'when success' do
      it 'have a client' do
        expect(valid_http_factory.client).to be_a_kind_of(PipedriveRuby::PipedriveClient)
      end
    end
  end # end of new


end # end of HttpFactory
