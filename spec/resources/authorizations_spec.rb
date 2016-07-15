require 'spec_helper'

describe 'Authorizations', vcr: true do
  let(:valid_authorization) { { :email => ENV['EMAIL'], :password => ENV['PASSWORD'] } }
  let(:invalid_authorization) { { :email => "any@anyhost.com", :password => "000000" } }

  before(:all) do
    client = PipedriveRuby::PipedriveClient.new(ENV['API_TOKEN'])
    @authorizations = client.authorizations
  end

  describe '#all' do
    context 'when success' do
      it 'return success true' do
        response = @authorizations.all(valid_authorization)
        expect(response['success']).to be_truthy
      end
      it 'return Hash with user_id inside data' do
        response = @authorizations.all(valid_authorization)
        expect(response['data']).to respond_to(:each)
      end
    end

    context 'when fails' do
      it 'return success false' do
        response = @authorizations.all(invalid_authorization)
        expect(response['success']).to be_falsey
      end
    end
  end # end of all


end # end of Deals Resource
