require 'spec_helper'

describe 'PushNotifications', vcr: true do
  let(:valid_push_notifications) { { :subscription_url => "http://meuwebhook.com.br", :event => 'deleted.persons' } }
  let(:invalid_push_notifications) { {:event => "deleted.persons"} }
  let(:not_found_push_notifications) { { 'id' => 0 } }

  before(:all) do
    client = PipedriveRuby::PipedriveClient.new(ENV['API_TOKEN'])
    @push_notifications = client.push_notifications
    @push_notifications_response = []
    2.times do |number|
      @push_notifications_response << @push_notifications.create(:subscription_url => "http://meuwebhook.com.br/#{number}", :event => 'deleted.persons')
    end
    all = @push_notifications.all
    @push_notification = all['data'].first
  end

  after(:all) do
    # delete what left from test on sandbox
    @push_notifications.remove_many(@push_notifications_response)
  end

  describe '#create' do
    context 'when success' do
      it 'return success true' do
        response = @push_notifications.create(valid_push_notifications)
        expect(response['success']).to be_truthy
      end
      it 'return Hash with subscription_url inside data' do
        response = @push_notifications.create(valid_push_notifications)
        expect(response['data']['subscription_url']).to be == valid_push_notifications[:subscription_url]
      end
    end

    context 'when fails' do
      it 'return success false' do
        response = @push_notifications.create(invalid_push_notifications)
        expect(response['success']).to be_falsey
      end
    end
  end # end of create

  describe '#all' do
    context 'when success' do
      it 'returns a list of deals' do
        response = @push_notifications.all
        expect(response['success']).to be_truthy
        expect(response['data']).to respond_to(:each)
      end
    end
  end # end of all

  describe '#delete' do
    context 'when success' do
      it 'returns success true' do
        response = @push_notifications.remove(@push_notification)
        expect(response['success']).to be_truthy
      end
    end
    context 'when fails' do
      it 'returns success false' do
        response = @push_notifications.remove(not_found_push_notifications)
        expect(response['success']).to be_falsey
      end
    end
  end # end of delete

  describe '#find' do
    context 'when success' do
      it 'returns success true' do
        response = @push_notifications.find(@push_notification['id'])
        expect(response['success']).to be_truthy
      end
    end
    context 'when fails' do
      it 'return success false' do
        response = @push_notifications.find(not_found_push_notifications['id'])
        expect(response['success']).to be_falsey
      end
    end
  end # end of find

end # end of PushNotifications Resource
