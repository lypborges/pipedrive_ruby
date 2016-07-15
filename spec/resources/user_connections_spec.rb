require 'spec_helper'

describe 'UserConnections', vcr: true do

  before(:all) do
    client = PipedriveRuby::PipedriveClient.new(ENV['API_TOKEN'])
    @user_connection = client.user_connections
  end

  describe '#all' do
    context 'when success' do
      it 'returns a list of settings' do
        response = @user_connection.all
        expect(response['success']).to be_truthy
        expect(response['data']).to respond_to(:each)
      end
    end
  end # end of all


end # end of UserConnections Resource
