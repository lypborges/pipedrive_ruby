require 'spec_helper'

describe 'Webhooks', vcr: true do
  let(:valid_new_webhook) do
    { subscription_url: 'https://requestb.in/r995rnr9', event_action: 'added',
      event_object: 'activity' }
  end
  let(:invalid_new_webhook) { { subscription_url: nil } }
  let(:not_found_webhook) { { 'id' => 0 } }

  before(:all) do
    client = PipedriveRuby::PipedriveClient.new(ENV['API_TOKEN'])
    @webhooks = client.webhooks
    @webhooks_response = []
    2.times do |number|
      @webhooks_response << @webhooks.create({
        subscription_url: 'https://requestb.in/r995rnr9', event_action: 'added',
        event_object: 'activity'
      })
    end
    all = @webhooks.all
    @webhook = all['data'].first
    @another_webhook = all['data'].last
  end

  after(:all) do
    # delete what left from test on sandbox
    @webhooks_response.each do |webhook|
      @webhooks.remove({ id: webhook.id })
    end
  end

  describe '#create' do
    context 'when success' do
      let!(:response) { @webhooks.create(valid_new_webhook) }

      it 'returns success true' do
        expect(response['success']).to be_truthy
      end

      it 'returns Hash with subject inside data' do
        expect(response['data']['subject']).to eq(valid_new_webhook[:subject])
      end
    end

    context 'when fails' do
      it 'returns success false' do
        response = @webhooks.create(invalid_new_webhook)
        expect(response['success']).to be_falsey
      end
    end
  end # end of create

  describe '#all' do
    context 'when success' do
      it 'returns a list of deals' do
        response = @webhooks.all
        expect(response['success']).to be_truthy
        expect(response['data']).to respond_to(:each)
      end
    end
  end # end of all

  describe '#delete' do
    context 'when success' do
      it 'returns success true' do
        response = @webhooks.remove(@webhook)
        expect(response['success']).to be_truthy
      end
    end
    context 'when fails' do
      it 'returns success false' do
        response = @webhooks.remove(not_found_webhook)
        expect(response['success']).to be_falsey
      end
    end
  end # end of delete

end # end of Deals Resource
