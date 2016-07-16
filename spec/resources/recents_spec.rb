require 'spec_helper'

describe 'Recents', vcr: true do

  before(:all) do
    client = PipedriveRuby::PipedriveClient.new(ENV['API_TOKEN'])
    @recents = client.recents
  end

  describe '#all' do
    context 'when success' do
      it 'returns a list of recent changes' do
        response = @recents.all({:since_timestamp => '2016-06-01'})
        expect(response['success']).to be_truthy
        expect(response['data']).to respond_to(:each)
      end
    end
  end # end of all


end # end of Recents Resource
