require 'spec_helper'

describe 'PipedriveClient' do
  let(:api_client) { PipedriveRuby::PipedriveClient.new(ENV['API_TOKEN'])}

  before(:all) do
  end

  after(:all) do
  end

  describe '#new' do
    context 'when success' do
      it 'have a api_token' do
        expect(api_client.api_token).to be_truthy
      end
    end
  end # end of new

  describe '#method_missing' do
    context 'when success' do
      it 'have a valid resource' do
        expect(api_client.deals).to be_a_kind_of(PipedriveRuby::Deals)
      end
    end
    context 'when fails' do
      it 'rescue NameError' do
        expect(api_client.invalid_method).to eq("invalid_method class not found")
      end
    end
   end # end of new


end # end of HttpFactory
