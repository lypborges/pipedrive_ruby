require 'spec_helper'

describe 'Currencies', vcr: true do

  before(:all) do
    client = PipedriveRuby::PipedriveClient.new(ENV['API_TOKEN'])
    @currencies = client.Currencies
  end

  describe '#all' do
    context 'when success' do
      it 'return success true' do
        response = @currencies.all
        expect(response['success']).to be_truthy
      end
      it 'return Hash with user_id inside data' do
        response = @currencies.all
        expect(response['data']).to respond_to(:each)
      end
    end

  end # end of all


end # end of Currencies Resource
