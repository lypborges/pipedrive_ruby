require 'spec_helper'

describe 'UserSettings', vcr: true do

  before(:all) do
    client = PipedriveRuby::PipedriveClient.new(ENV['API_TOKEN'])
    @user_settings = client.user_settings
  end

  describe '#all' do
    context 'when success' do
      it 'returns a list of settings' do
        response = @user_settings.all
        expect(response['success']).to be_truthy
        expect(response['data']).to respond_to(:each)
      end
    end
  end # end of all


end # end of UserSettings Resource
