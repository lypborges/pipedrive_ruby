require 'spec_helper'

describe 'Activities', vcr: true do
  let(:valid_new_activitie) { { :subject => "Nova Atividade", :type => 'call' } }
  let(:invalid_new_activitie) { {:type => "Not exists"} }
  let(:not_found_activitie) { { 'id' => 0 } }

  before(:all) do
    client = PipedriveRuby::PipedriveClient.new(ENV['API_TOKEN'])
    @activities = client.activities
    @activities_response = []
    2.times do |number|
      @activities_response << @activities.create(:subject => "#{number} - Nova Atividade", :type => 'call')
    end
    all = @activities.all
    @activitie = all['data'].first
    @another_activitie = all['data'].last
  end

  after(:all) do
    # delete what left from test on sandbox
    @activities.remove_many(@activities_response)
  end

  describe '#create' do
    context 'when success' do
      it 'return success true' do
        response = @activities.create(valid_new_activitie)
        expect(response['success']).to be_truthy
      end
      it 'return Hash with title inside data' do
        response = @activities.create(valid_new_activitie)
        expect(response['data']['subject']).to be == valid_new_activitie[:subject]
      end
    end

    context 'when fails' do
      it 'return success false' do
        response = @activities.create(invalid_new_activitie)
        expect(response['success']).to be_falsey
      end
    end
  end # end of create

  describe '#all' do
    context 'when success' do
      it 'returns a list of deals' do
        response = @activities.all
        expect(response['success']).to be_truthy
        expect(response['data']).to respond_to(:each)
      end
    end
  end # end of all

  describe '#update' do
    context 'when success' do
      it 'returns success true' do
        updated_activitie = { 'id' => @activitie['id'], 'type' => "email" }
        response = @activities.update(updated_activitie)
        expect(response['success']).to be_truthy
      end
    end

    context 'when not found' do
      it 'returns success false' do
        response = @activities.update(not_found_activitie)
        expect(response['success']).to be_falsey
      end
    end
  end # end of create

  describe '#delete' do
    context 'when success' do
      it 'returns success true' do
        response = @activities.remove(@activitie)
        expect(response['success']).to be_truthy
      end
    end
    context 'when fails' do
      it 'returns success false' do
        response = @activities.remove(not_found_activitie)
        expect(response['success']).to be_falsey
      end
    end
  end # end of delete

  describe '#delete_many' do
    context 'when success' do
      it 'returns success true' do
        response = @activities.remove_many(@activities_response)
        expect(response['success']).to be_truthy
      end
    end
  end # end of delete_many

  describe '#find' do
    context 'when success' do
      it 'returns success true' do
        response = @activities.find(@activitie['id'])
        expect(response['success']).to be_truthy
      end
    end
    context 'when fails' do
      it 'return success false' do
        response = @activities.find(not_found_activitie['id'])
        expect(response['success']).to be_falsey
      end
    end
  end # end of find

end # end of Deals Resource
