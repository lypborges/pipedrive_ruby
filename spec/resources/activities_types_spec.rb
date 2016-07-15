require 'spec_helper'

describe 'ActivityTypes', vcr: true do
  let(:valid_new_activitie) { { :name => "New Activity_type", :color => nil } }
  let(:invalid_new_activitie) { {:color => "Not exists"} }
  let(:not_found_activitie) { { 'id' => 0 } }

  before(:all) do
    client = PipedriveRuby::PipedriveClient.new(ENV['API_TOKEN'])
    @activity_types = client.activity_types
    @activity_types_response = []
    2.times do |number|
      @activity_types_response << @activity_types.create(:name => "#{number} - New Activity_type", :color => nil)
    end
    all = @activity_types.all
    @activity_type = all['data'].first
    @another_activitie = all['data'].last
  end

  after(:all) do
    # delete what left from test on sandbox
    @activity_types.remove_many(@activity_types_response)
  end

  describe '#create' do
    context 'when success' do
      it 'return success true' do
        response = @activity_types.create(valid_new_activitie)
        expect(response['success']).to be_truthy
      end
      it 'return Hash with title inside data' do
        response = @activity_types.create(valid_new_activitie)
        expect(response['data']['name']).to be == valid_new_activitie[:name]
      end
    end

    context 'when fails' do
      it 'return success false' do
        response = @activity_types.create(invalid_new_activitie)
        expect(response['success']).to be_falsey
      end
    end
  end # end of create

  describe '#all' do
    context 'when success' do
      it 'returns a list of deals' do
        response = @activity_types.all
        expect(response['success']).to be_truthy
        expect(response['data']).to respond_to(:each)
      end
    end
  end # end of all

  describe '#update' do
    context 'when success' do
      it 'returns success true' do
        updated_activitie = { 'id' => @activity_type['id'], 'type' => "email" }
        response = @activity_types.update(updated_activitie)
        expect(response['success']).to be_truthy
      end
    end

    context 'when not found' do
      it 'returns success false' do
        response = @activity_types.update(not_found_activitie)
        expect(response['success']).to be_falsey
      end
    end
  end # end of create

  describe '#delete' do
    context 'when success' do
      it 'returns success true' do
        response = @activity_types.remove(@activity_type)
        expect(response['success']).to be_truthy
      end
    end
    context 'when fails' do
      it 'returns success false' do
        response = @activity_types.remove(not_found_activitie)
        expect(response['success']).to be_falsey
      end
    end
  end # end of delete

  describe '#delete_many' do
    context 'when success' do
      it 'returns success true' do
        response = @activity_types.remove_many(@activity_types_response)
        expect(response['success']).to be_truthy
      end
    end
  end # end of delete_many


end # end of Deals Resource
