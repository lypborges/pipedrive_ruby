require 'spec_helper'

describe 'HttpFactory' do
  let(:api_client) { PipedriveRuby::PipedriveClient.new(ENV['API_TOKEN'])}
  let(:invalid_api_client) { PipedriveRuby::PipedriveClient.new(ENV['INVALID_API_TOKEN'])}
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

  describe '#parse_response' do
    context 'when success' do
      it 'have success true' do
        response = resource.all
        expect(response['success']).to be_truthy
      end
    end

    context 'when fails' do
      it 'have struct with success equal false' do
        response = invalid_api_client.deals.all
        expect(response['success']).to be_falsey
      end
    end
  end

end # end of HttpFactory
