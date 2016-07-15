require 'spec_helper'

describe 'ActivityFields', vcr: true do

  before(:all) do
    client = PipedriveRuby::PipedriveClient.new(ENV['API_TOKEN'])
    @activity_fields = client.activity_fields
  end

  describe '#all' do
    context 'when success' do
      it 'returns a list of activity_fields' do
        response = @activity_fields.all
        expect(response['success']).to be_truthy
        expect(response['data']).to respond_to(:each)
      end
    end
  end # end of all


end # end of ActivityFields Resource
